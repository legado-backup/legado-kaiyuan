part of 'native_reader_page.dart';

const String _txtUnresolvedLocatorMarker = 'openreading:txt-unresolved:';

bool isTxtNoteLocatorResolved(Map<String, dynamic> row) {
  final payload = row['payload_json'] as String?;
  if (payload == null || payload.isEmpty) return true;
  try {
    final values = jsonDecode(payload) as Map;
    return values['txt_locator_status'] != 'unresolved';
  } catch (_) {
    return true;
  }
}

bool isTxtBookmarkLocatorResolved(String? anchorKey) =>
    !(anchorKey?.startsWith(_txtUnresolvedLocatorMarker) ?? false);

List<_NativeChapter> _parseTxtChapters(
  String text,
  String fallbackTitle,
  String prefaceTitle,
) {
  return parseBoundedTxtChapterSections(
        text,
        fallbackTitle: fallbackTitle,
        prefaceTitle: prefaceTitle,
      )
      .map((section) {
        final body = section.bodyIn(text);
        return _NativeChapter(
          id: section.id,
          chapterTitle: section.title,
          plainText: body,
          blocks: <_NativeBlock>[_NativeBlock.text(body)],
          isNeedSplitTitle: section.isNeedSplitTitle,
          sourceChapterId: section.sourceChapterId,
          sourceBodyStart: section.sourceBodyStart,
        );
      })
      .toList(growable: false);
}
