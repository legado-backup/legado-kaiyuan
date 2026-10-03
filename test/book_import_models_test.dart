import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:xxread/models/book.dart';
import 'package:xxread/services/books/book_import_models.dart';

void main() {
  test('本地书籍元数据可以完整地写入并恢复', () {
    final book = Book(
      title: '示例书籍',
      filePath: '/managed/example.epub',
      format: 'EPUB',
      contentHash: 'local-content-hash',
      textEncoding: 'utf-8',
    );

    final restored = Book.fromMap(book.toMap());

    expect(restored.filePath, '/managed/example.epub');
    expect(restored.contentHash, 'local-content-hash');
    expect(restored.textEncoding, 'utf-8');
  });

  test('withBytes 防御性复制并暴露不可变字节', () {
    final original = Uint8List.fromList(<int>[1, 2, 3]);
    final source = BookImportSource.withBytes(
      id: 'file_picker:web-book://hash',
      kind: BookImportSourceKind.filePicker,
      ownership: BookImportOwnership.externalCopy,
      displayName: 'book.txt',
      extension: 'txt',
      locator: 'web-book://hash',
      bytes: original,
    );

    original[0] = 9;

    expect(source.bytes, <int>[1, 2, 3]);
    expect(() => source.bytes![0] = 8, throwsUnsupportedError);
    expect(
      source.copyWithLocalPath('web-book://hash').bytes,
      same(source.bytes),
    );
  });
}
