// 文件说明：应用设置服务，负责全局偏好项的读取与变更通知。
// 技术要点：服务层、SharedPreferences、Flutter、本地字体恢复与变更通知。

import 'package:flutter/foundation.dart' show listEquals, setEquals;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/home_navigation_destination.dart';
import '../../utils/font_catalog_helper.dart';
import '../../utils/page_transitions.dart';
import 'custom_font_service.dart';
import 'display_refresh_rate_controller.dart';

enum LibraryLayoutMode { card, grid }

class AppSettingsNotifier extends ChangeNotifier {
  static const appTextScaleFactors = <double>[0.9, 1.0, 1.1, 1.2, 1.3];
  static const defaultAppTextScaleLevel = 1;
  static const _keyAppTextScaleLevel = 'app_text_scale_level_v1';
  static const String _keyAppLocale = 'app_locale';
  static const String _keyLegacyLocale = 'language';
  static const String _keyAppFontId = 'app_font_id_v2';
  static const String _keyReaderFontId = 'reader_font_id_v2';
  static const String _keyEpubReaderFontId = 'epub_reader_font_id_v1';
  static const String _keyLegacyAppFontFamily = 'app_font_family';
  static const String _keyHideNavigationLabels =
      'hide_home_navigation_labels_v1';
  static const String _keyHomeNavigationOrder = 'home_navigation_order_v1';
  static const String _keyHomeNavigationHidden = 'home_navigation_hidden_v1';
  static const String _keyCustomizeFloatingNavigationSize =
      'customize_home_navigation_size_v1';
  static const String _keyFloatingNavigationHeight =
      'home_navigation_height_v1';
  static const String _keyFloatingNavigationHorizontalMargin =
      'home_navigation_horizontal_margin_v1';
  static const String _keyLibraryLayoutMode = 'library_layout_mode_v1';
  static const String _keyLibraryGridColumns = 'library_grid_columns_v1';
  static const String _keyLibraryGridShowDetails =
      'library_grid_show_details_v1';
  static const String _keyLibraryBookOpenAnimation =
      'library_book_open_animation_v1';
  static const String _keyLibraryBookOpenAnimationPace =
      'library_book_open_animation_pace_v1';

  Locale? _locale;
  String _localeCode = 'system';
  int _appTextScaleLevel = defaultAppTextScaleLevel;
  String _appFontId = FontCatalog.defaultAppFont.id;
  String _readerFontId = FontCatalog.defaultReaderFont.id;
  String _epubReaderFontId = FontCatalog.bookEmbeddedId;
  bool _hideNavigationLabels = true;
  List<HomeNavigationDestination> _homeNavigationOrder =
      defaultHomeNavigationOrder;
  Set<HomeNavigationDestination> _hiddenHomeNavigationDestinations =
      defaultHiddenHomeNavigationDestinations;
  bool _customizeFloatingNavigationSize = false;
  double _floatingNavigationHeight = 60;
  double _floatingNavigationHorizontalMargin = 24;
  LibraryLayoutMode _libraryLayoutMode = LibraryLayoutMode.grid;
  int _libraryGridColumns = 2;
  bool _libraryGridShowDetails = true;
  LibraryBookOpenAnimation _libraryBookOpenAnimation =
      LibraryBookOpenAnimation.minimalFade;
  LibraryBookOpenAnimationPace _libraryBookOpenAnimationPace =
      LibraryBookOpenAnimationPace.fast;
  bool _powerSavingMode = false;
  bool _isInitialized = false;
  final CustomFontService _customFontService;
  final DisplayRefreshRateController _displayRefreshRateController;
  bool _isDisposed = false;

  AppSettingsNotifier({
    CustomFontService? customFontService,
    DisplayRefreshRateController? displayRefreshRateController,
  }) : _customFontService = customFontService ?? CustomFontService(),
       _displayRefreshRateController =
           displayRefreshRateController ?? DisplayRefreshRateController() {
    _loadSettings();
  }

