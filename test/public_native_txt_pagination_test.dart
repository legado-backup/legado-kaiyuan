import 'dart:io';

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
import 'package:xxread/widgets/reader_annotated_text_page.dart';
import 'package:xxread/widgets/reader_paper_page_leaf.dart';

import 'support/public_reader_test_utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory supportDirectory;

  setUpAll(() {
    supportDirectory = Directory.systemTemp.createTempSync(
      'origo-public-txt-support-',
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

  testWidgets('local TXT opens and paginates without remote services', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    await tester.binding.setSurfaceSize(const Size(420, 760));
    SharedPreferences.setMockInitialValues({
      ReaderSettingsStore.pageModeKey: ReaderPageMode.horizontalSlide.name,
      ReaderSettingsStore.chapterTitlePageKey: false,
    });
    final directory = Directory.systemTemp.createTempSync(
      'origo-public-txt-pagination-',
    );
    final firstChapterBody = List.generate(
      90,
      (index) => '这是第一个本地章节的第 $index 段，用于验证真实 TXT 分页与翻页。',
    ).join('\n\n');
    final txt = File('${directory.path}/local-reader.txt')
      ..writeAsStringSync(
        '第一章 本地阅读\n\n$firstChapterBody\n\n'
        '第二章 继续阅读\n\n这是第二个本地章节。',
      );

    try {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: NativeReaderPage(
            book: Book(
              title: 'Local TXT fixture',
              filePath: txt.path,
              format: 'txt',
              textEncoding: 'utf8',
              fileModifiedTime: txt.lastModifiedSync().millisecondsSinceEpoch,
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
        state: 'TXT page view',
      );

      final pageView = find.byType(PageView);
      final controller = tester.widget<PageView>(pageView).controller!;
      final first = _pageLeafAt(tester, pageView, controller.page!.round());
      expect(first.metadata.chapterTitle, '第一章 本地阅读');
      expect(first.metadata.pageNumber, 1);
      expect(first.metadata.pageCount, greaterThan(1));
      expect(find.byType(ReaderAnnotatedTextPage), findsWidgets);

      final turn = controller.nextPage(
        duration: const Duration(milliseconds: 180),
        curve: Curves.linear,
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      await turn;
      await tester.pump();
      final second = _pageLeafAt(tester, pageView, controller.page!.round());
      expect(second.metadata.chapterTitle, '第一章 本地阅读');
      expect(second.metadata.pageNumber, 2);
      expect(tester.widget<PageView>(pageView).controller, same(controller));
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
