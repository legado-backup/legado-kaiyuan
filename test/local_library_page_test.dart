import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xxread/models/book.dart';
import 'package:xxread/pages/local_library_page.dart';

void main() {
  testWidgets('local library filters books and opens the selected local book', (
    tester,
  ) async {
    final books = [
      Book(
        id: 1,
        title: 'A local story',
        author: 'Alex',
        filePath: 'story.txt',
        format: 'txt',
      ),
      Book(
        id: 2,
        title: 'Another book',
        author: 'Sam',
        filePath: 'book.epub',
        format: 'epub',
      ),
    ];
    Book? opened;
    await tester.pumpWidget(
      MaterialApp(
        home: LocalLibraryPage(
          booksLoader: () async => books,
          onOpenBook: (book) async => opened = book,
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('A local story'), findsOneWidget);
    expect(find.text('Another book'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'alex');
    await tester.pump();
    expect(find.text('A local story'), findsOneWidget);
    expect(find.text('Another book'), findsNothing);
    await tester.tap(find.text('A local story'));
    await tester.pumpAndSettle();
    expect(opened?.id, 1);
  });

  testWidgets('import action refreshes the local library', (tester) async {
    final books = <Book>[];
    await tester.pumpWidget(
      MaterialApp(
        home: LocalLibraryPage(
          booksLoader: () async => List.of(books),
          onImport: () async => books.add(
            Book(
              id: 1,
              title: 'Imported',
              filePath: 'imported.txt',
              format: 'txt',
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Import TXT / EPUB'));
    await tester.pumpAndSettle();
    expect(find.text('Imported'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
