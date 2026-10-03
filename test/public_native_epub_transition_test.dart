import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:archive/archive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xxread/core/reader/reader_layout.dart';
import 'package:xxread/core/reader/reader_settings.dart';
import 'package:xxread/l10n/app_localizations.dart';
import 'package:xxread/models/book.dart';
import 'package:xxread/pages/reader/native/native_reader_page.dart';
import 'package:xxread/widgets/reader_paper_page_leaf.dart';

import 'support/public_reader_test_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory supportDirectory;

  setUpAll(() {
    supportDirectory = Directory.systemTemp.createTempSync(
      'origo-public-epub-support-',
    );
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (_) async => supportDirectory.path,
        );
  });

  tearDownAll(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          null,
        );
    supportDirectory.deleteSync(recursive: true);
  });

  testWidgets('local EPUB turns across chapters with one page controller', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    await tester.binding.setSurfaceSize(const Size(480, 800));
    SharedPreferences.setMockInitialValues({
      ReaderSettingsStore.pageModeKey: ReaderPageMode.horizontalSlide.name,
      ReaderSettingsStore.chapterTitlePageKey: false,
    });
    final directory = Directory.systemTemp.createTempSync(
      'origo-public-epub-transition-',
    );
    final epub = File('${directory.path}/transition.epub')
      ..writeAsBytesSync(_epubFixture());

    try {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: NativeReaderPage(
            book: Book(
              title: 'Local EPUB fixture',
              filePath: epub.path,
              format: 'epub',
              fileModifiedTime: epub.lastModifiedSync().millisecondsSinceEpoch,
            ),
            paginationCacheDao: MemoryPaginationCacheDao(),
          ),
        ),
      );
      await tester.runAsync(() async {
        for (var attempt = 0; attempt < 80; attempt++) {
          await Future<void>.delayed(const Duration(milliseconds: 40));
          await tester.pump();
          if (find.byType(PageView).evaluate().isNotEmpty) return;
        }
      });
      await pumpUntil(
        tester,
        () => find.byType(PageView).evaluate().isNotEmpty,
        state: 'EPUB page view',
      );

      final pageView = find.byType(PageView);
      final controller = tester.widget<PageView>(pageView).controller!;
      await pumpUntil(
        tester,
        () => _pageIndexesForChapter(tester, pageView, 'Chapter 2').isNotEmpty,
        state: 'adjacent EPUB chapter',
      );
      final chapterOne = _pageIndexesForChapter(tester, pageView, 'Chapter 1');
      final chapterTwo = _pageIndexesForChapter(tester, pageView, 'Chapter 2');
      expect(chapterOne, isNotEmpty);
      expect(chapterTwo, isNotEmpty);
      expect(chapterTwo.first, chapterOne.last + 1);

      controller.jumpToPage(chapterOne.last);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 50));
      final turn = controller.nextPage(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 240));
      await turn;
      await tester.pump();

      expect(tester.widget<PageView>(pageView).controller, same(controller));
      final current = controller.page!.round();
      expect(
        _pageLeafAt(tester, pageView, current).metadata.chapterTitle,
        'Chapter 2',
      );
      expect(tester.takeException(), isNull);
    } finally {
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      await drainPublicReaderCache(tester);
      await tester.binding.setSurfaceSize(null);
      debugDefaultTargetPlatformOverride = null;
      directory.deleteSync(recursive: true);
    }
  });
}

List<int> _pageIndexesForChapter(
  WidgetTester tester,
  Finder pageView,
  String chapterTitle,
) {
  final widget = tester.widget<PageView>(pageView);
  final delegate = widget.childrenDelegate as SliverChildBuilderDelegate;
  final element = tester.element(pageView);
  final current = widget.controller?.page?.round() ?? 0;
  final first = math.max(0, current - 160);
  final last = math.min(delegate.estimatedChildCount! - 1, current + 160);
  return [
    for (var index = first; index <= last; index++)
      if (delegate.builder(element, index) case final ReaderPaperPageLeaf leaf
          when leaf.metadata.chapterTitle == chapterTitle)
        index,
  ];
}

ReaderPaperPageLeaf _pageLeafAt(
  WidgetTester tester,
  Finder pageView,
  int controllerPage,
) {
  final widget = tester.widget<PageView>(pageView);
  final delegate = widget.childrenDelegate as SliverChildBuilderDelegate;
  return delegate.builder(tester.element(pageView), controllerPage)!
      as ReaderPaperPageLeaf;
}

List<int> _epubFixture() {
  final archive = Archive();
  void add(String name, String content) {
    final bytes = utf8.encode(content);
    archive.addFile(ArchiveFile(name, bytes.length, bytes));
  }

  add('mimetype', 'application/epub+zip');
  add('META-INF/container.xml', '''<?xml version="1.0"?>
<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
  <rootfiles><rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/></rootfiles>
</container>''');
  add('OEBPS/content.opf', '''<?xml version="1.0" encoding="UTF-8"?>
<package xmlns="http://www.idpf.org/2007/opf" version="2.0" unique-identifier="book-id">
  <metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
    <dc:identifier id="book-id">local-transition</dc:identifier>
    <dc:title>Local transition</dc:title><dc:language>en</dc:language>
  </metadata>
  <manifest>
    <item id="ncx" href="toc.ncx" media-type="application/x-dtbncx+xml"/>
    ${List.generate(4, (index) => '<item id="c${index + 1}" href="chapter${index + 1}.xhtml" media-type="application/xhtml+xml"/>').join()}
  </manifest>
  <spine toc="ncx">${List.generate(4, (index) => '<itemref idref="c${index + 1}"/>').join()}</spine>
</package>''');
  add('OEBPS/toc.ncx', '''<?xml version="1.0" encoding="UTF-8"?>
<ncx xmlns="http://www.daisy.org/z3986/2005/ncx/" version="2005-1">
  <head><meta name="dtb:uid" content="local-transition"/></head>
  <docTitle><text>Local transition</text></docTitle>
  <navMap>${List.generate(4, (index) => '<navPoint id="nav${index + 1}" playOrder="${index + 1}"><navLabel><text>Chapter ${index + 1}</text></navLabel><content src="chapter${index + 1}.xhtml"/></navPoint>').join()}</navMap>
</ncx>''');
  for (var chapter = 1; chapter <= 4; chapter++) {
    add('OEBPS/chapter$chapter.xhtml', '''<?xml version="1.0" encoding="UTF-8"?>
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>Chapter $chapter</title></head><body>
<h1>Chapter $chapter</h1>${List.generate(36, (index) => '<p>Chapter $chapter paragraph $index contains enough local text to create deterministic reader pages.</p>').join()}
</body></html>''');
  }
  return ZipEncoder().encode(archive)!;
}
