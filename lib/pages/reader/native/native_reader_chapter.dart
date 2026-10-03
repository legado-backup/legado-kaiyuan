part of 'native_reader_page.dart';

class _NativeChapter {
  _NativeChapter({
    required this.id,
    required String chapterTitle,
    required this._plainText,
    required this._blocks,
    this.depth = 0,
    this.isNeedSplitTitle = false,
    this.sourceChapterId,
    this.sourceBodyStart = 0,
  }) : _title = chapterTitle,
       _dataPath = null,
       _startOffset = 0,
       _endOffset = 0;

  _NativeChapter.lazyFileText({
    required this.id,
    required String chapterTitle,
    required this._dataPath,
    required this._startOffset,
    required this._endOffset,
    this.depth = 0,
    this.isNeedSplitTitle = false,
    this.sourceChapterId,
    this.sourceBodyStart = 0,
  }) : _title = chapterTitle,
       _plainText = null,
       _blocks = null;

  _NativeChapter.lazyEpub({
    required Map<String, dynamic> descriptor,
    required Map<String, dynamic> loadArguments,
  }) : id = descriptor['id'] as String? ?? '',
       _title = descriptor['title'] as String? ?? '',
       depth = descriptor['depth'] as int? ?? 0,
       isNeedSplitTitle = false,
       sourceChapterId = null,
       sourceBodyStart = 0,
       _plainText = null,
       _blocks = null,
       _dataPath = null,
       _startOffset = 0,
       _endOffset = 0,
       _epubDescriptor = descriptor,
       _epubLoadArguments = loadArguments;

  final String id;
  final String _title;
  final int depth;
  final bool isNeedSplitTitle;
  final String? sourceChapterId;
  final int sourceBodyStart;
  final String? _plainText;
  final List<_NativeBlock>? _blocks;
  final String? _dataPath;
  final int _startOffset;
  final int _endOffset;
  Map<String, dynamic>? _epubDescriptor;
  Map<String, dynamic>? _epubLoadArguments;
  Map<String, int>? _loadedAnchorOffsets;
  String? _loadedText;
  Future<String>? _textLoad;
  Future<void>? _pendingLoad;
  List<_NativeBlock>? _loadedBlocks;
  List<_NativeBlock>? _textBlocks;

  bool get hasLoadedText => _plainText != null || _loadedText != null;

  bool get isLazyEpub => _epubDescriptor != null;
  bool get hasPendingLoad => _pendingLoad != null;
  Future<void>? get pendingLoad => _pendingLoad;
  Map<String, dynamic> get epubDescriptor => _epubDescriptor!;
  Map<String, dynamic> get epubLoadArguments => _epubLoadArguments!;
  String get title => _title;

  String get plainText {
    final text = _plainText ?? _loadedText;
    if (text == null) {
      throw StateError('Native chapter text must be loaded asynchronously.');
    }
    return text;
  }

  List<_NativeBlock> get blocks {
    final text = plainText;
    return _blocks ?? _loadedBlocks ?? <_NativeBlock>[_NativeBlock.text(text)];
  }

  List<_NativeBlock> get textBlocks => _textBlocks ??= blocks
      .where((block) => block.text != null && block.startOffset >= 0)
      .toList(growable: false);

  Future<void> loadTextAsync() async {
    final pendingEpub = _pendingLoad;
    if (pendingEpub != null) {
      await pendingEpub;
      return;
    }
    if (hasLoadedText || _dataPath == null) return;
    final pending = _textLoad;
    if (pending != null) {
      await pending;
      return;
    }
    final future = _readIndexedTextAsync();
    _textLoad = future;
    try {
      _loadedText = await future;
    } finally {
      if (identical(_textLoad, future)) _textLoad = null;
    }
  }

  Future<String> _readIndexedTextAsync() async {
    final operation = Object();
    final cache = NativeReaderCacheStore.instance;
    cache.retain(operation, _dataPath!);
    try {
      return await readIndexedUtf8Range(
        path: _dataPath,
        startOffset: _startOffset,
        endOffset: _endOffset,
      );
    } finally {
      unawaited(cache.release(operation));
    }
  }

  void attachPendingLoad(Future<void> load) => _pendingLoad = load;

  void clearPendingLoad() => _pendingLoad = null;

  void applyEpubResult(Map<String, dynamic> result) {
    final chapter = Map<String, dynamic>.from(result['chapter'] as Map);
    _loadedText = chapter['plainText'] as String? ?? '';
    _loadedAnchorOffsets = Map<String, int>.from(
      chapter['anchors'] as Map? ?? const <String, int>{},
    );
    _loadedBlocks = (chapter['blocks'] as List<dynamic>? ?? const [])
        .map(
          (block) =>
              _NativeBlock.fromMap(Map<String, dynamic>.from(block as Map)),
        )
        .toList(growable: false);
    _textBlocks = null;
  }

