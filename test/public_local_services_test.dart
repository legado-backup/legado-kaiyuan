import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:xxread/services/books/book_dao.dart';
import 'package:xxread/services/books/book_import_models.dart';
import 'package:xxread/services/books/book_import_service.dart';
import 'package:xxread/services/books/web_book_file_store.dart';
import 'package:xxread/services/core/database_service.dart';
import 'package:xxread/services/reading/reading_stats_dao.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory sandbox;
  late Database database;
  late BookDao bookDao;
  late BookImportService importer;

  setUpAll(sqfliteFfiInit);

  setUp(() async {
    sandbox = await Directory.systemTemp.createTemp('public-local-services-');
    database = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    await _createLocalSchema(database);
    bookDao = BookDao(
      database: () async => database,
      documentsDirectory: () async => sandbox,
    );
    importer = BookImportService(
      store: bookDao,
      documentsDirectory: () async => sandbox,
    );
  });

  tearDown(() async {
    await database.close();
    if (await sandbox.exists()) await sandbox.delete(recursive: true);
  });

  test('imports a real TXT file into managed storage and SQLite', () async {
    final source = File(path.join(sandbox.path, 'outside', 'local.txt'));
    await source.parent.create(recursive: true);
    await source.writeAsString('第一章 开始\n\n这是完全本地的阅读内容。');

    final result = await importer.importFile(
      _sourceFor(source, extension: 'txt'),
    );

    expect(result.outcome, BookImportOutcome.imported);
    expect(result.book.id, isPositive);
    expect(result.book.format, 'TXT');
    expect(result.book.textEncoding, isNotEmpty);
    expect(result.book.contentHash, hasLength(32));
    expect(result.book.filePath, startsWith(path.join(sandbox.path, 'books')));
    expect(await File(result.book.filePath).readAsString(), contains('完全本地'));

    final stored = await bookDao.getBookById(result.book.id!);
    expect(stored?.title, 'local');
    expect(stored?.contentHash, result.book.contentHash);
  });

  test('imports real EPUB metadata and persists the local book', () async {
    final source = File(path.join(sandbox.path, 'outside', 'fixture.epub'));
    await source.parent.create(recursive: true);
    await source.writeAsBytes(_minimalEpub());

    final result = await importer.importFile(
      _sourceFor(source, extension: 'epub'),
    );

    expect(result.outcome, BookImportOutcome.imported);
    expect(result.book.title, 'Local EPUB');
    expect(result.book.author, 'Local Author');
    expect(result.book.format, 'EPUB');
    expect(await File(result.book.filePath).exists(), isTrue);
    expect((await bookDao.getAllBooks()).single.title, 'Local EPUB');
  });

  test(
    'materializes fresh Web picker bytes before inserting the book',
    () async {
      final bytes = Uint8List.fromList(utf8.encode('第一章\n浏览器本地书籍'));
      final hash = md5.convert(bytes).toString();
      final virtualPath = WebBookFileStore.pathForHash(hash);
      final webFiles = WebBookFileStore(database: () async => database);
      expect(await webFiles.exists(virtualPath), isFalse);
      await database.execute('''
      CREATE TRIGGER require_web_file_before_book_insert
      BEFORE INSERT ON books
      WHEN NEW.filePath LIKE 'web-book://%'
        AND NOT EXISTS(
          SELECT 1 FROM web_book_files
          WHERE 'web-book://' || content_hash = NEW.filePath
        )
      BEGIN
        SELECT RAISE(ABORT, 'web bytes must exist before book insert');
      END
    ''');
      final webImporter = BookImportService(
        store: bookDao,
        documentsDirectory: () async => sandbox,
        webBookFileStore: webFiles,
      );
      final source = BookImportSource.withBytes(
        id: 'fresh-picker-file',
        kind: BookImportSourceKind.filePicker,
        ownership: BookImportOwnership.externalCopy,
        displayName: 'browser.txt',
        extension: 'txt',
        locator: 'browser.txt',
        bytes: bytes,
      );

      final result = await webImporter.importFile(source);

      expect(result.outcome, BookImportOutcome.imported);
      expect(result.source.localPath, virtualPath);
      expect(result.book.filePath, virtualPath);
      expect(result.book.contentHash, hash);
      expect(await webFiles.read(virtualPath), bytes);
      expect((await bookDao.getBookByHash(hash))?.filePath, virtualPath);
      expect(
        (await webImporter.importFile(source)).outcome,
        BookImportOutcome.duplicateSkipped,
      );
    },
  );

  test(
    'records local reading sessions and summarizes their duration',
    () async {
      final dao = ReadingStatsDao(databaseProvider: () async => database);
      final now = DateTime.now();
      final end = DateTime(now.year, now.month, now.day, 12, 3);
      final start = end.subtract(const Duration(minutes: 3));

      await dao.recordReadingSession(
        startTime: start,
        endTime: end,
        pagesRead: 4,
      );

      final summary = await dao.getSummaryStats();
      expect(summary['total'], 180);
      expect(summary['today'], 180);
      expect(summary['week'], 180);
      final sessions = await database.query('reading_sessions');
      expect(sessions.single['pagesRead'], 4);
    },
  );

  test(
    'upgrades legacy local books and annotations without remote schema',
    () async {
      final legacy = await databaseFactoryFfi.openDatabase(
        path.join(sandbox.path, 'legacy.db'),
      );
      addTearDown(legacy.close);
      await legacy.execute('''
      CREATE TABLE books(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        author TEXT NOT NULL,
        filePath TEXT NOT NULL,
        format TEXT NOT NULL,
        currentPage INTEGER NOT NULL DEFAULT 0,
        importDate INTEGER NOT NULL
      )
    ''');
      await legacy.execute('''
      CREATE TABLE book_notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        book_id INTEGER NOT NULL,
        content TEXT NOT NULL,
        cfi TEXT NOT NULL,
        chapter TEXT NOT NULL,
        type TEXT NOT NULL,
        color TEXT NOT NULL,
        update_time TEXT NOT NULL
      )
    ''');
      await legacy.insert('book_notes', <String, Object?>{
        'book_id': 1,
        'content': 'legacy note',
        'cfi': '/6/2',
        'chapter': 'One',
        'type': 'highlight',
        'color': '#FFFF00',
        'update_time': '2026-10-03T00:00:00.000',
      });

      await upgradeLocalDatabaseSchema(legacy);

      final bookColumns = await legacy.rawQuery('PRAGMA table_info(books)');
      expect(bookColumns.map((row) => row['name']), contains('content_hash'));
      final note = (await legacy.query('book_notes')).single;
      expect(note['annotation_id'], isNotEmpty);
      expect(
        note.keys,
        containsAll(<String>['canonical_locator', 'payload_json']),
      );
      final localTables = (await legacy.rawQuery(
        "SELECT name FROM sqlite_master WHERE type = 'table'",
      )).map((row) => row['name']).toSet();
      expect(
        localTables,
        containsAll(<String>{
          'books',
          'bookmarks',
          'book_notes',
          'reading_stats',
          'reading_sessions',
          'reader_pagination_cache',
        }),
      );
      expect(
        localTables.where(
          (name) => RegExp(
            r'(account|cloud|sync|source|webdav)',
            caseSensitive: false,
          ).hasMatch(name.toString()),
        ),
        isEmpty,
      );
    },
  );
}

