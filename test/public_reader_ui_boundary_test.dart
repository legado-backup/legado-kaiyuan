import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xxread/utils/reader_themes.dart';
import 'package:xxread/widgets/reader_control_chrome.dart';

void main() {
  testWidgets('local reader chrome exposes only local reading actions', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ReaderChromeOverlay(
            palette: ReaderThemes.day,
            visible: true,
            title: 'Chapter',
            statusBottom: 8,
            statusBuilder: (context, style, key) =>
                Text('1 / 2', key: key, style: style),
            onBack: () {},
            onBookmark: () {},
            onTableOfContents: () {},
            onSearch: () {},
            onReadAloud: () {},
            onSettings: () {},
            backTooltip: 'Back',
            bookmarkTooltip: 'Bookmark',
            tableOfContentsTooltip: 'Contents',
            searchTooltip: 'Search',
            readAloudTooltip: 'Read aloud',
            settingsTooltip: 'Settings',
            bookmarked: false,
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.arrow_back_rounded), findsOneWidget);
    expect(find.byIcon(Icons.format_list_bulleted_rounded), findsOneWidget);
    expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    expect(find.byIcon(Icons.headphones_rounded), findsOneWidget);
    expect(find.byIcon(Icons.tune_rounded), findsOneWidget);
    expect(find.byIcon(Icons.auto_awesome_outlined), findsNothing);
    expect(find.byIcon(Icons.more_horiz_rounded), findsNothing);
  });
}