  void unloadLazyContent() {
    if (!isLazyEpub || _pendingLoad != null) return;
    _loadedText = null;
    _loadedBlocks = null;
    _loadedAnchorOffsets = null;
    _textBlocks = null;
  }

  int? navigationOffsetFor(ReaderNavigationChapter navigation) {
    final text = plainText;
    if (text.isEmpty) return 0;
    final fragment = navigation.fragment;
    final anchorOffset = fragment == null
        ? null
        : _loadedAnchorOffsets?[fragment]?.clamp(0, text.length);
    final title = navigation.title.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (title.isEmpty) return anchorOffset;

    int? closestTitleOffset;
    var closestDistance = 1 << 62;
    var searchFrom = 0;
    while (searchFrom <= text.length - title.length) {
      final titleOffset = text.indexOf(title, searchFrom);
      if (titleOffset < 0) break;
      if (anchorOffset == null) return titleOffset;
      final distance = (titleOffset - anchorOffset).abs();
      if (distance < closestDistance) {
        closestDistance = distance;
        closestTitleOffset = titleOffset;
      }
      searchFrom = titleOffset + math.max(1, title.length);
    }
    return closestTitleOffset ?? anchorOffset;
  }
}

class _BookPageRef {
  const _BookPageRef({
    required this.chapterIndex,
    required this.pageIndex,
    required this.pageCount,
    required this.layoutFingerprint,
    required this.content,
    this.isBlank = false,
  }) : isForwardBoundary = false;

  const _BookPageRef.forwardBoundary({
    required this.chapterIndex,
    required this.layoutFingerprint,
  }) : pageIndex = 0,
       pageCount = 1,
       content = const _ReaderPageData(text: ''),
       isBlank = false,
       isForwardBoundary = true;

  final int chapterIndex;
  final int pageIndex;
  final int pageCount;
  final String layoutFingerprint;
  final _ReaderPageData content;
  final bool isBlank;
  final bool isForwardBoundary;
}

class _PendingHorizontalForwardBoundary {
  const _PendingHorizontalForwardBoundary({
    required this.controllerPage,
    required this.chapterIndex,
  });

  final int controllerPage;
  final int chapterIndex;
}

class _ReaderPageData extends ReaderTextPage {
  const _ReaderPageData({
    required super.text,
    this.imageBlockIndex,
    super.startOffset = 0,
    super.endOffset,
    super.layout,
    super.layoutStart,
    super.layoutEnd,
    super.displayStart = 0,
    super.displayEnd,
    super.isChapterTitle = false,
    super.showsInlineChapterTitle = false,
  });

  const _ReaderPageData.chapterTitle()
    : imageBlockIndex = null,
      super.chapterTitle();

  factory _ReaderPageData.fromTextPage(ReaderTextPage page) => _ReaderPageData(
    text: page.text,
    startOffset: page.startOffset,
    endOffset: page.endOffset,
    layout: page.layout,
    layoutStart: page.layoutStart,
    layoutEnd: page.layoutEnd,
    displayStart: page.displayStart,
    displayEnd: page.displayEnd,
    isChapterTitle: page.isChapterTitle,
    showsInlineChapterTitle: page.showsInlineChapterTitle,
  );

  final int? imageBlockIndex;

  _ReaderPageData copyWith({
    int? imageBlockIndex,
    bool? showsInlineChapterTitle,
  }) => _ReaderPageData(
    text: text,
    imageBlockIndex: imageBlockIndex ?? this.imageBlockIndex,
    startOffset: startOffset,
    endOffset: endOffset,
    layout: layout,
    layoutStart: layoutStart,
    layoutEnd: layoutEnd,
    displayStart: displayStart,
    displayEnd: displayEnd,
    isChapterTitle: isChapterTitle,
    showsInlineChapterTitle:
        showsInlineChapterTitle ?? this.showsInlineChapterTitle,
  );
}

class _ContinuousReaderPart {
  const _ContinuousReaderPart(this.content, {this.imageBlockIndex});

  final _ReaderPageData content;
  final int? imageBlockIndex;
}

class _NativeBlock {
  _NativeBlock._({
    this.text,
    this.imageBytes,
    this.imagePath,
    this.startOffset = -1,
    this.endOffset = -1,
    this.fontScale = 1,
    this.bold = false,
    this.italic = false,
    this.fontFamily,
    this.colorHex,
  });

  factory _NativeBlock.text(String text) => _NativeBlock._(text: text);

  /// [resolveImage] looks up already-decoded bytes by the shared image name
  /// stashed in `content` (see [_richChaptersFromParsed]) instead of each
  /// block carrying its own base64 copy — a page-header image reused across
  /// thousands of chapters would otherwise be duplicated and re-decoded that
  /// many times.
  factory _NativeBlock.fromMap(
    Map<String, dynamic> map, {
    Uint8List? Function(String name)? resolveImage,
  }) => _NativeBlock._(
    text: map['type'] == 'text' ? map['content'] : null,
    imageBytes: map['type'] == 'image'
        ? resolveImage?.call(map['content'] ?? '')
        : null,
    imagePath: map['type'] == 'image' ? map['imagePath'] as String? : null,
    startOffset: _nativeInt(map['startOffset']),
    endOffset: _nativeInt(map['endOffset']),
    fontScale: _nativeDouble(map['fontScale']),
    bold: map['bold'] == true || map['bold'] == 'true',
    italic: map['italic'] == true || map['italic'] == 'true',
    fontFamily: map['fontFamily'] as String?,
    colorHex: map['color'],
  );

