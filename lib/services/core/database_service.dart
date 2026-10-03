import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import '../../data/migration/book_note_lookup_index_migration.dart';
import '../../data/migration/pagination_cache_schema_migration.dart';
import '../../data/migration/reader_annotation_schema_migration.dart';

/// Local SQLite ownership for the public reader.
class DatabaseService {
  DatabaseService._internal();

  factory DatabaseService() => _instance;

  static final DatabaseService _instance = DatabaseService._internal();
  static const String _dbName = 'xxread_v2.db';
  static const int _dbVersion = 27;
  static Database? _database;
  static Future<Database>? _openingDatabase;

  Future<Database> get database async {
    final current = _database;
    if (current != null) {
      try {
        await current.rawQuery('SELECT 1');
        return current;
      } catch (_) {
        _database = null;
      }
    }
    final opening = _openingDatabase;
    if (opening != null) return opening;
    final future = _open();
    _openingDatabase = future;
    try {
      return _database = await future;
    } finally {
      _openingDatabase = null;
    }
  }

  Future<Database> _open() async {
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    final String databasePath;
    if (kIsWeb) {
      databasePath = _dbName;
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      databasePath = join(
        (await getApplicationDocumentsDirectory()).path,
        _dbName,
      );
    } else {
      databasePath = join(await getDatabasesPath(), _dbName);
    }

    return openDatabase(
      databasePath,
      version: _dbVersion,
      onConfigure: (db) => db.execute('PRAGMA foreign_keys = ON'),
      onCreate: (db, _) => _createLocalSchema(db),
      onUpgrade: (db, _, _) => upgradeLocalDatabaseSchema(db),
    );
  }

  Future<void> _createLocalSchema(Database db) async {
    await db.transaction((txn) async {
      await txn.execute('''
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
          content_hash TEXT,
          table_of_contents TEXT,
          cover_image_path TEXT,
          text_encoding TEXT,
          last_canonical_locator TEXT,
          last_rendered_locator TEXT,
          layout_signature TEXT
        )
      ''');
      await txn.execute(
        'CREATE UNIQUE INDEX idx_books_content_hash '
        'ON books(content_hash) WHERE content_hash IS NOT NULL',
      );
      await txn.execute('''
        CREATE TABLE bookmarks(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          bookId INTEGER NOT NULL,
          pageNumber INTEGER NOT NULL,
          note TEXT NOT NULL DEFAULT '',
          createDate INTEGER NOT NULL,
          cfi TEXT,
          canonical_locator TEXT,
          anchor_key TEXT,
          chapter_index INTEGER,
          chapter_title TEXT,
          excerpt TEXT,
          FOREIGN KEY(bookId) REFERENCES books(id) ON DELETE CASCADE
        )
      ''');
      await txn.execute(
        'CREATE INDEX idx_bookmarks_book_page ON bookmarks(bookId, pageNumber)',
      );
      await txn.execute(
        'CREATE UNIQUE INDEX idx_bookmarks_anchor '
        'ON bookmarks(bookId, anchor_key) WHERE anchor_key IS NOT NULL',
      );
      await txn.execute('''
        CREATE TABLE book_notes(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          annotation_id TEXT NOT NULL UNIQUE,
          book_id INTEGER NOT NULL,
          content TEXT NOT NULL,
          cfi TEXT NOT NULL,
          canonical_locator TEXT,
          payload_json TEXT,
          chapter TEXT NOT NULL,
          type TEXT NOT NULL,
          color TEXT NOT NULL,
          reader_note TEXT,
          page_number INTEGER,
          start_offset INTEGER,
          end_offset INTEGER,
          create_time TEXT,
          update_time TEXT NOT NULL,
          FOREIGN KEY(book_id) REFERENCES books(id) ON DELETE CASCADE
        )
      ''');
      await txn.execute(
        'CREATE INDEX idx_book_notes_book_cfi_id '
        'ON book_notes(book_id, cfi, id DESC)',
      );
      await txn.execute('''
        CREATE TABLE reading_stats(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          date TEXT NOT NULL UNIQUE,
          durationInSeconds INTEGER NOT NULL DEFAULT 0
        )
      ''');
      await txn.execute('''
        CREATE TABLE reading_sessions(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          date TEXT NOT NULL,
          bookId INTEGER,
          startTimeMs INTEGER NOT NULL,
          endTimeMs INTEGER NOT NULL,
          durationInSeconds INTEGER NOT NULL,
          pagesRead INTEGER NOT NULL DEFAULT 0,
          FOREIGN KEY(bookId) REFERENCES books(id) ON DELETE SET NULL
        )
      ''');
      await txn.execute(
        'CREATE INDEX idx_reading_sessions_date ON reading_sessions(date)',
      );
      await txn.execute(
        'CREATE INDEX idx_reading_sessions_book_end '
        'ON reading_sessions(bookId, endTimeMs DESC)',
      );
      await txn.execute('''
        CREATE TABLE reader_pagination_cache(
          cache_identity TEXT NOT NULL,
          book_id INTEGER,
          book_revision TEXT NOT NULL,
          layout_fingerprint TEXT NOT NULL,
          chapter_index INTEGER NOT NULL,
          payload BLOB NOT NULL,
          updated_at INTEGER NOT NULL,
          PRIMARY KEY(cache_identity, book_revision, layout_fingerprint),
          FOREIGN KEY(book_id) REFERENCES books(id) ON DELETE CASCADE
        )
      ''');
      await txn.execute(
        'CREATE INDEX idx_reader_pagination_cache_pruning '
        'ON reader_pagination_cache(updated_at DESC)',
      );
    });
  }

