import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh'),
    Locale('zh', 'TW'),
  ];

  /// Home tab label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Library tab label
  ///
  /// In en, this message translates to:
  /// **'Bookshelf'**
  String get library;

  /// Settings tab label
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Theme setting section
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Accent color setting label
  ///
  /// In en, this message translates to:
  /// **'Accent Color'**
  String get accent;

  /// Bookmarks feature label
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get bookmarks;

  /// Notes feature label
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// Highlights feature label
  ///
  /// In en, this message translates to:
  /// **'Highlights'**
  String get highlights;

  /// TTS reading feature label
  ///
  /// In en, this message translates to:
  /// **'Text-to-Speech'**
  String get ttsReading;

  /// Pause TTS button
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// Stop TTS button
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// Language setting
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Font size setting
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get fontSize;

  /// Reading progress indicator
  ///
  /// In en, this message translates to:
  /// **'Reading Progress'**
  String get readingProgress;

  /// Total pages label
  ///
  /// In en, this message translates to:
  /// **'Total Pages'**
  String get totalPages;

  /// Current page label
  ///
  /// In en, this message translates to:
  /// **'Current Page'**
  String get currentPage;

  /// Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Confirm button
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Delete button
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Edit button
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Save button
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Back button
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Next button
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Previous button
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// Search function
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Loading indicator text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Error message
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Reading settings section
  ///
  /// In en, this message translates to:
  /// **'Reading Settings'**
  String get readingSettings;

  /// Reader content font setting
  ///
  /// In en, this message translates to:
  /// **'Reading font'**
  String get readerFont;

  /// Explains reader font selection and EPUB embedded-font behavior
  ///
  /// In en, this message translates to:
  /// **'Choose the font for reading. EPUB offers the book font, the system font, and your installed fonts.'**
  String get readerFontSelectionDescription;

  /// Hint shown when the system reader font is selected
  ///
  /// In en, this message translates to:
  /// **'Uses the book’s embedded font when available; otherwise uses the platform-default reading font.'**
  String get readerFontBookPriorityHint;

  /// Hint shown when a personalized reader font is selected
  ///
  /// In en, this message translates to:
  /// **'Overrides fonts embedded by the publisher.'**
  String get readerFontOverrideHint;

  /// No description provided for @fontBookEmbedded.
  ///
  /// In en, this message translates to:
  /// **'Book Embedded'**
  String get fontBookEmbedded;

  /// System default font
  ///
  /// In en, this message translates to:
  /// **'Platform Default'**
  String get fontSystem;

  /// System font option description
  ///
  /// In en, this message translates to:
  /// **'Uses a platform-optimized reading font for stable glyphs and pagination.'**
  String get fontSystemDescription;

  /// Serif font option description
  ///
  /// In en, this message translates to:
  /// **'Serif type with a calm, editorial character for sustained reading.'**
  String get fontSerifDescription;

  /// Sans serif font option description
  ///
  /// In en, this message translates to:
  /// **'Clear sans serif type suited to compact interfaces and everyday reading.'**
  String get fontSansSerifDescription;

  /// Monospace font option description
  ///
  /// In en, this message translates to:
  /// **'Fixed-width type suited to code, technical material, and focused layouts.'**
  String get fontMonospaceDescription;

  /// Bilingual font preview sample
  ///
  /// In en, this message translates to:
  /// **'Origo X · Read freely 开卷有益'**
  String get fontPreviewText;

  /// No description provided for @customFonts.
  ///
  /// In en, this message translates to:
  /// **'My fonts'**
  String get customFonts;

  /// No description provided for @builtInFonts.
  ///
  /// In en, this message translates to:
  /// **'Built-in fonts'**
  String get builtInFonts;

  /// No description provided for @fontVariableWeightRange.
  ///
  /// In en, this message translates to:
  /// **'Adjustable weight {min}–{max}'**
  String fontVariableWeightRange(int min, int max);

  /// No description provided for @fontStaticWeight.
  ///
  /// In en, this message translates to:
  /// **'Fixed weight (bold is synthesized)'**
  String get fontStaticWeight;

  /// No description provided for @importFont.
  ///
  /// In en, this message translates to:
  /// **'Import font'**
  String get importFont;

  /// No description provided for @importingFont.
  ///
  /// In en, this message translates to:
  /// **'Importing font…'**
  String get importingFont;

  /// No description provided for @customFontImportUnsupported.
  ///
  /// In en, this message translates to:
  /// **'Persistent font import is not supported on this platform yet.'**
  String get customFontImportUnsupported;

  /// No description provided for @customFontUnsupportedFormat.
  ///
  /// In en, this message translates to:
  /// **'Choose a TTF or OTF font file.'**
  String get customFontUnsupportedFormat;

  /// No description provided for @customFontInvalid.
  ///
  /// In en, this message translates to:
  /// **'This file is not a valid or supported font.'**
  String get customFontInvalid;

  /// No description provided for @customFontTooLarge.
  ///
  /// In en, this message translates to:
  /// **'The font file is larger than 50 MB.'**
  String get customFontTooLarge;

  /// No description provided for @customFontReadFailed.
  ///
  /// In en, this message translates to:
  /// **'The font file could not be read.'**
  String get customFontReadFailed;

  /// No description provided for @customFontLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'The font could not be loaded.'**
  String get customFontLoadFailed;

  /// No description provided for @customFontStorageFailed.
  ///
  /// In en, this message translates to:
  /// **'The font could not be saved on this device.'**
  String get customFontStorageFailed;

  /// No description provided for @renameFont.
  ///
  /// In en, this message translates to:
  /// **'Rename font'**
  String get renameFont;

  /// Font family label
  ///
  /// In en, this message translates to:
  /// **'Font'**
  String get fontFamilyLabel;

  /// Font size label
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get fontSizeLabel;

  /// No description provided for @readerFontWeightLabel.
  ///
  /// In en, this message translates to:
  /// **'Font Weight'**
  String get readerFontWeightLabel;

  /// No description provided for @readerFontWeightLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get readerFontWeightLight;

  /// No description provided for @readerFontWeightRegular.
  ///
  /// In en, this message translates to:
  /// **'Regular'**
  String get readerFontWeightRegular;

  /// No description provided for @readerFontWeightMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get readerFontWeightMedium;

  /// No description provided for @readerFontWeightSemiBold.
  ///
  /// In en, this message translates to:
  /// **'Semi-bold'**
  String get readerFontWeightSemiBold;

  /// No description provided for @readerFontWeightBold.
  ///
  /// In en, this message translates to:
  /// **'Bold'**
  String get readerFontWeightBold;

  /// No description provided for @readerFontWeightVariableHint.
  ///
  /// In en, this message translates to:
  /// **'Reading controls use five legible steps from 300–700. This font\'s true full range is {min}–{max}.'**
  String readerFontWeightVariableHint(int min, int max);

  /// No description provided for @readerFontWeightSyntheticHint.
  ///
  /// In en, this message translates to:
  /// **'Reading controls use five steps from 300–700. This font has no declared variable weight axis, so the system approximates the result and it may differ by platform.'**
  String get readerFontWeightSyntheticHint;

  /// No description provided for @readerFontWeightPreview.
  ///
  /// In en, this message translates to:
  /// **'A quiet page reads farther · 字里行间'**
  String get readerFontWeightPreview;

  /// Line spacing label
  ///
  /// In en, this message translates to:
  /// **'Line Spacing'**
  String get lineSpacingLabel;

  /// Letter spacing label
  ///
  /// In en, this message translates to:
  /// **'Letter Spacing'**
  String get letterSpacingLabel;

  /// Reader body text alignment label
  ///
  /// In en, this message translates to:
  /// **'Text Alignment'**
  String get textAlignmentLabel;

  /// Natural reader body text alignment
  ///
  /// In en, this message translates to:
  /// **'Natural'**
  String get textAlignmentNatural;

  /// Justified reader body text alignment
  ///
  /// In en, this message translates to:
  /// **'Justified'**
  String get textAlignmentJustified;

  /// First line indent label
  ///
  /// In en, this message translates to:
  /// **'First-line Indent'**
  String get firstLineIndentLabel;

  /// Additional spacing between reader paragraphs
  ///
  /// In en, this message translates to:
  /// **'Paragraph Spacing'**
  String get paragraphSpacingLabel;

  /// Page turning mode
  ///
  /// In en, this message translates to:
  /// **'Page Mode'**
  String get pageTurningMode;

  /// Slide page turning
  ///
  /// In en, this message translates to:
  /// **'Horizontal Slide'**
  String get pageTurningSlide;

  /// Scroll page turning
  ///
  /// In en, this message translates to:
  /// **'Vertical paging'**
  String get pageTurningScroll;

  /// Tap zone settings
  ///
  /// In en, this message translates to:
  /// **'Tap Zones'**
  String get tapZoneSettings;

  /// Next page tap zone
  ///
  /// In en, this message translates to:
  /// **'Next Page'**
  String get tapZoneNextPage;

  /// Previous page tap zone
  ///
  /// In en, this message translates to:
  /// **'Previous Page'**
  String get tapZonePreviousPage;

  /// Menu tap zone
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get tapZoneMenu;

  /// Next chapter tap zone
  ///
  /// In en, this message translates to:
  /// **'Next Chapter'**
  String get tapZoneNextChapter;

  /// Previous chapter tap zone
  ///
  /// In en, this message translates to:
  /// **'Previous Chapter'**
  String get tapZonePreviousChapter;

  /// Tap zone without any action
  ///
  /// In en, this message translates to:
  /// **'No Action'**
  String get tapZoneNone;

  /// Tap zone settings entry hint
  ///
  /// In en, this message translates to:
  /// **'Customize what each of the nine tap areas does'**
  String get tapZoneSettingsHint;

  /// Tap zone action picker title
  ///
  /// In en, this message translates to:
  /// **'Choose an action'**
  String get tapZoneChooseAction;

  /// Tap zone editor menu requirement hint
  ///
  /// In en, this message translates to:
  /// **'Tap an area to change its action. At least one area must stay Menu; if every Menu is removed, the center area becomes Menu again.'**
  String get tapZoneMenuRequiredHint;

  /// Tap zone reset button
  ///
  /// In en, this message translates to:
  /// **'Restore Defaults'**
  String get tapZoneReset;

  /// Highlight color label
  ///
  /// In en, this message translates to:
  /// **'Highlight Color'**
  String get highlightColor;

  /// Highlight note type
  ///
  /// In en, this message translates to:
  /// **'Highlight'**
  String get noteTypeHighlight;

  /// Underline note type
  ///
  /// In en, this message translates to:
  /// **'Underline'**
  String get noteTypeUnderline;

  /// Note type
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get noteTypeNote;

  /// Author label
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get author;

  /// Progress label
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// Delete book action
  ///
  /// In en, this message translates to:
  /// **'Delete Book'**
  String get deleteBook;

  /// Table of contents
  ///
  /// In en, this message translates to:
  /// **'Table of Contents'**
  String get readerToolbarTOC;

  /// Add bookmark
  ///
  /// In en, this message translates to:
  /// **'Add Bookmark'**
  String get readerAddBookmark;

  /// Bookmark added message
  ///
  /// In en, this message translates to:
  /// **'Bookmark added'**
  String get bookmarkAdded;

  /// Bookmark removed message
  ///
  /// In en, this message translates to:
  /// **'Bookmark removed'**
  String get bookmarkRemoved;

  /// No description provided for @readerNavigationTitle.
  ///
  /// In en, this message translates to:
  /// **'Reading navigation'**
  String get readerNavigationTitle;

  /// No description provided for @readerNavigationPosition.
  ///
  /// In en, this message translates to:
  /// **'Chapter {current} of {total}'**
  String readerNavigationPosition(int current, int total);

  /// No description provided for @readerSearchChapters.
  ///
  /// In en, this message translates to:
  /// **'Search chapters'**
  String get readerSearchChapters;

  /// No description provided for @readerBackToCurrentChapter.
  ///
  /// In en, this message translates to:
  /// **'Back to current chapter'**
  String get readerBackToCurrentChapter;

  /// No description provided for @readerCurrentChapter.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get readerCurrentChapter;

  /// No description provided for @readerCurrentPosition.
  ///
  /// In en, this message translates to:
  /// **'Current position'**
  String get readerCurrentPosition;

  /// No description provided for @readerNoChapterResults.
  ///
  /// In en, this message translates to:
  /// **'No matching chapters'**
  String get readerNoChapterResults;

  /// No description provided for @readerNoChapterResultsHint.
  ///
  /// In en, this message translates to:
  /// **'Try another word from the chapter title.'**
  String get readerNoChapterResultsHint;

  /// No description provided for @readerNoBookmarks.
  ///
  /// In en, this message translates to:
  /// **'No bookmarks yet'**
  String get readerNoBookmarks;

  /// No description provided for @readerNoBookmarksHint.
  ///
  /// In en, this message translates to:
  /// **'Tap the bookmark button in the top-right corner to save your place.'**
  String get readerNoBookmarksHint;

  /// Toast shown when opening an unsupported book format
  ///
  /// In en, this message translates to:
  /// **'This format can\'t be read yet.'**
  String get readerUnsupportedFormat;

  /// Current chapter label in the local book information dialog
  ///
  /// In en, this message translates to:
  /// **'Current chapter'**
  String get currentChapter;

  /// Chapter title for TXT content that appears before the first detected chapter heading
  ///
  /// In en, this message translates to:
  /// **'Front Matter'**
  String get readerPrefaceTitle;

  /// Page mode option: content split into pages turned instantly by tapping
  ///
  /// In en, this message translates to:
  /// **'No Animation'**
  String get readerModeHorizontalPage;

  /// Subtitle explaining the vertical scroll page mode
  ///
  /// In en, this message translates to:
  /// **'Slide through pre-paginated pages vertically; swipe sideways to change chapters'**
  String get readerModeVerticalScrollHint;

  /// Subtitle explaining whole-book continuous vertical scrolling
  ///
  /// In en, this message translates to:
  /// **'Pre-paginated chapters form one positionable vertical list'**
  String get readerModeWholeBookScrollHint;

  /// Switch controlling whether vertical scrolling is limited to one chapter
  ///
  /// In en, this message translates to:
  /// **'Scroll by chapter'**
  String get readerScrollByChapterTitle;

  /// Subtitle when chapter-scoped vertical scrolling is enabled
  ///
  /// In en, this message translates to:
  /// **'Slide through one chapter page by page, then swipe sideways to change chapters'**
  String get readerScrollByChapterOnHint;

  /// Subtitle when whole-book vertical scrolling is enabled
  ///
  /// In en, this message translates to:
  /// **'All chapters connect page by page in one positionable vertical list'**
  String get readerScrollByChapterOffHint;

  /// Subtitle explaining the horizontal paging mode
  ///
  /// In en, this message translates to:
  /// **'Tap the left side for the previous page, the right side for the next page'**
  String get readerModeHorizontalPageHint;

  /// Subtitle explaining the horizontal slide page mode
  ///
  /// In en, this message translates to:
  /// **'Pages follow your finger horizontally and snap into place'**
  String get readerModeHorizontalSlideHint;

  /// Page mode option where the current page slides away over the next one like a stacked sheet
  ///
  /// In en, this message translates to:
  /// **'Cover'**
  String get readerModeCoverSlide;

  /// Subtitle explaining the cover page turn mode
  ///
  /// In en, this message translates to:
  /// **'The current page slides off to the left, uncovering the next page beneath it'**
  String get readerModeCoverSlideHint;

  /// Page mode option with an interactive simulated paper curl
  ///
  /// In en, this message translates to:
  /// **'Page Curl'**
  String get readerModePageCurl;

  /// Subtitle explaining the simulated page curl mode
  ///
  /// In en, this message translates to:
  /// **'Drag sideways to curl the page, then release to turn or rebound'**
  String get readerModePageCurlHint;

  /// Reader text brightness label
  ///
  /// In en, this message translates to:
  /// **'Text Brightness'**
  String get readerTextBrightnessLabel;

  /// Toggle for dimming reader text in dark mode
  ///
  /// In en, this message translates to:
  /// **'Dim text in dark mode'**
  String get readerDimTextInDarkModeTitle;

  /// Reader dark mode text brightness hint
  ///
  /// In en, this message translates to:
  /// **'Use 70% brightness in dark mode'**
  String get readerDimTextInDarkModeHint;

  /// No description provided for @readerHorizontalMarginLabel.
  ///
  /// In en, this message translates to:
  /// **'Horizontal margin'**
  String get readerHorizontalMarginLabel;

  /// No description provided for @readerTopMarginLabel.
  ///
  /// In en, this message translates to:
  /// **'Top margin'**
  String get readerTopMarginLabel;

  /// No description provided for @readerBottomMarginLabel.
  ///
  /// In en, this message translates to:
  /// **'Bottom margin'**
  String get readerBottomMarginLabel;

  /// No description provided for @readerTxtChapterTitlePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Chapter title on its own page'**
  String get readerTxtChapterTitlePageTitle;

  /// No description provided for @readerTxtChapterTitlePageHint.
  ///
  /// In en, this message translates to:
  /// **'When off, the chapter title appears above the body text'**
  String get readerTxtChapterTitlePageHint;

  /// Fallback title for a chapter without a title, 1-based index
  ///
  /// In en, this message translates to:
  /// **'Chapter {number}'**
  String readerChapterFallback(int number);

  /// Error message when a book fails to load in the native reader
  ///
  /// In en, this message translates to:
  /// **'Failed to open: {error}'**
  String readerOpenFailed(String error);

  /// Shown when a book parses successfully but contains no displayable text
  ///
  /// In en, this message translates to:
  /// **'This book has no readable content'**
  String get readerNoContent;

  /// Bottom status bar in paged modes: current chapter and page position
  ///
  /// In en, this message translates to:
  /// **'Chapter {chapter}/{chapterCount} · Page {page}/{pageCount}'**
  String readerStatusPaged(
    int chapter,
    int chapterCount,
    int page,
    int pageCount,
  );

  /// Title for selecting the reader top information style
  ///
  /// In en, this message translates to:
  /// **'Top information'**
  String get readerTopBarStyleTitle;

  /// No description provided for @readerTopBarStyleSystem.
  ///
  /// In en, this message translates to:
  /// **'System status bar'**
  String get readerTopBarStyleSystem;

  /// No description provided for @readerTopBarStyleSystemHint.
  ///
  /// In en, this message translates to:
  /// **'Show the system time, signal, and battery'**
  String get readerTopBarStyleSystemHint;

  /// No description provided for @readerTopBarStyleReader.
  ///
  /// In en, this message translates to:
  /// **'Reader information bar'**
  String get readerTopBarStyleReader;

  /// No description provided for @readerTopBarStyleReaderHint.
  ///
  /// In en, this message translates to:
  /// **'Show time, chapter title, and battery'**
  String get readerTopBarStyleReaderHint;

  /// No description provided for @readerTopBarStyleFloating.
  ///
  /// In en, this message translates to:
  /// **'Floating info bar'**
  String get readerTopBarStyleFloating;

  /// No description provided for @readerTopBarStyleFloatingHint.
  ///
  /// In en, this message translates to:
  /// **'Show time and battery in the status bar area without taking reading space'**
  String get readerTopBarStyleFloatingHint;

  /// No description provided for @readerTopBarStyleHidden.
  ///
  /// In en, this message translates to:
  /// **'Fully immersive'**
  String get readerTopBarStyleHidden;

  /// No description provided for @readerTopBarStyleHiddenHint.
  ///
  /// In en, this message translates to:
  /// **'Show no information at the top'**
  String get readerTopBarStyleHiddenHint;

  /// Title of the reader-only theme selector
  ///
  /// In en, this message translates to:
  /// **'Reading theme'**
  String get readerThemeTitle;

  /// Explains that reading themes are independent from the app theme
  ///
  /// In en, this message translates to:
  /// **'Only changes the reading page and its controls'**
  String get readerThemeDescription;

  /// Reader settings sheet tab with the theme picker and top bar style
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get readerSettingsTabTheme;

  /// Reader settings sheet tab with font size, line height and alignment
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get readerSettingsTabText;

  /// Reader settings sheet tab with the page margins
  ///
  /// In en, this message translates to:
  /// **'Layout'**
  String get readerSettingsTabLayout;

  /// Reader settings sheet tab with page-turning behavior
  ///
  /// In en, this message translates to:
  /// **'Paging'**
  String get readerSettingsTabPaging;

  /// Collapsed section holding letter spacing, first-line indent and paragraph spacing
  ///
  /// In en, this message translates to:
  /// **'Advanced typography'**
  String get readerSettingsAdvancedTypography;

  /// No description provided for @readerAutoPageTurnTitle.
  ///
  /// In en, this message translates to:
  /// **'Auto page turn'**
  String get readerAutoPageTurnTitle;

  /// No description provided for @readerAutoPageTurnOff.
  ///
  /// In en, this message translates to:
  /// **'Not started'**
  String get readerAutoPageTurnOff;

  /// No description provided for @readerAutoPageTurnShortcutTitle.
  ///
  /// In en, this message translates to:
  /// **'Automatic reading shortcut'**
  String get readerAutoPageTurnShortcutTitle;

  /// No description provided for @readerAutoPageTurnShortcutHint.
  ///
  /// In en, this message translates to:
  /// **'Show with the reading controls for quick start or pause'**
  String get readerAutoPageTurnShortcutHint;

  /// No description provided for @readerAutoPageTurnModeTimed.
  ///
  /// In en, this message translates to:
  /// **'Timed page turn'**
  String get readerAutoPageTurnModeTimed;

  /// No description provided for @readerAutoPageTurnModeSweep.
  ///
  /// In en, this message translates to:
  /// **'Sweep page turn'**
  String get readerAutoPageTurnModeSweep;

  /// No description provided for @readerAutoPageTurnModeContinuous.
  ///
  /// In en, this message translates to:
  /// **'Continuous scroll'**
  String get readerAutoPageTurnModeContinuous;

  /// No description provided for @readerAutoPageTurnModeInterval.
  ///
  /// In en, this message translates to:
  /// **'Interval scroll'**
  String get readerAutoPageTurnModeInterval;

  /// No description provided for @readerAutoPageTurnTimedHint.
  ///
  /// In en, this message translates to:
  /// **'Wait for the selected interval, then turn to the next page.'**
  String get readerAutoPageTurnTimedHint;

  /// No description provided for @readerAutoPageTurnSweepHint.
  ///
  /// In en, this message translates to:
  /// **'A line sweeps downward, gradually revealing the next page above it.'**
  String get readerAutoPageTurnSweepHint;

  /// No description provided for @readerAutoPageTurnContinuousHint.
  ///
  /// In en, this message translates to:
  /// **'Scroll downward continuously at a steady reading speed.'**
  String get readerAutoPageTurnContinuousHint;

  /// No description provided for @readerAutoPageTurnIntervalHint.
  ///
  /// In en, this message translates to:
  /// **'Wait for the selected interval, then scroll down by about one screen.'**
  String get readerAutoPageTurnIntervalHint;

  /// No description provided for @readerAutoPageTurnSweepDurationLabel.
  ///
  /// In en, this message translates to:
  /// **'Sweep duration'**
  String get readerAutoPageTurnSweepDurationLabel;

  /// No description provided for @readerAutoPageTurnScrollSpeedLabel.
  ///
  /// In en, this message translates to:
  /// **'Scroll speed'**
  String get readerAutoPageTurnScrollSpeedLabel;

  /// No description provided for @readerAutoPageTurnSecondsPerScreen.
  ///
  /// In en, this message translates to:
  /// **'{seconds} seconds per screen'**
  String readerAutoPageTurnSecondsPerScreen(int seconds);

  /// No description provided for @readerAutoPageTurnModeValue.
  ///
  /// In en, this message translates to:
  /// **'{mode} · {seconds}s/screen'**
  String readerAutoPageTurnModeValue(String mode, int seconds);

  /// No description provided for @readerAutoPageTurnModePaused.
  ///
  /// In en, this message translates to:
  /// **'Paused · {mode} · {seconds}s/screen'**
  String readerAutoPageTurnModePaused(String mode, int seconds);

  /// No description provided for @readerAutoPageTurnIntervalLabel.
  ///
  /// In en, this message translates to:
  /// **'Page interval'**
  String get readerAutoPageTurnIntervalLabel;

  /// No description provided for @readerAutoPageTurnStart.
  ///
  /// In en, this message translates to:
  /// **'Start auto page turn'**
  String get readerAutoPageTurnStart;

  /// No description provided for @readerAutoPageTurnResume.
  ///
  /// In en, this message translates to:
  /// **'Resume auto page turn'**
  String get readerAutoPageTurnResume;

  /// Day reading theme name
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get readerThemeDay;

  /// Reading theme that switches between day and pure black with system brightness
  ///
  /// In en, this message translates to:
  /// **'Follow system'**
  String get readerThemeFollowSystem;

  /// No description provided for @readerThemeMist.
  ///
  /// In en, this message translates to:
  /// **'Mist'**
  String get readerThemeMist;

  /// No description provided for @readerThemeGreen.
  ///
  /// In en, this message translates to:
  /// **'Eye care'**
  String get readerThemeGreen;

  /// No description provided for @readerThemeRose.
  ///
  /// In en, this message translates to:
  /// **'Rose'**
  String get readerThemeRose;

  /// No description provided for @readerThemeNavy.
  ///
  /// In en, this message translates to:
  /// **'Deep blue'**
  String get readerThemeNavy;

  /// Night reading theme name
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get readerThemeNight;

  /// Pure black reading theme name
  ///
  /// In en, this message translates to:
  /// **'Pure black'**
  String get readerThemePureBlack;

  /// Parchment reading theme name
  ///
  /// In en, this message translates to:
  /// **'Parchment'**
  String get readerThemeParchment;

  /// No description provided for @readerThemeCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get readerThemeCustom;

  /// No description provided for @readerPullBookmarkTitle.
  ///
  /// In en, this message translates to:
  /// **'Pull-down bookmark'**
  String get readerPullBookmarkTitle;

  /// No description provided for @readerPullBookmarkHint.
  ///
  /// In en, this message translates to:
  /// **'Pull down from the top edge and release to add or remove a bookmark for this page'**
  String get readerPullBookmarkHint;

  /// No description provided for @readerPullBookmarkAddHint.
  ///
  /// In en, this message translates to:
  /// **'Pull farther to add bookmark'**
  String get readerPullBookmarkAddHint;

  /// No description provided for @readerPullBookmarkRemoveHint.
  ///
  /// In en, this message translates to:
  /// **'Pull farther to remove bookmark'**
  String get readerPullBookmarkRemoveHint;

  /// No description provided for @readerPullBookmarkReleaseHint.
  ///
  /// In en, this message translates to:
  /// **'Release to finish'**
  String get readerPullBookmarkReleaseHint;

  /// No description provided for @readerTapAnimationTitle.
  ///
  /// In en, this message translates to:
  /// **'Tap animation'**
  String get readerTapAnimationTitle;

  /// No description provided for @readerTapAnimationHint.
  ///
  /// In en, this message translates to:
  /// **'Use the current page-turn animation for side taps; turn off to refresh instantly'**
  String get readerTapAnimationHint;

  /// No description provided for @readerTabletTwoPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Tablet two-page layout'**
  String get readerTabletTwoPageTitle;

  /// No description provided for @readerTabletTwoPageHint.
  ///
  /// In en, this message translates to:
  /// **'Show left and right pages side by side in landscape; turn off to always use a single page'**
  String get readerTabletTwoPageHint;

  /// No description provided for @readerCustomThemeReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get readerCustomThemeReset;

  /// No description provided for @readerCustomThemeColors.
  ///
  /// In en, this message translates to:
  /// **'Theme colors'**
  String get readerCustomThemeColors;

  /// No description provided for @readerCustomThemeTextColor.
  ///
  /// In en, this message translates to:
  /// **'Text color'**
  String get readerCustomThemeTextColor;

  /// No description provided for @readerCustomThemeTextColorHint.
  ///
  /// In en, this message translates to:
  /// **'Body text, headings, and primary icons'**
  String get readerCustomThemeTextColorHint;

  /// No description provided for @readerCustomThemeBackground.
  ///
  /// In en, this message translates to:
  /// **'Reading background'**
  String get readerCustomThemeBackground;

  /// No description provided for @readerCustomThemeBackgroundHint.
  ///
  /// In en, this message translates to:
  /// **'The paper and reading canvas color'**
  String get readerCustomThemeBackgroundHint;

  /// No description provided for @readerCustomThemeControlBar.
  ///
  /// In en, this message translates to:
  /// **'Control bar color'**
  String get readerCustomThemeControlBar;

  /// No description provided for @readerCustomThemeControlBarHint.
  ///
  /// In en, this message translates to:
  /// **'Top and bottom controls and settings surfaces'**
  String get readerCustomThemeControlBarHint;

  /// No description provided for @readerCustomThemeContrastGood.
  ///
  /// In en, this message translates to:
  /// **'Text has clear contrast for comfortable long reading'**
  String get readerCustomThemeContrastGood;

  /// No description provided for @readerCustomThemeContrastLow.
  ///
  /// In en, this message translates to:
  /// **'Text contrast is low and may cause reading fatigue'**
  String get readerCustomThemeContrastLow;

  /// No description provided for @readerCustomThemeSave.
  ///
  /// In en, this message translates to:
  /// **'Save and use'**
  String get readerCustomThemeSave;

  /// No description provided for @readerCustomThemePreview.
  ///
  /// In en, this message translates to:
  /// **'Live preview'**
  String get readerCustomThemePreview;

  /// No description provided for @readerCustomThemePreviewChapter.
  ///
  /// In en, this message translates to:
  /// **'Chapter One · Wind Between the Pages'**
  String get readerCustomThemePreviewChapter;

  /// No description provided for @readerCustomThemePreviewBody.
  ///
  /// In en, this message translates to:
  /// **'This is your reading space. Tune the text, paper, and control colors until every page feels distinctly yours.'**
  String get readerCustomThemePreviewBody;

  /// No description provided for @readerCustomThemeHexInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a 6-digit hex color, such as #F6F0E4'**
  String get readerCustomThemeHexInvalid;

  /// No description provided for @readerCustomThemeHexLabel.
  ///
  /// In en, this message translates to:
  /// **'Hex color'**
  String get readerCustomThemeHexLabel;

  /// No description provided for @readerCustomThemeAdd.
  ///
  /// In en, this message translates to:
  /// **'Add theme'**
  String get readerCustomThemeAdd;

  /// No description provided for @readerCustomThemeReorderHint.
  ///
  /// In en, this message translates to:
  /// **'Hold the handle on the right to reorder themes. The same order appears in reading settings.'**
  String get readerCustomThemeReorderHint;

  /// No description provided for @readerCustomThemeUse.
  ///
  /// In en, this message translates to:
  /// **'Use selected theme'**
  String get readerCustomThemeUse;

  /// No description provided for @readerCustomThemeDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete reading theme?'**
  String get readerCustomThemeDeleteTitle;

  /// No description provided for @readerCustomThemeDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'“{name}” will be removed from your themes, along with its saved background image.'**
  String readerCustomThemeDeleteMessage(String name);

  /// No description provided for @readerCustomThemeNewTitle.
  ///
  /// In en, this message translates to:
  /// **'New reading theme'**
  String get readerCustomThemeNewTitle;

  /// No description provided for @readerCustomThemeEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit reading theme'**
  String get readerCustomThemeEditTitle;

  /// No description provided for @readerCustomThemeName.
  ///
  /// In en, this message translates to:
  /// **'Theme name'**
  String get readerCustomThemeName;

  /// No description provided for @readerCustomThemeNameHint.
  ///
  /// In en, this message translates to:
  /// **'For example, Rainy night or Afternoon paper'**
  String get readerCustomThemeNameHint;

  /// No description provided for @readerCustomThemeBackgroundImage.
  ///
  /// In en, this message translates to:
  /// **'Background image'**
  String get readerCustomThemeBackgroundImage;

  /// No description provided for @readerCustomThemeBackgroundImageHint.
  ///
  /// In en, this message translates to:
  /// **'Supports JPG, PNG, and WebP. The image is copied into app storage.'**
  String get readerCustomThemeBackgroundImageHint;

  /// No description provided for @readerCustomThemeChooseImage.
  ///
  /// In en, this message translates to:
  /// **'Upload image'**
  String get readerCustomThemeChooseImage;

  /// No description provided for @readerCustomThemeReplaceImage.
  ///
  /// In en, this message translates to:
  /// **'Replace image'**
  String get readerCustomThemeReplaceImage;

  /// No description provided for @readerCustomThemeRemoveImage.
  ///
  /// In en, this message translates to:
  /// **'Remove image'**
  String get readerCustomThemeRemoveImage;

  /// No description provided for @readerCustomThemeImageStrength.
  ///
  /// In en, this message translates to:
  /// **'Background image strength'**
  String get readerCustomThemeImageStrength;

  /// No description provided for @readerCustomThemeImageUnsupported.
  ///
  /// In en, this message translates to:
  /// **'Background image import is not supported on this platform'**
  String get readerCustomThemeImageUnsupported;

  /// No description provided for @readerCustomThemeImageTooLarge.
  ///
  /// In en, this message translates to:
  /// **'The image must be no larger than 20 MB'**
  String get readerCustomThemeImageTooLarge;

  /// No description provided for @readerCustomThemeImageFormat.
  ///
  /// In en, this message translates to:
  /// **'Choose a JPG, PNG, or WebP image'**
  String get readerCustomThemeImageFormat;

  /// No description provided for @readerCustomThemeImageFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not import the background image. Try again.'**
  String get readerCustomThemeImageFailed;

  /// Fallback title used when no title can be extracted from a TXT file
  ///
  /// In en, this message translates to:
  /// **'Unknown title'**
  String get importUnknownTitle;

  /// Fallback author used when no author can be extracted from a TXT file
  ///
  /// In en, this message translates to:
  /// **'Unknown author'**
  String get importUnknownAuthor;

  /// Fallback title used when a book has no title
  ///
  /// In en, this message translates to:
  /// **'Untitled'**
  String get bookUntitled;

  /// No description provided for @readerAddAnnotation.
  ///
  /// In en, this message translates to:
  /// **'Add annotation'**
  String get readerAddAnnotation;

  /// No description provided for @readerAnnotationHint.
  ///
  /// In en, this message translates to:
  /// **'Write your thoughts about this passage…'**
  String get readerAnnotationHint;

  /// No description provided for @readerAnnotationSaved.
  ///
  /// In en, this message translates to:
  /// **'Annotation saved'**
  String get readerAnnotationSaved;

  /// No description provided for @readerAnnotationDeleted.
  ///
  /// In en, this message translates to:
  /// **'Annotation deleted'**
  String get readerAnnotationDeleted;

  /// No description provided for @readerNoAnnotations.
  ///
  /// In en, this message translates to:
  /// **'No annotations yet'**
  String get readerNoAnnotations;

  /// No description provided for @readerNoAnnotationsHint.
  ///
  /// In en, this message translates to:
  /// **'Select text to highlight or add a comment. Tap an underlined comment to read it again.'**
  String get readerNoAnnotationsHint;

  /// No description provided for @readerChapterProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Chapter progress'**
  String get readerChapterProgressTitle;

  /// No description provided for @readerChapterProgressHidden.
  ///
  /// In en, this message translates to:
  /// **'Hidden'**
  String get readerChapterProgressHidden;

  /// No description provided for @readerChapterProgressFraction.
  ///
  /// In en, this message translates to:
  /// **'{chapter}/{total} chapters'**
  String readerChapterProgressFraction(int chapter, int total);

  /// No description provided for @readerChapterProgressRemaining.
  ///
  /// In en, this message translates to:
  /// **'{count} chapters ahead'**
  String readerChapterProgressRemaining(int count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'it',
    'ja',
    'pt',
    'ru',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'TW':
            return AppLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