BookImportSource _sourceFor(File file, {required String extension}) =>
    BookImportSource(
      id: file.path,
      kind: BookImportSourceKind.filePicker,
      ownership: BookImportOwnership.externalCopy,
      displayName: path.basename(file.path),
      extension: extension,
      locator: file.path,
      localPath: file.path,
    );

Future<void> _createLocalSchema(Database database) async {
  await database.execute('''
    CREATE TABLE books(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      author TEXT NOT NULL DEFAULT 'Unknown',
      filePath TEXT NOT NULL,
      format TEXT NOT NULL,
      currentPage INTEGER NOT NULL DEFAULT 0,
      totalPages INTEGER NOT NULL DEFAULT 1,
      reading_progress REAL,
      importDate INTEGER NOT NULL,
      cached_content TEXT,
      cached_pages TEXT,
      file_modified_time INTEGER,
      content_hash TEXT UNIQUE,
      table_of_contents TEXT,
      cover_image_path TEXT,
      text_encoding TEXT,
      last_canonical_locator TEXT,
      last_rendered_locator TEXT,
      layout_signature TEXT
    )
  ''');
  await database.execute('''
    CREATE TABLE reading_stats(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      date TEXT NOT NULL UNIQUE,
      durationInSeconds INTEGER NOT NULL DEFAULT 0
    )
  ''');
  await database.execute('''
    CREATE TABLE reading_sessions(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      date TEXT NOT NULL,
      bookId INTEGER,
      startTimeMs INTEGER NOT NULL,
      endTimeMs INTEGER NOT NULL,
      durationInSeconds INTEGER NOT NULL,
      pagesRead INTEGER NOT NULL DEFAULT 0
    )
  ''');
}

List<int> _minimalEpub() {
  final archive = Archive()
    ..addFile(ArchiveFile.string('mimetype', 'application/epub+zip'))
    ..addFile(
      ArchiveFile.string('META-INF/container.xml', '''<?xml version="1.0"?>
<container xmlns="urn:oasis:names:tc:opendocument:xmlns:container" version="1.0">
  <rootfiles><rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/></rootfiles>
</container>'''),
    )
    ..addFile(
      ArchiveFile.string(
        'OEBPS/content.opf',
        '''<?xml version="1.0" encoding="UTF-8"?>
<package xmlns="http://www.idpf.org/2007/opf" version="3.0" unique-identifier="book-id">
  <metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
    <dc:identifier id="book-id">local-fixture</dc:identifier>
    <dc:title>Local EPUB</dc:title>
    <dc:creator>Local Author</dc:creator>
    <dc:language>en</dc:language>
  </metadata>
  <manifest><item id="chapter" href="chapter.xhtml" media-type="application/xhtml+xml"/></manifest>
  <spine><itemref idref="chapter"/></spine>
</package>''',
      ),
    )
    ..addFile(
      ArchiveFile.string(
        'OEBPS/chapter.xhtml',
        '''<?xml version="1.0" encoding="UTF-8"?>
<html xmlns="http://www.w3.org/1999/xhtml"><body><h1>Chapter</h1><p>Local EPUB content.</p></body></html>''',
      ),
    );
  return ZipEncoder().encode(archive)!;
}