  Locale? get locale => _locale;
  String get localeCode => _localeCode;
  int get appTextScaleLevel => _appTextScaleLevel;
  double get appTextScaleFactor => appTextScaleFactors[_appTextScaleLevel];
  String get appFontId => _appFontId;
  String get readerFontId => _readerFontId;
  String get epubReaderFontId => _epubReaderFontId;
  bool get hideNavigationLabels => _hideNavigationLabels;
  bool get showNavigationLabels => !_hideNavigationLabels;
  List<HomeNavigationDestination> get homeNavigationOrder =>
      _homeNavigationOrder;
  Set<HomeNavigationDestination> get hiddenHomeNavigationDestinations =>
      _hiddenHomeNavigationDestinations;
  bool get customizeFloatingNavigationSize => _customizeFloatingNavigationSize;
  double get floatingNavigationHeight => _floatingNavigationHeight;
  double get floatingNavigationHorizontalMargin =>
      _floatingNavigationHorizontalMargin;

  /// 按用户顺序过滤隐藏项后的实际导航列表；设置页永远可见。
  List<HomeNavigationDestination> get visibleHomeNavigationOrder =>
      List<HomeNavigationDestination>.unmodifiable(
        _homeNavigationOrder.where(
          (destination) =>
              !_hiddenHomeNavigationDestinations.contains(destination),
        ),
      );

  bool isHomeNavigationDestinationVisible(
    HomeNavigationDestination destination,
  ) => !_hiddenHomeNavigationDestinations.contains(destination);
  LibraryLayoutMode get libraryLayoutMode => _libraryLayoutMode;
  int get libraryGridColumns => _libraryGridColumns;
  bool get libraryGridShowDetails => _libraryGridShowDetails;
  LibraryBookOpenAnimation get libraryBookOpenAnimation =>
      _libraryBookOpenAnimation;
  LibraryBookOpenAnimationPace get libraryBookOpenAnimationPace =>
      _libraryBookOpenAnimationPace;
  bool get powerSavingMode => _powerSavingMode;

  /// 用户自定义导入的本地字体列表。
  List<FontOption> get customFonts => _customFontService.fonts
      .map(
        (font) => FontOption(
          id: font.id,
          family: font.runtimeFamily,
          fallbackFamilies: const <String>['SourceHanSansCN'],
          tone: FontTone.sansSerif,
          displayName: font.displayName,
          sourceFileName: font.fileName,
          fileSize: font.fileSize,
          isCustom: true,
          isAvailable: font.available,
          variableWeightMin: font.variableWeightMin,
          variableWeightMax: font.variableWeightMax,
        ),
      )
      .toList(growable: false);
  List<FontOption> get availableCustomFonts =>
      customFonts.where((font) => font.isAvailable).toList(growable: false);

  /// 当前可用的 App 字体选项：系统字体与用户导入的本地字体。
  List<FontOption> get appFontOptions => <FontOption>[
    ...FontCatalog.appFonts,
    ...availableCustomFonts,
  ];
  List<FontOption> get readerFontOptions => <FontOption>[
    ...FontCatalog.readerFonts,
    ...availableCustomFonts,
  ];

  FontOption get appFont =>
      FontCatalog.appFontForId(_appFontId, customFonts: availableCustomFonts);
  FontOption get readerFont => FontCatalog.readerFontForId(
    _readerFontId,
    customFonts: availableCustomFonts,
  );
  FontOption get epubReaderFont => FontCatalog.epubReaderFontForId(
    _epubReaderFontId,
    customFonts: availableCustomFonts,
  );
  String? get appFontFamily => appFont.family;
  bool get customFontImportSupported => _customFontService.isSupported;
  bool get isInitialized => _isInitialized;

