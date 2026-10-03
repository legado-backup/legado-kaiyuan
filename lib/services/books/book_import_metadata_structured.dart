part of 'book_import_service.dart';

extension _BookImportStructuredMetadata on BookImportService {
  EnhancedBookMetadata _extractBasicMetadata(Uint8List bytes, String fileName) {
    final title = basenameWithoutExtension(fileName).trim();
    return EnhancedBookMetadata(
      title: title.isEmpty ? 'Untitled' : title,
      author: 'Unknown',
      estimatedPages: (bytes.length / 1500).ceil().clamp(1, 99999),
    );
  }

  Future<Uint8List?> _resolveCoverImage(
    EnhancedBookMetadata metadata,
    String extension,
  ) async {
    final embedded = metadata.coverImage;
    if (embedded != null && embedded.isNotEmpty) return embedded;
    return CoverGenerator.generateTextCover(
      title: metadata.title,
      author: metadata.author,
      format: extension.toUpperCase(),
    );
  }

  Future<String?> _saveCoverImage(Uint8List coverBytes, String fileName) async {
    try {
      final documentsDir = await _documentsDirectory();
      final coversDir = Directory(join(documentsDir.path, 'covers'));
      if (!await coversDir.exists()) await coversDir.create(recursive: true);
      final digest = md5.convert(coverBytes).toString();
      final coverFile = File(join(coversDir.path, '$digest.jpg'));
      if (!await coverFile.exists()) await coverFile.writeAsBytes(coverBytes);
      return coverFile.path;
    } catch (error) {
      debugPrint('Could not save cover for $fileName: $error');
      return null;
    }
  }
}