  Future<void> close() async {
    final db = _database;
    _database = null;
    if (db != null) await db.close();
  }
}

/// Brings older installations forward while touching only local reader data.
@visibleForTesting
Future<void> upgradeLocalDatabaseSchema(Database db) async {
  Future<Set<String>> columns(String table) async => (await db.rawQuery(
    'PRAGMA table_info($table)',
  )).map((row) => row['name']! as String).toSet();

  Future<void> addMissingColumns(
    String table,
    Map<String, String> definitions,
  ) async {
    final existing = await columns(table);
    for (final entry in definitions.entries) {
      if (!existing.contains(entry.key)) {
        await db.execute(
          'ALTER TABLE $table ADD COLUMN ${entry.key} ${entry.value}',
        );
      }
    }
  }

  await addMissingColumns('books', const <String, String>{
    'totalPages': 'INTEGER NOT NULL DEFAULT 1',
    'reading_progress': 'REAL',
    'cached_content': 'TEXT',
    'cached_pages': 'TEXT',
    'file_modified_time': 'INTEGER',
    'content_hash': 'TEXT',
    'table_of_contents': 'TEXT',
    'cover_image_path': 'TEXT',
    'text_encoding': 'TEXT',
    'last_canonical_locator': 'TEXT',
    'last_rendered_locator': 'TEXT',
    'layout_signature': 'TEXT',
  });

  await db.execute('''
    CREATE TABLE IF NOT EXISTS bookmarks(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      bookId INTEGER NOT NULL,
      pageNumber INTEGER NOT NULL,
      note TEXT NOT NULL DEFAULT '',
      createDate INTEGER NOT NULL,
      cfi TEXT,
      canonical_locator TEXT,
      anchor_key TEXT,
      chapter_index INTEGER,
      chapter_title TEXT,
      excerpt TEXT,
      FOREIGN KEY(bookId) REFERENCES books(id) ON DELETE CASCADE
    )
  ''');
  await addMissingColumns('bookmarks', const <String, String>{
    'note': "TEXT NOT NULL DEFAULT ''",
    'cfi': 'TEXT',
    'canonical_locator': 'TEXT',
    'anchor_key': 'TEXT',
    'chapter_index': 'INTEGER',
    'chapter_title': 'TEXT',
    'excerpt': 'TEXT',
  });

  await db.execute('''
    CREATE TABLE IF NOT EXISTS book_notes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      annotation_id TEXT NOT NULL UNIQUE,
      book_id INTEGER NOT NULL,
      content TEXT NOT NULL,
      cfi TEXT NOT NULL,
      canonical_locator TEXT,
      payload_json TEXT,
      chapter TEXT NOT NULL,
      type TEXT NOT NULL,
      color TEXT NOT NULL,
      reader_note TEXT,
      page_number INTEGER,
      start_offset INTEGER,
      end_offset INTEGER,
      create_time TEXT,
      update_time TEXT NOT NULL,
      FOREIGN KEY(book_id) REFERENCES books(id) ON DELETE CASCADE
    )
  ''');
  await addMissingColumns('book_notes', const <String, String>{
    'canonical_locator': 'TEXT',
  });
  await ReaderAnnotationSchemaMigration.migrate(db);

  await db.execute('''
    CREATE TABLE IF NOT EXISTS reading_stats(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      date TEXT NOT NULL,
      durationInSeconds INTEGER NOT NULL DEFAULT 0
    )
  ''');
  await db.execute('''
    CREATE TABLE IF NOT EXISTS reading_sessions(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      date TEXT NOT NULL,
      bookId INTEGER,
      startTimeMs INTEGER NOT NULL,
      endTimeMs INTEGER NOT NULL,
      durationInSeconds INTEGER NOT NULL,
      pagesRead INTEGER NOT NULL DEFAULT 0,
      FOREIGN KEY(bookId) REFERENCES books(id) ON DELETE SET NULL
    )
  ''');

  await db.execute(
    'CREATE UNIQUE INDEX IF NOT EXISTS idx_books_content_hash '
    'ON books(content_hash) WHERE content_hash IS NOT NULL',
  );
  await db.execute(
    'CREATE INDEX IF NOT EXISTS idx_bookmarks_book_page '
    'ON bookmarks(bookId, pageNumber)',
  );
  await db.execute(
    'CREATE UNIQUE INDEX IF NOT EXISTS idx_bookmarks_anchor '
    'ON bookmarks(bookId, anchor_key) WHERE anchor_key IS NOT NULL',
  );
  await db.execute(
    'CREATE INDEX IF NOT EXISTS idx_reading_sessions_date '
    'ON reading_sessions(date)',
  );
  await db.execute(
    'CREATE INDEX IF NOT EXISTS idx_reading_sessions_book_end '
    'ON reading_sessions(bookId, endTimeMs DESC)',
  );
  await BookNoteLookupIndexMigration.migrate(db);
  await PaginationCacheSchemaMigration.migrate(db);
}