  Future<void> _loadSettings() async {
    await _customFontService.initialize();
    final prefs = await SharedPreferences.getInstance();
    if (_isDisposed) return;
    final storedLocale =
        prefs.getString(_keyAppLocale) ?? prefs.getString(_keyLegacyLocale);
    _applyLocaleCode(storedLocale ?? 'system', notify: false);
    final storedTextScaleLevel = prefs.get(_keyAppTextScaleLevel);
    _appTextScaleLevel =
        storedTextScaleLevel is int &&
            storedTextScaleLevel >= 0 &&
            storedTextScaleLevel < appTextScaleFactors.length
        ? storedTextScaleLevel
        : defaultAppTextScaleLevel;
    final storedAppFontId = prefs.getString(_keyAppFontId);
    if (storedAppFontId != null) {
      _appFontId = FontCatalog.appFontForId(
        storedAppFontId,
        customFonts: availableCustomFonts,
      ).id;
    } else {
      final legacyFamily = prefs.getString(_keyLegacyAppFontFamily);
      if (legacyFamily != null && legacyFamily.isNotEmpty) {
        _appFontId = FontCatalog.appFontForFamily(legacyFamily).id;
        await prefs.setString(_keyAppFontId, _appFontId);
      }
    }
    _readerFontId = FontCatalog.readerFontForId(
      prefs.getString(_keyReaderFontId),
      customFonts: availableCustomFonts,
    ).id;
    _epubReaderFontId = FontCatalog.epubReaderFontForId(
      prefs.getString(_keyEpubReaderFontId) ?? FontCatalog.bookEmbeddedId,
      customFonts: availableCustomFonts,
    ).id;
    _hideNavigationLabels = prefs.getBool(_keyHideNavigationLabels) ?? true;
    final storedNavigationOrder = prefs.getStringList(_keyHomeNavigationOrder);
    _homeNavigationOrder = normalizeHomeNavigationOrder(storedNavigationOrder);
    final normalizedNavigationIds = _homeNavigationOrder
        .map((destination) => destination.storageId)
        .toList(growable: false);
    if (storedNavigationOrder != null &&
        !listEquals(storedNavigationOrder, normalizedNavigationIds)) {
      await prefs.setStringList(
        _keyHomeNavigationOrder,
        normalizedNavigationIds,
      );
    }
    _hiddenHomeNavigationDestinations =
        normalizeHiddenHomeNavigationDestinations(
          prefs.getStringList(_keyHomeNavigationHidden),
        );
    _customizeFloatingNavigationSize =
        prefs.getBool(_keyCustomizeFloatingNavigationSize) ?? false;
    _floatingNavigationHeight =
        (prefs.getDouble(_keyFloatingNavigationHeight) ?? 60)
            .clamp(52, 72)
            .toDouble();
    _floatingNavigationHorizontalMargin =
        (prefs.getDouble(_keyFloatingNavigationHorizontalMargin) ?? 24)
            .clamp(12, 48)
            .toDouble();
    _libraryLayoutMode = switch (prefs.getString(_keyLibraryLayoutMode)) {
      'card' => LibraryLayoutMode.card,
      _ => LibraryLayoutMode.grid,
    };
    _libraryGridColumns = switch (prefs.getInt(_keyLibraryGridColumns)) {
      3 => 3,
      _ => 2,
    };
    _libraryGridShowDetails = prefs.getBool(_keyLibraryGridShowDetails) ?? true;
    _libraryBookOpenAnimation = switch (prefs.getString(
      _keyLibraryBookOpenAnimation,
    )) {
      'classicCover' => LibraryBookOpenAnimation.classicCover,
      'paperRise' => LibraryBookOpenAnimation.paperRise,
      'pageSlide' => LibraryBookOpenAnimation.pageSlide,
      _ => LibraryBookOpenAnimation.minimalFade,
    };
    _libraryBookOpenAnimationPace = switch (prefs.getString(
      _keyLibraryBookOpenAnimationPace,
    )) {
      'fast' => LibraryBookOpenAnimationPace.fast,
      'elegant' => LibraryBookOpenAnimationPace.elegant,
      _ => LibraryBookOpenAnimationPace.fast,
    };
    _powerSavingMode =
        prefs.getBool(DisplayRefreshRateController.preferenceKey) ?? false;
    await _restoreSelectedFonts(prefs);
    _isInitialized = true;
    notifyListeners();
  }

  /// 启动时恢复用户导入的字体；文件缺失时回退系统字体。
  Future<void> _restoreSelectedFonts(SharedPreferences prefs) async {
    _appFontId = await _restoreFontSelection(
      prefs: prefs,
      key: _keyAppFontId,
      option: appFont,
      fallbackId: FontCatalog.defaultAppFont.id,
    );
    _readerFontId = await _restoreFontSelection(
      prefs: prefs,
      key: _keyReaderFontId,
      option: readerFont,
      fallbackId: FontCatalog.defaultReaderFont.id,
    );
    _epubReaderFontId = await _restoreFontSelection(
      prefs: prefs,
      key: _keyEpubReaderFontId,
      option: epubReaderFont,
      fallbackId: FontCatalog.bookEmbeddedId,
    );
  }

  Future<String> _restoreFontSelection({
    required SharedPreferences prefs,
    required String key,
    required FontOption option,
    required String fallbackId,
  }) async {
    if (await _ensureFontLoaded(option)) return option.id;
    debugPrint(
      'Selected font could not be loaded (${option.id}); resetting $key',
    );
    await prefs.setString(key, fallbackId);
    return fallbackId;
  }

