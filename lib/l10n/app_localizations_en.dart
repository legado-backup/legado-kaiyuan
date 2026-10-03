// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get library => 'Bookshelf';

  @override
  String get settings => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String get accent => 'Accent Color';

  @override
  String get bookmarks => 'Bookmarks';

  @override
  String get notes => 'Notes';

  @override
  String get highlights => 'Highlights';

  @override
  String get ttsReading => 'Text-to-Speech';

  @override
  String get pause => 'Pause';

  @override
  String get stop => 'Stop';

  @override
  String get language => 'Language';

  @override
  String get fontSize => 'Font Size';

  @override
  String get readingProgress => 'Reading Progress';

  @override
  String get totalPages => 'Total Pages';

  @override
  String get currentPage => 'Current Page';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get save => 'Save';

  @override
  String get back => 'Back';

  @override
  String get next => 'Next';

  @override
  String get previous => 'Previous';

  @override
  String get search => 'Search';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get readingSettings => 'Reading Settings';

  @override
  String get readerFont => 'Reading font';

  @override
  String get readerFontSelectionDescription =>
      'Choose the font for reading. EPUB offers the book font, the system font, and your installed fonts.';

  @override
  String get readerFontBookPriorityHint =>
      'Uses the book’s embedded font when available; otherwise uses the platform-default reading font.';

  @override
  String get readerFontOverrideHint =>
      'Overrides fonts embedded by the publisher.';

  @override
  String get fontBookEmbedded => 'Book Embedded';

  @override
  String get fontSystem => 'Platform Default';

  @override
  String get fontSystemDescription =>
      'Uses a platform-optimized reading font for stable glyphs and pagination.';

  @override
  String get fontSerifDescription =>
      'Serif type with a calm, editorial character for sustained reading.';

  @override
  String get fontSansSerifDescription =>
      'Clear sans serif type suited to compact interfaces and everyday reading.';

  @override
  String get fontMonospaceDescription =>
      'Fixed-width type suited to code, technical material, and focused layouts.';

  @override
  String get fontPreviewText => 'Origo X · Read freely 开卷有益';

  @override
  String get customFonts => 'My fonts';

  @override
  String get builtInFonts => 'Built-in fonts';

  @override
  String fontVariableWeightRange(int min, int max) {
    return 'Adjustable weight $min–$max';
  }

  @override
  String get fontStaticWeight => 'Fixed weight (bold is synthesized)';

  @override
  String get importFont => 'Import font';

  @override
  String get importingFont => 'Importing font…';

  @override
  String get customFontImportUnsupported =>
      'Persistent font import is not supported on this platform yet.';

  @override
  String get customFontUnsupportedFormat => 'Choose a TTF or OTF font file.';

  @override
  String get customFontInvalid => 'This file is not a valid or supported font.';

  @override
  String get customFontTooLarge => 'The font file is larger than 50 MB.';

  @override
  String get customFontReadFailed => 'The font file could not be read.';

  @override
  String get customFontLoadFailed => 'The font could not be loaded.';

  @override
  String get customFontStorageFailed =>
      'The font could not be saved on this device.';

  @override
  String get renameFont => 'Rename font';

  @override
  String get fontFamilyLabel => 'Font';

  @override
  String get fontSizeLabel => 'Font Size';

  @override
  String get readerFontWeightLabel => 'Font Weight';

  @override
  String get readerFontWeightLight => 'Light';

  @override
  String get readerFontWeightRegular => 'Regular';

  @override
  String get readerFontWeightMedium => 'Medium';

  @override
  String get readerFontWeightSemiBold => 'Semi-bold';

  @override
  String get readerFontWeightBold => 'Bold';

  @override
  String readerFontWeightVariableHint(int min, int max) {
    return 'Reading controls use five legible steps from 300–700. This font\'s true full range is $min–$max.';
  }

  @override
  String get readerFontWeightSyntheticHint =>
      'Reading controls use five steps from 300–700. This font has no declared variable weight axis, so the system approximates the result and it may differ by platform.';

  @override
  String get readerFontWeightPreview => 'A quiet page reads farther · 字里行间';

  @override
  String get lineSpacingLabel => 'Line Spacing';

  @override
  String get letterSpacingLabel => 'Letter Spacing';

  @override
  String get textAlignmentLabel => 'Text Alignment';

  @override
  String get textAlignmentNatural => 'Natural';

  @override
  String get textAlignmentJustified => 'Justified';

  @override
  String get firstLineIndentLabel => 'First-line Indent';

  @override
  String get paragraphSpacingLabel => 'Paragraph Spacing';

  @override
  String get pageTurningMode => 'Page Mode';

  @override
  String get pageTurningSlide => 'Horizontal Slide';

  @override
  String get pageTurningScroll => 'Vertical paging';

  @override
  String get tapZoneSettings => 'Tap Zones';

  @override
  String get tapZoneNextPage => 'Next Page';

  @override
  String get tapZonePreviousPage => 'Previous Page';

  @override
  String get tapZoneMenu => 'Menu';

  @override
  String get tapZoneNextChapter => 'Next Chapter';

  @override
  String get tapZonePreviousChapter => 'Previous Chapter';

  @override
  String get tapZoneNone => 'No Action';

  @override
  String get tapZoneSettingsHint =>
      'Customize what each of the nine tap areas does';

  @override
  String get tapZoneChooseAction => 'Choose an action';

  @override
  String get tapZoneMenuRequiredHint =>
      'Tap an area to change its action. At least one area must stay Menu; if every Menu is removed, the center area becomes Menu again.';

  @override
  String get tapZoneReset => 'Restore Defaults';

  @override
  String get highlightColor => 'Highlight Color';

  @override
  String get noteTypeHighlight => 'Highlight';

  @override
  String get noteTypeUnderline => 'Underline';

  @override
  String get noteTypeNote => 'Note';

  @override
  String get author => 'Author';

  @override
  String get progress => 'Progress';

  @override
  String get deleteBook => 'Delete Book';

  @override
  String get readerToolbarTOC => 'Table of Contents';

  @override
  String get readerAddBookmark => 'Add Bookmark';

  @override
  String get bookmarkAdded => 'Bookmark added';

  @override
  String get bookmarkRemoved => 'Bookmark removed';

  @override
  String get readerNavigationTitle => 'Reading navigation';

  @override
  String readerNavigationPosition(int current, int total) {
    return 'Chapter $current of $total';
  }

  @override
  String get readerSearchChapters => 'Search chapters';

  @override
  String get readerBackToCurrentChapter => 'Back to current chapter';

  @override
  String get readerCurrentChapter => 'Current';

  @override
  String get readerCurrentPosition => 'Current position';

  @override
  String get readerNoChapterResults => 'No matching chapters';

  @override
  String get readerNoChapterResultsHint =>
      'Try another word from the chapter title.';

  @override
  String get readerNoBookmarks => 'No bookmarks yet';

  @override
  String get readerNoBookmarksHint =>
      'Tap the bookmark button in the top-right corner to save your place.';

  @override
  String get readerUnsupportedFormat => 'This format can\'t be read yet.';

  @override
  String get currentChapter => 'Current chapter';

  @override
  String get readerPrefaceTitle => 'Front Matter';

  @override
  String get readerModeHorizontalPage => 'No Animation';

  @override
  String get readerModeVerticalScrollHint =>
      'Slide through pre-paginated pages vertically; swipe sideways to change chapters';

  @override
  String get readerModeWholeBookScrollHint =>
      'Pre-paginated chapters form one positionable vertical list';

  @override
  String get readerScrollByChapterTitle => 'Scroll by chapter';

  @override
  String get readerScrollByChapterOnHint =>
      'Slide through one chapter page by page, then swipe sideways to change chapters';

  @override
  String get readerScrollByChapterOffHint =>
      'All chapters connect page by page in one positionable vertical list';

  @override
  String get readerModeHorizontalPageHint =>
      'Tap the left side for the previous page, the right side for the next page';

  @override
  String get readerModeHorizontalSlideHint =>
      'Pages follow your finger horizontally and snap into place';

  @override
  String get readerModeCoverSlide => 'Cover';

  @override
  String get readerModeCoverSlideHint =>
      'The current page slides off to the left, uncovering the next page beneath it';

  @override
  String get readerModePageCurl => 'Page Curl';

  @override
  String get readerModePageCurlHint =>
      'Drag sideways to curl the page, then release to turn or rebound';

  @override
  String get readerTextBrightnessLabel => 'Text Brightness';

  @override
  String get readerDimTextInDarkModeTitle => 'Dim text in dark mode';

  @override
  String get readerDimTextInDarkModeHint => 'Use 70% brightness in dark mode';

  @override
  String get readerHorizontalMarginLabel => 'Horizontal margin';

  @override
  String get readerTopMarginLabel => 'Top margin';

  @override
  String get readerBottomMarginLabel => 'Bottom margin';

  @override
  String get readerTxtChapterTitlePageTitle => 'Chapter title on its own page';

  @override
  String get readerTxtChapterTitlePageHint =>
      'When off, the chapter title appears above the body text';

  @override
  String readerChapterFallback(int number) {
    return 'Chapter $number';
  }

  @override
  String readerOpenFailed(String error) {
    return 'Failed to open: $error';
  }

  @override
  String get readerNoContent => 'This book has no readable content';

  @override
  String readerStatusPaged(
    int chapter,
    int chapterCount,
    int page,
    int pageCount,
  ) {
    return 'Chapter $chapter/$chapterCount · Page $page/$pageCount';
  }

  @override
  String get readerTopBarStyleTitle => 'Top information';

  @override
  String get readerTopBarStyleSystem => 'System status bar';

  @override
  String get readerTopBarStyleSystemHint =>
      'Show the system time, signal, and battery';

  @override
  String get readerTopBarStyleReader => 'Reader information bar';

  @override
  String get readerTopBarStyleReaderHint =>
      'Show time, chapter title, and battery';

  @override
  String get readerTopBarStyleFloating => 'Floating info bar';

  @override
  String get readerTopBarStyleFloatingHint =>
      'Show time and battery in the status bar area without taking reading space';

  @override
  String get readerTopBarStyleHidden => 'Fully immersive';

  @override
  String get readerTopBarStyleHiddenHint => 'Show no information at the top';

  @override
  String get readerThemeTitle => 'Reading theme';

  @override
  String get readerThemeDescription =>
      'Only changes the reading page and its controls';

  @override
  String get readerSettingsTabTheme => 'Theme';

  @override
  String get readerSettingsTabText => 'Text';

  @override
  String get readerSettingsTabLayout => 'Layout';

  @override
  String get readerSettingsTabPaging => 'Paging';

  @override
  String get readerSettingsAdvancedTypography => 'Advanced typography';

  @override
  String get readerAutoPageTurnTitle => 'Auto page turn';

  @override
  String get readerAutoPageTurnOff => 'Not started';

  @override
  String get readerAutoPageTurnShortcutTitle => 'Automatic reading shortcut';

  @override
  String get readerAutoPageTurnShortcutHint =>
      'Show with the reading controls for quick start or pause';

  @override
  String get readerAutoPageTurnModeTimed => 'Timed page turn';

  @override
  String get readerAutoPageTurnModeSweep => 'Sweep page turn';

  @override
  String get readerAutoPageTurnModeContinuous => 'Continuous scroll';

  @override
  String get readerAutoPageTurnModeInterval => 'Interval scroll';

  @override
  String get readerAutoPageTurnTimedHint =>
      'Wait for the selected interval, then turn to the next page.';

  @override
  String get readerAutoPageTurnSweepHint =>
      'A line sweeps downward, gradually revealing the next page above it.';

  @override
  String get readerAutoPageTurnContinuousHint =>
      'Scroll downward continuously at a steady reading speed.';

  @override
  String get readerAutoPageTurnIntervalHint =>
      'Wait for the selected interval, then scroll down by about one screen.';

  @override
  String get readerAutoPageTurnSweepDurationLabel => 'Sweep duration';

  @override
  String get readerAutoPageTurnScrollSpeedLabel => 'Scroll speed';

  @override
  String readerAutoPageTurnSecondsPerScreen(int seconds) {
    return '$seconds seconds per screen';
  }

  @override
  String readerAutoPageTurnModeValue(String mode, int seconds) {
    return '$mode · ${seconds}s/screen';
  }

  @override
  String readerAutoPageTurnModePaused(String mode, int seconds) {
    return 'Paused · $mode · ${seconds}s/screen';
  }

  @override
  String get readerAutoPageTurnIntervalLabel => 'Page interval';

  @override
  String get readerAutoPageTurnStart => 'Start auto page turn';

  @override
  String get readerAutoPageTurnResume => 'Resume auto page turn';

  @override
  String get readerThemeDay => 'Day';

  @override
  String get readerThemeFollowSystem => 'Follow system';

  @override
  String get readerThemeMist => 'Mist';

  @override
  String get readerThemeGreen => 'Eye care';

  @override
  String get readerThemeRose => 'Rose';

  @override
  String get readerThemeNavy => 'Deep blue';

  @override
  String get readerThemeNight => 'Night';

  @override
  String get readerThemePureBlack => 'Pure black';

  @override
  String get readerThemeParchment => 'Parchment';

  @override
  String get readerThemeCustom => 'Custom';

  @override
  String get readerPullBookmarkTitle => 'Pull-down bookmark';

  @override
  String get readerPullBookmarkHint =>
      'Pull down from the top edge and release to add or remove a bookmark for this page';

  @override
  String get readerPullBookmarkAddHint => 'Pull farther to add bookmark';

  @override
  String get readerPullBookmarkRemoveHint => 'Pull farther to remove bookmark';

  @override
  String get readerPullBookmarkReleaseHint => 'Release to finish';

  @override
  String get readerTapAnimationTitle => 'Tap animation';

  @override
  String get readerTapAnimationHint =>
      'Use the current page-turn animation for side taps; turn off to refresh instantly';

  @override
  String get readerTabletTwoPageTitle => 'Tablet two-page layout';

  @override
  String get readerTabletTwoPageHint =>
      'Show left and right pages side by side in landscape; turn off to always use a single page';

  @override
  String get readerCustomThemeReset => 'Reset';

  @override
  String get readerCustomThemeColors => 'Theme colors';

  @override
  String get readerCustomThemeTextColor => 'Text color';

  @override
  String get readerCustomThemeTextColorHint =>
      'Body text, headings, and primary icons';

  @override
  String get readerCustomThemeBackground => 'Reading background';

  @override
  String get readerCustomThemeBackgroundHint =>
      'The paper and reading canvas color';

  @override
  String get readerCustomThemeControlBar => 'Control bar color';

  @override
  String get readerCustomThemeControlBarHint =>
      'Top and bottom controls and settings surfaces';

  @override
  String get readerCustomThemeContrastGood =>
      'Text has clear contrast for comfortable long reading';

  @override
  String get readerCustomThemeContrastLow =>
      'Text contrast is low and may cause reading fatigue';

  @override
  String get readerCustomThemeSave => 'Save and use';

  @override
  String get readerCustomThemePreview => 'Live preview';

  @override
  String get readerCustomThemePreviewChapter =>
      'Chapter One · Wind Between the Pages';

  @override
  String get readerCustomThemePreviewBody =>
      'This is your reading space. Tune the text, paper, and control colors until every page feels distinctly yours.';

  @override
  String get readerCustomThemeHexInvalid =>
      'Enter a 6-digit hex color, such as #F6F0E4';

  @override
  String get readerCustomThemeHexLabel => 'Hex color';

  @override
  String get readerCustomThemeAdd => 'Add theme';

  @override
  String get readerCustomThemeReorderHint =>
      'Hold the handle on the right to reorder themes. The same order appears in reading settings.';

  @override
  String get readerCustomThemeUse => 'Use selected theme';

  @override
  String get readerCustomThemeDeleteTitle => 'Delete reading theme?';

  @override
  String readerCustomThemeDeleteMessage(String name) {
    return '“$name” will be removed from your themes, along with its saved background image.';
  }

  @override
  String get readerCustomThemeNewTitle => 'New reading theme';

  @override
  String get readerCustomThemeEditTitle => 'Edit reading theme';

  @override
  String get readerCustomThemeName => 'Theme name';

  @override
  String get readerCustomThemeNameHint =>
      'For example, Rainy night or Afternoon paper';

  @override
  String get readerCustomThemeBackgroundImage => 'Background image';

  @override
  String get readerCustomThemeBackgroundImageHint =>
      'Supports JPG, PNG, and WebP. The image is copied into app storage.';

  @override
  String get readerCustomThemeChooseImage => 'Upload image';

  @override
  String get readerCustomThemeReplaceImage => 'Replace image';

  @override
  String get readerCustomThemeRemoveImage => 'Remove image';

  @override
  String get readerCustomThemeImageStrength => 'Background image strength';

  @override
  String get readerCustomThemeImageUnsupported =>
      'Background image import is not supported on this platform';

  @override
  String get readerCustomThemeImageTooLarge =>
      'The image must be no larger than 20 MB';

  @override
  String get readerCustomThemeImageFormat => 'Choose a JPG, PNG, or WebP image';

  @override
  String get readerCustomThemeImageFailed =>
      'Could not import the background image. Try again.';

  @override
  String get importUnknownTitle => 'Unknown title';

  @override
  String get importUnknownAuthor => 'Unknown author';

  @override
  String get bookUntitled => 'Untitled';

  @override
  String get readerAddAnnotation => 'Add annotation';

  @override
  String get readerAnnotationHint => 'Write your thoughts about this passage…';

  @override
  String get readerAnnotationSaved => 'Annotation saved';

  @override
  String get readerAnnotationDeleted => 'Annotation deleted';

  @override
  String get readerNoAnnotations => 'No annotations yet';

  @override
  String get readerNoAnnotationsHint =>
      'Select text to highlight or add a comment. Tap an underlined comment to read it again.';

  @override
  String get readerChapterProgressTitle => 'Chapter progress';

  @override
  String get readerChapterProgressHidden => 'Hidden';

  @override
  String readerChapterProgressFraction(int chapter, int total) {
    return '$chapter/$total chapters';
  }

  @override
  String readerChapterProgressRemaining(int count) {
    return '$count chapters ahead';
  }
}