  final String? text;
  final Uint8List? imageBytes;
  final String? imagePath;
  final int startOffset;
  final int endOffset;
  final double fontScale;
  final bool bold;
  final bool italic;
  final String? fontFamily;
  final String? colorHex;

  _NativeBlock copyWith({String? text, int? startOffset, int? endOffset}) =>
      _NativeBlock._(
        text: text ?? this.text,
        imageBytes: imageBytes,
        imagePath: imagePath,
        startOffset: startOffset ?? this.startOffset,
        endOffset: endOffset ?? this.endOffset,
        fontScale: fontScale,
        bold: bold,
        italic: italic,
        fontFamily: fontFamily,
        colorHex: colorHex,
      );

  ImageProvider? get imageProvider {
    final memory = imageBytes;
    if (memory != null) return MemoryImage(memory);
    final filePath = imagePath;
    return filePath == null ? null : FileImage(File(filePath));
  }

  bool get hasImage => imageBytes != null || imagePath != null;
}

int _nativeInt(Object? value) => switch (value) {
  final int value => value,
  final String value => int.tryParse(value) ?? -1,
  _ => -1,
};

double _nativeDouble(Object? value) => switch (value) {
  final num value => value.toDouble(),
  final String value => double.tryParse(value) ?? 1,
  _ => 1,
};

@visibleForTesting
String? resolveNativeReaderFontFamily({
  required String? readerFontFamily,
  required String? documentFontFamily,
  bool preserveDocumentFont = true,
}) => preserveDocumentFont && documentFontFamily != null
    ? documentFontFamily
    : readerFontFamily;

TextStyle _styleForNativeBlock(
  _NativeBlock block,
  TextStyle base, {
  required bool preserveDocumentFont,
}) {
  return base.copyWith(
    fontSize: (base.fontSize ?? 19) * block.fontScale,
    fontWeight: block.bold ? FontWeight.w700 : base.fontWeight,
    fontStyle: block.italic ? FontStyle.italic : base.fontStyle,
    fontFamily: resolveNativeReaderFontFamily(
      readerFontFamily: base.fontFamily,
      documentFontFamily: block.fontFamily,
      preserveDocumentFont: preserveDocumentFont,
    ),
    // Keep EPUB typography, but the reader theme owns foreground color so
    // embedded black/white text cannot disappear in night/day modes.
    color: base.color,
  );
}

TextSpan _styledSpanForRange(
  _NativeChapter chapter,
  int start,
  int end,
  TextStyle base, {
  bool preserveDocumentFont = true,
}) {
  if (start >= end) return TextSpan(style: base, text: '');
  final children = <InlineSpan>[];
  var cursor = start;
  final blocks = chapter.textBlocks;
  var low = 0;
  var high = blocks.length;
  while (low < high) {
    final middle = (low + high) >> 1;
    if (blocks[middle].endOffset <= start) {
      low = middle + 1;
    } else {
      high = middle;
    }
  }
  for (var index = low; index < blocks.length; index++) {
    final block = blocks[index];
    if (block.startOffset >= end) break;
    final overlapStart = block.startOffset.clamp(start, end);
    final overlapEnd = block.endOffset.clamp(start, end);
    if (overlapStart > cursor) {
      children.add(
        TextSpan(
          text: chapter.plainText.substring(cursor, overlapStart),
          style: base,
        ),
      );
    }
    children.add(
      TextSpan(
        text: chapter.plainText.substring(overlapStart, overlapEnd),
        style: _styleForNativeBlock(
          block,
          base,
          preserveDocumentFont: preserveDocumentFont,
        ),
      ),
    );
    cursor = overlapEnd;
  }
  if (cursor < end) {
    children.add(
      TextSpan(text: chapter.plainText.substring(cursor, end), style: base),
    );
  }
  return TextSpan(style: base, children: children);
}

/// 获取 `<img>`/`<svg><image>` 元素的图片地址。
///
/// package:html 对带命名空间前缀的属性（如 xlink:href）使用 [html_dom.AttributeName]
/// 作为 attributes map 的 key 而非普通字符串，直接用字符串字面量查找会失配，
/// 因此这里按 toString() 结果比对。
String? _epubImageSrc(html_dom.Element element) {
  for (final entry in element.attributes.entries) {
    final key = entry.key.toString();
    if (key == 'src' || key == 'href' || key == 'xlink:href') {
      return entry.value;
    }
  }
  return null;
}