  Future<bool> _ensureFontLoaded(FontOption option) async {
    if (option.isCustom) {
      return _customFontService.ensureLoaded(option.id);
    }
    return true;
  }

  void _applyLocaleCode(String code, {bool notify = true}) {
    _localeCode = code;
    _locale = _parseLocale(code);
    if (notify) {
      notifyListeners();
    }
  }

  Locale? _parseLocale(String code) {
    if (code.isEmpty || code == 'system') {
      return null;
    }
    final normalized = code.replaceAll('_', '-');
    final parts = normalized.split('-');
    if (parts.length >= 2) {
      return Locale(parts[0], parts[1]);
    }
    return Locale(parts[0]);
  }

  Future<void> setAppTextScaleLevel(int level) async {
    if (level < 0 ||
        level >= appTextScaleFactors.length ||
        level == _appTextScaleLevel) {
      return;
    }
    _appTextScaleLevel = level;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyAppTextScaleLevel, level);
  }

  Future<void> setLocaleCode(String code) async {
    _applyLocaleCode(code);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAppLocale, code);
    await prefs.setString(_keyLegacyLocale, code);
  }

  Future<void> setAppFontId(String id) async {
    final normalized = FontCatalog.appFontForId(
      id,
      customFonts: availableCustomFonts,
    ).id;
    if (normalized == _appFontId) return;
    final option = FontCatalog.appFontForId(
      normalized,
      customFonts: availableCustomFonts,
    );
    if (!await _ensureFontLoaded(option)) return;
    _appFontId = normalized;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyAppFontId, normalized);
  }

  Future<void> setReaderFontId(String id) async {
    final normalized = FontCatalog.readerFontForId(
      id,
      customFonts: availableCustomFonts,
    ).id;
    if (normalized == _readerFontId) return;
    final option = FontCatalog.readerFontForId(
      normalized,
      customFonts: availableCustomFonts,
    );
    if (!await _ensureFontLoaded(option)) return;
    _readerFontId = normalized;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyReaderFontId, normalized);
  }

  Future<void> setEpubReaderFontId(String id) async {
    final normalized = FontCatalog.epubReaderFontForId(
      id,
      customFonts: availableCustomFonts,
    ).id;
    if (normalized == _epubReaderFontId) return;
    final option = FontCatalog.epubReaderFontForId(
      normalized,
      customFonts: availableCustomFonts,
    );
    if (!await _ensureFontLoaded(option)) return;
    _epubReaderFontId = normalized;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEpubReaderFontId, normalized);
  }

  Future<void> setHideNavigationLabels(bool value) async {
    if (_hideNavigationLabels == value) return;
    _hideNavigationLabels = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyHideNavigationLabels, value);
  }

  Future<void> setShowNavigationLabels(bool value) =>
      setHideNavigationLabels(!value);

  Future<void> setCustomizeFloatingNavigationSize(bool value) async {
    if (_customizeFloatingNavigationSize == value) return;
    _customizeFloatingNavigationSize = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyCustomizeFloatingNavigationSize, value);
  }

  Future<void> setFloatingNavigationHeight(double value) async {
    final normalized = value.clamp(52, 72).toDouble();
    if (_floatingNavigationHeight == normalized) return;
    _floatingNavigationHeight = normalized;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyFloatingNavigationHeight, normalized);
  }

  Future<void> setFloatingNavigationHorizontalMargin(double value) async {
    final normalized = value.clamp(12, 48).toDouble();
    if (_floatingNavigationHorizontalMargin == normalized) return;
    _floatingNavigationHorizontalMargin = normalized;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyFloatingNavigationHorizontalMargin, normalized);
  }

  Future<void> setHomeNavigationOrder(
    List<HomeNavigationDestination> order,
  ) async {
    final normalized = normalizeHomeNavigationOrder(
      order.map((destination) => destination.storageId),
    );
    if (listEquals(_homeNavigationOrder, normalized)) return;
    _homeNavigationOrder = normalized;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _keyHomeNavigationOrder,
      normalized.map((destination) => destination.storageId).toList(),
    );
  }

  Future<void> setHomeNavigationDestinationVisible(
    HomeNavigationDestination destination,
    bool visible,
  ) async {
    if (destination == HomeNavigationDestination.settings && !visible) return;
    final next = Set<HomeNavigationDestination>.of(
      _hiddenHomeNavigationDestinations,
    );
    final changed = visible ? next.remove(destination) : next.add(destination);
    if (!changed) return;
    _hiddenHomeNavigationDestinations =
        Set<HomeNavigationDestination>.unmodifiable(next);
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _keyHomeNavigationHidden,
      next.map((destination) => destination.storageId).toList(growable: false),
    );
  }

  Future<void> resetHomeNavigationOrder() async {
    await setHomeNavigationOrder(defaultHomeNavigationOrder);
    if (!setEquals(
      _hiddenHomeNavigationDestinations,
      defaultHiddenHomeNavigationDestinations,
    )) {
      _hiddenHomeNavigationDestinations =
          defaultHiddenHomeNavigationDestinations;
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(
        _keyHomeNavigationHidden,
        defaultHiddenHomeNavigationDestinations
            .map((destination) => destination.storageId)
            .toList(growable: false),
      );
    }
  }

  Future<void> setLibraryLayoutMode(LibraryLayoutMode mode) async {
    if (_libraryLayoutMode == mode) return;
    _libraryLayoutMode = mode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLibraryLayoutMode, mode.name);
  }

  Future<void> setLibraryGridColumns(int columns) async {
    final normalized = columns == 2 ? 2 : 3;
    if (_libraryGridColumns == normalized) return;
    _libraryGridColumns = normalized;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyLibraryGridColumns, normalized);
  }

  Future<void> setLibraryGridShowDetails(bool value) async {
    if (_libraryGridShowDetails == value) return;
    _libraryGridShowDetails = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLibraryGridShowDetails, value);
  }

  Future<void> setLibraryBookOpenAnimation(
    LibraryBookOpenAnimation animation,
  ) async {
    if (_libraryBookOpenAnimation == animation) return;
    _libraryBookOpenAnimation = animation;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLibraryBookOpenAnimation, animation.name);
  }

  Future<void> setLibraryBookOpenAnimationPace(
    LibraryBookOpenAnimationPace pace,
  ) async {
    if (_libraryBookOpenAnimationPace == pace) return;
    _libraryBookOpenAnimationPace = pace;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLibraryBookOpenAnimationPace, pace.name);
  }

  Future<void> setPowerSavingMode(bool value) async {
    if (_powerSavingMode == value) return;
    _powerSavingMode = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(DisplayRefreshRateController.preferenceKey, value);
    await _displayRefreshRateController.apply(value);
  }

  Future<void> prepareCustomFontPreviews() async {
    await _customFontService.loadAvailableFonts();
  }

  Future<CustomFontImportResult> importCustomFont([FontDomain? domain]) async {
    final result = await _customFontService.importFont();
    final imported = result.font;
    if (imported == null) return result;
    notifyListeners();
    switch (domain) {
      case FontDomain.app:
        await setAppFontId(imported.id);
        break;
      case FontDomain.reader:
        await setReaderFontId(imported.id);
        break;
      case FontDomain.epubReader:
        await setEpubReaderFontId(imported.id);
        break;
      case null:
        break;
    }
    return result;
  }

  Future<void> renameCustomFont(String id, String displayName) async {
    await _customFontService.renameFont(id, displayName);
    notifyListeners();
  }

  Future<void> deleteCustomFont(String id) async {
    final prefs = await SharedPreferences.getInstance();
    var selectionChanged = false;
    if (_appFontId == id) {
      _appFontId = FontCatalog.defaultAppFont.id;
      await prefs.setString(_keyAppFontId, _appFontId);
      selectionChanged = true;
    }
    if (_readerFontId == id) {
      _readerFontId = FontCatalog.defaultReaderFont.id;
      await prefs.setString(_keyReaderFontId, _readerFontId);
      selectionChanged = true;
    }
    if (_epubReaderFontId == id) {
      _epubReaderFontId = FontCatalog.bookEmbeddedId;
      await prefs.setString(_keyEpubReaderFontId, _epubReaderFontId);
      selectionChanged = true;
    }
    if (selectionChanged) notifyListeners();
    await _customFontService.deleteFont(id);
    notifyListeners();
  }

  bool isAppFont(String id) => _appFontId == id;
  bool isReaderFont(String id) =>
      _readerFontId == id || _epubReaderFontId == id;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
