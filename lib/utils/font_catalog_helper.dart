import 'package:flutter/foundation.dart';

import '../l10n/app_localizations.dart';

enum FontTone { system, serif, sansSerif, monospace }

enum FontDomain { app, reader, epubReader }

class FontOption {
  const FontOption({
    required this.id,
    required this.family,
    required this.fallbackFamilies,
    required this.tone,
    this.displayName,
    this.sourceFileName,
    this.fileSize,
    this.isCustom = false,
    this.isAvailable = true,
    this.variableWeightMin,
    this.variableWeightMax,
  });

  final String id;
  final String? family;
  final List<String> fallbackFamilies;
  final FontTone tone;
  final String? displayName;
  final String? sourceFileName;
  final int? fileSize;
  final bool isCustom;
  final bool isAvailable;
  final int? variableWeightMin;
  final int? variableWeightMax;

  bool get supportsVariableWeight =>
      variableWeightMin != null && variableWeightMax != null;
}

class FontCatalog {
  static const String bookEmbeddedId = 'book_embedded';
  static const String systemId = 'system';
  static const String pingFangScId = 'ping_fang_sc';

  static const FontOption systemFont = FontOption(
    id: systemId,
    family: null,
    fallbackFamilies: <String>[],
    tone: FontTone.system,
  );
  static const FontOption bookEmbeddedFont = FontOption(
    id: bookEmbeddedId,
    family: null,
    fallbackFamilies: <String>[],
    tone: FontTone.system,
  );
  static const FontOption pingFangSc = FontOption(
    id: pingFangScId,
    family: 'PingFang SC',
    fallbackFamilies: <String>['PingFang TC'],
    tone: FontTone.sansSerif,
    displayName: '苹方',
  );

  static const FontOption defaultAppFont = systemFont;
  static const FontOption defaultReaderFont = systemFont;
  static const List<FontOption> appFonts = <FontOption>[systemFont];

  static List<FontOption> get readerFonts =>
      readerFontsForPlatform(defaultTargetPlatform);

  static List<FontOption> readerFontsForPlatform(TargetPlatform platform) =>
      platform == TargetPlatform.iOS || platform == TargetPlatform.macOS
      ? const <FontOption>[systemFont, pingFangSc]
      : const <FontOption>[systemFont];

  static FontOption appFontForId(
    String? id, {
    List<FontOption> customFonts = const <FontOption>[],
  }) => _fontForId(
    id,
    options: <FontOption>[...appFonts, ...customFonts],
    fallback: defaultAppFont,
  );

  static FontOption readerFontForId(
    String? id, {
    List<FontOption> customFonts = const <FontOption>[],
  }) => _fontForId(
    id,
    options: <FontOption>[
      ...readerFontsForPlatform(defaultTargetPlatform),
      ...customFonts,
    ],
    fallback: defaultReaderFont,
  );

  static FontOption epubReaderFontForId(
    String? id, {
    List<FontOption> customFonts = const <FontOption>[],
  }) => _fontForId(
    id,
    options: <FontOption>[
      bookEmbeddedFont,
      ...readerFontsForPlatform(defaultTargetPlatform),
      ...customFonts,
    ],
    fallback: bookEmbeddedFont,
  );

  static FontOption appFontForFamily(String? family) => appFonts.firstWhere(
    (option) => option.family == family,
    orElse: () => defaultAppFont,
  );

  static FontOption _fontForId(
    String? id, {
    required List<FontOption> options,
    required FontOption fallback,
  }) => options.firstWhere((option) => option.id == id, orElse: () => fallback);

  static List<String> appFallbacks(String? family) =>
      appFontForFamily(family).fallbackFamilies;

  static String labelFor(AppLocalizations l10n, FontOption option) {
    if (option.displayName?.isNotEmpty == true) return option.displayName!;
    return switch (option.id) {
      bookEmbeddedId => l10n.fontBookEmbedded,
      systemId => l10n.fontSystem,
      _ => option.displayName ?? l10n.fontSystem,
    };
  }

  static String descriptionFor(AppLocalizations l10n, FontOption option) =>
      switch (option.tone) {
        FontTone.system => l10n.fontSystemDescription,
        FontTone.serif => l10n.fontSerifDescription,
        FontTone.sansSerif => l10n.fontSansSerifDescription,
        FontTone.monospace => l10n.fontMonospaceDescription,
      };
}
