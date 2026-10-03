import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xxread/core/reader/native_text_paginator.dart';
import 'package:xxread/core/reader/reader_pagination_cache_codec.dart';
import 'package:xxread/core/reader/reader_text_layout.dart';
import 'package:xxread/core/reader/reader_text_pagination.dart';
import 'package:xxread/widgets/reader_text_page_content.dart';

NativeTextFlowStyle _flow(TextStyle style, TextAlign align) =>
    NativeTextFlowStyle(
      textAlign: align,
      textDirection: TextDirection.ltr,
      textScaler: readerBodyTextScaler,
      locale: const Locale('zh', 'CN'),
      strutStyle: readerStrutStyle(style),
      textHeightBehavior: readerTextHeightBehavior,
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await (FontLoader(
      'ReaderIndent',
    )..addFont(rootBundle.load('assets/fonts/ReaderIndent.ttf'))).load();
  });

  testWidgets('indent stays em-sized when justification has spare width', (
    tester,
  ) async {
    for (final fontSize in [18.0, 26.0]) {
      for (final letterSpacing in [0.0, 1.2]) {
        final style = TextStyle(
          fontSize: fontSize,
          height: 1.75,
          letterSpacing: letterSpacing,
        );
        for (final indent in [0, 1, 2, 4]) {
          for (final first in ['这', '“', 'A']) {
            final paragraph = '$first段文字需要换行，检查不同开头的首行缩进和后续行。' * 3;
            final source = '$paragraph\n$paragraph';
            final layout = ReaderTextLayout.build(
              source,
              firstLineIndent: indent,
            );
            final page = ReaderTextPage(
              text: layout.text,
              layout: layout,
              endOffset: source.length,
            );
            for (final align in [TextAlign.start, TextAlign.justify]) {
              // Non-integral widths exercise actual justification. An exact
              // multiple of the test font's advance hid the original failure.
              final painter = _flow(style, align).createPainter(
                page.buildSpan(style: style),
              )..layout(maxWidth: fontSize * 9 + 5);
              final metrics = painter.computeLineMetrics();
              expect(metrics.length, greaterThan(2));
              expect(painter.height.isFinite, isTrue);
              for (final offset in [
                indent,
                layout.text.indexOf('\n') + 1 + indent,
              ]) {
                final boxes = painter.getBoxesForSelection(
                  TextSelection(baseOffset: offset, extentOffset: offset + 1),
                );
                expect(boxes, hasLength(1));
                expect(
                  boxes.single.left,
                  closeTo(indent * fontSize, letterSpacing + 0.01),
                  reason:
                      'size=$fontSize spacing=$letterSpacing indent=$indent first=$first align=$align',
                );
              }
              expect(metrics[1].left, closeTo(letterSpacing / 2, 0.01));
              painter.dispose();
            }
          }
        }
      }
    }
  });

  testWidgets('indent does not change line height or paragraph spacing', (
    tester,
  ) async {
    for (final spacing in [0, 1, 2]) {
      const style = TextStyle(fontSize: 20, height: 1.75);
      final heights = <double>[];
      for (final indent in [0, 2, 4]) {
        final layout = ReaderTextLayout.build(
          '第一段\n第二段',
          firstLineIndent: indent,
          paragraphSpacing: spacing,
        );
        final page = ReaderTextPage(text: layout.text, layout: layout);
        final painter = _flow(
          style,
          TextAlign.justify,
        ).createPainter(page.buildSpan(style: style))..layout(maxWidth: 305);
        expect(painter.computeLineMetrics(), hasLength(spacing + 2));
        heights.add(painter.height);
        painter.dispose();
      }
      expect(heights[1], closeTo(heights.first, 0.01));
      expect(heights[2], closeTo(heights.first, 0.01));
    }
  });

  testWidgets(
    'selection after indented paragraphs still maps to canonical text',
    (tester) async {
      const source =
          '第一段自动换行之后仍要保持原文的选区位置。\nSecond target paragraph wraps onto more lines.';
      const style = TextStyle(fontSize: 20, height: 1.6);
      final page = paginateReaderText(
        text: source,
        maxWidth: 185,
        maxHeight: 0,
        flowStyle: _flow(style, TextAlign.justify),
        style: style,
        firstLineIndent: 2,
      ).single;
      final notifier = SelectionListenerNotifier();
      addTearDown(notifier.dispose);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 185,
              child: SelectionArea(
                child: SelectionListener(
                  selectionNotifier: notifier,
                  child: ReaderTextPageContent(
                    page: page,
                    chapterTitle: '',
                    bodyStyle: style,
                    flowStyle: _flow(style, TextAlign.justify),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      final paragraph = tester.renderObject<RenderParagraph>(
        find.descendant(
          of: find.byType(ReaderTextPageContent),
          matching: find.byType(RichText),
        ),
      );
      final target = page.textOffsetForSourceOffset(source.indexOf('target'));
      final box = paragraph
          .getBoxesForSelection(
            TextSelection(baseOffset: target, extentOffset: target + 1),
          )
          .single
          .toRect();
      final gesture = await tester.startGesture(
        paragraph.localToGlobal(box.center),
      );
      await tester.pump(const Duration(milliseconds: 500));
      await gesture.up();
      await tester.pumpAndSettle();
      final selected = notifier.selection.range!;
      expect(
        source.substring(
          page.sourceOffsetForTextOffset(
            selected.startOffset,
            preferVisibleStart: true,
          ),
          page.sourceOffsetForTextOffset(selected.endOffset),
        ),
        'target',
      );
      tester
          .state<SelectableRegionState>(find.byType(SelectableRegion))
          .selectAll();
      await tester.pump();
      expect(notifier.selection.range!.startOffset, 0);
      expect(notifier.selection.range!.endOffset, page.text.length);
      await tester.pumpWidget(const SizedBox());
    },
  );

  testWidgets(
    'paginated and restored pages paint the same indent and source ranges',
    (tester) async {
      const style = TextStyle(fontSize: 20, height: 1.6);
      final flow = _flow(style, TextAlign.justify);
      const width = 185.0;
      const height = 130.0;
      final source = List.generate(
        8,
        (index) => '第$index段正文用于验证分页之后依然保留缩进，续页不增加缩进，选区与原文一致。',
      ).join('\n');
      final pages = paginateReaderText(
        text: source,
        maxWidth: width,
        maxHeight: height,
        flowStyle: flow,
        style: style,
        firstLineIndent: 2,
      );
      final restored = ReaderPaginationCacheCodec.restoreTextPages(
        ReaderPaginationCacheCodec.encodeTextPages(pages),
        text: source,
        firstLineIndent: 2,
        paragraphSpacing: 0,
      );
      expect(restored, isNotNull);
      expect(pages.length, greaterThan(2));
      for (final pageSet in [pages, restored!]) {
        expect(pageSet.first.startOffset, 0);
        expect(pageSet.last.endOffset, source.length);
        for (var index = 0; index < pageSet.length; index++) {
          final page = pageSet[index];
          if (index > 0) expect(pageSet[index - 1].endOffset, page.startOffset);
          await tester.pumpWidget(
            MaterialApp(
              home: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: width,
                  child: ReaderTextPageContent(
                    page: page,
                    chapterTitle: '',
                    bodyStyle: style,
                    flowStyle: flow,
                  ),
                ),
              ),
            ),
          );
          final richText = find.descendant(
            of: find.byType(ReaderTextPageContent),
            matching: find.byType(RichText),
          );
          final paragraph = tester.renderObject<RenderParagraph>(richText);
          final renderedText = page.buildSpan(style: style).toPlainText();
          final first = renderedText.indexOf(RegExp(r'\S'));
          expect(first, greaterThanOrEqualTo(0));
          final box = paragraph
              .getBoxesForSelection(
                TextSelection(baseOffset: first, extentOffset: first + 1),
              )
              .single;
          expect(box.left, closeTo(first == 0 ? 0 : 40, 0.01));
          expect(paragraph.size.height, lessThanOrEqualTo(height));
          for (var offset = 0; offset < renderedText.length; offset++) {
            if (renderedText.codeUnitAt(offset) == 0x00a0) continue;
            final canonical = page.sourceOffsetForTextOffset(
              offset,
              preferVisibleStart: true,
            );
            expect(source[canonical], renderedText[offset]);
          }
        }
      }
      expect(tester.takeException(), isNull);
    },
  );
}
