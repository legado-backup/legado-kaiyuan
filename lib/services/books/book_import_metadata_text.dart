part of 'book_import_service.dart';

extension _BookImportTextMetadata on BookImportService {
  Future<EnhancedBookMetadata> _extractEnhancedMetadataFromFile(
    String filePath,
    String fileName,
    String extension, {
    Function(double, String)? progressCallback,
  }) async {
    final normalized = extension.toLowerCase();
    final file = File(filePath);
    final fileSize = await file.length();
    if (normalized == 'epub') {
      progressCallback?.call(0.2, '解析 EPUB 元数据...');
      try {
        final metadata = await compute(
          extractEpubNativeMetadata,
          <String, dynamic>{'epubPath': filePath},
        );
        progressCallback?.call(1, '元数据提取完成');
        return _epubMetadataFromMap(metadata, fileName);
      } catch (error) {
        debugPrint('EPUB metadata extraction failed: $error');
        return EnhancedBookMetadata(
          title: basenameWithoutExtension(fileName),
          author: 'Unknown',
          estimatedPages: (fileSize / 10000).ceil().clamp(1, 9999),
          additionalInfo: <String, dynamic>{'format': 'EPUB'},
        );
      }
    }
    if (normalized != 'txt') {
      throw const BookImportFailure(code: 'unsupported_format');
    }

    const sampleSize = 256 * 1024 + 4;
    final bytes = fileSize > sampleSize
        ? await _readFilePrefix(file, sampleSize)
        : await file.readAsBytes();
    return _extractTxtMetadata(bytes, fileName, totalByteLength: fileSize);
  }

  Future<Uint8List> _readFilePrefix(File file, int byteCount) async {
    final chunks = await file.openRead(0, byteCount).toList();
    final result = Uint8List(
      chunks.fold<int>(0, (length, chunk) => length + chunk.length),
    );
    var offset = 0;
    for (final chunk in chunks) {
      result.setRange(offset, offset + chunk.length, chunk);
      offset += chunk.length;
    }
    return result;
  }

  Future<EnhancedBookMetadata> _extractEnhancedMetadataFromBytes(
    Uint8List bytes,
    String fileName,
    String extension, {
    Function(double, String)? progressCallback,
    int? totalByteLength,
  }) async {
    final normalized = extension.toLowerCase();
    final metadata = switch (normalized) {
      'epub' => _epubMetadataFromMap(
        await compute(extractEpubMetadataInIsolate, bytes),
        fileName,
      ),
      'txt' => await _extractTxtMetadata(
        bytes,
        fileName,
        totalByteLength: totalByteLength,
      ),
      _ => throw const BookImportFailure(code: 'unsupported_format'),
    };
    progressCallback?.call(1, '元数据提取完成');
    return metadata;
  }

  EnhancedBookMetadata _epubMetadataFromMap(
    Map<String, dynamic> metadata,
    String fileName,
  ) {
    final title = (metadata['title'] as String? ?? '').trim();
    final author = (metadata['author'] as String? ?? '').trim();
    return EnhancedBookMetadata(
      title: title.isEmpty ? basenameWithoutExtension(fileName) : title,
      author: author.isEmpty ? 'Unknown' : author,
      description: metadata['description'] as String?,
      language: metadata['language'] as String?,
      publisher: metadata['publisher'] as String?,
      publishDate: metadata['publishDate'] as String?,
      isbn: metadata['isbn'] as String?,
      coverImage: metadata['coverImage'] as Uint8List?,
      estimatedPages: metadata['estimatedPages'] as int? ?? 1,
      tags: (metadata['tags'] as List<dynamic>?)?.cast<String>(),
      additionalInfo: Map<String, dynamic>.from(
        metadata['additionalInfo'] as Map? ?? const {},
      ),
    );
  }

  Future<EnhancedBookMetadata> _extractTxtMetadata(
    Uint8List bytes,
    String fileName, {
    int? totalByteLength,
  }) async {
    final encoding = _enhancedTxtService.detectEncoding(bytes);
    try {
      final simple = await compute(
        extractTxtMetadataInIsolate,
        MetadataExtractionParams(
          bytes: bytes,
          fileName: fileName,
          extension: 'txt',
          encodingOverride: encoding,
          totalByteLength: totalByteLength ?? bytes.length,
        ),
      );
      return EnhancedBookMetadata(
        title: simple.title,
        author: simple.author,
        description: simple.description,
        estimatedPages: simple.estimatedPages,
        language: simple.language,
        textEncoding: encoding,
        additionalInfo: <String, dynamic>{
          'format': 'TXT',
          'fileSize': totalByteLength ?? bytes.length,
        },
      );
    } catch (_) {
      final basic = _extractBasicMetadata(bytes, fileName);
      return EnhancedBookMetadata(
        title: basic.title,
        author: basic.author,
        estimatedPages: ((totalByteLength ?? bytes.length) / 10000)
            .ceil()
            .clamp(1, 9999),
        textEncoding: encoding,
      );
    }
  }
}
