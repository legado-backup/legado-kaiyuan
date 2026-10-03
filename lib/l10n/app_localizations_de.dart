// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get home => 'Start';

  @override
  String get library => 'Bücherregal';

  @override
  String get settings => 'Einstellungen';

  @override
  String get theme => 'Design';

  @override
  String get accent => 'Akzentfarbe';

  @override
  String get bookmarks => 'Lesezeichen';

  @override
  String get notes => 'Notizen';

  @override
  String get highlights => 'Markierungen';

  @override
  String get ttsReading => 'Text-to-Speech';

  @override
  String get pause => 'Pause';

  @override
  String get stop => 'Stopp';

  @override
  String get language => 'Sprache';

  @override
  String get fontSize => 'Schriftgröße';

  @override
  String get readingProgress => 'Lesefortschritt';

  @override
  String get totalPages => 'Seiten gesamt';

  @override
  String get currentPage => 'Aktuelle Seite';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get delete => 'Löschen';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get save => 'Speichern';

  @override
  String get back => 'Zurück';

  @override
  String get next => 'Weiter';

  @override
  String get previous => 'Vorherige';

  @override
  String get search => 'Suchen';

  @override
  String get loading => 'Wird geladen...';

  @override
  String get error => 'Fehler';

  @override
  String get readingSettings => 'Leseeinstellungen';

  @override
  String get readerFont => 'Leseschriftart';

  @override
  String get readerFontSelectionDescription =>
      'Leseschrift wählen. EPUB bietet die Buchschrift, die Systemschrift und installierte Schriften.';

  @override
  String get readerFontBookPriorityHint =>
      'Verwendet die eingebettete Schrift des Buchs, wenn verfügbar; andernfalls die plattformstandardmäßige Leseschrift.';

  @override
  String get readerFontOverrideHint =>
      'Überschreibt die vom Herausgeber eingebetteten Schriften.';

  @override
  String get fontBookEmbedded => 'Im Buch eingebettet';

  @override
  String get fontSystem => 'Plattform-Standard';

  @override
  String get fontSystemDescription =>
      'Verwendet eine plattformoptimierte Leseschrift für stabile Zeichen und Seitenverteilung.';

  @override
  String get fontSerifDescription =>
      'Serifenschrift mit ruhigem, redaktionellem Charakter für längeres Lesen.';

  @override
  String get fontSansSerifDescription =>
      'Klare serifenlose Schrift für kompakte Oberflächen und alltägliches Lesen.';

  @override
  String get fontMonospaceDescription =>
      'Nichtproportionale Schrift für Code, technisches Material und fokussierte Layouts.';

  @override
  String get fontPreviewText => 'Origo X · Frei lesen 开卷有益';

  @override
  String get customFonts => 'Meine Schriften';

  @override
  String get builtInFonts => 'Integrierte Schriften';

  @override
  String fontVariableWeightRange(int min, int max) {
    return 'Einstellbare Strichstärke $min–$max';
  }

  @override
  String get fontStaticWeight => 'Feste Strichstärke (Fett wird synthetisiert)';

  @override
  String get importFont => 'Schrift importieren';

  @override
  String get importingFont => 'Schrift wird importiert…';

  @override
  String get customFontImportUnsupported =>
      'Dauerhafter Schriftimport wird auf dieser Plattform noch nicht unterstützt.';

  @override
  String get customFontUnsupportedFormat =>
      'Wähle eine TTF- oder OTF-Schriftdatei.';

  @override
  String get customFontInvalid =>
      'Diese Datei ist keine gültige oder unterstützte Schrift.';

  @override
  String get customFontTooLarge => 'Die Schriftdatei ist größer als 50 MB.';

  @override
  String get customFontReadFailed =>
      'Die Schriftdatei konnte nicht gelesen werden.';

  @override
  String get customFontLoadFailed => 'Die Schrift konnte nicht geladen werden.';

  @override
  String get customFontStorageFailed =>
      'Die Schrift konnte nicht auf diesem Gerät gespeichert werden.';

  @override
  String get renameFont => 'Schrift umbenennen';

  @override
  String get fontFamilyLabel => 'Schriftart';

  @override
  String get fontSizeLabel => 'Schriftgröße';

  @override
  String get readerFontWeightLabel => 'Schriftstärke';

  @override
  String get readerFontWeightLight => 'Leicht';

  @override
  String get readerFontWeightRegular => 'Normal';

  @override
  String get readerFontWeightMedium => 'Mittel';

  @override
  String get readerFontWeightSemiBold => 'Halbfett';

  @override
  String get readerFontWeightBold => 'Fett';

  @override
  String readerFontWeightVariableHint(int min, int max) {
    return 'Die Lesesteuerung nutzt fünf gut lesbare Stufen von 300–700. Der tatsächliche volle Bereich dieser Schrift ist $min–$max.';
  }

  @override
  String get readerFontWeightSyntheticHint =>
      'Die Lesesteuerung nutzt fünf Stufen von 300–700. Diese Schrift hat keine deklarierte variable Strichstärkenachse, daher nähert das System das Ergebnis an; es kann je nach Plattform abweichen.';

  @override
  String get readerFontWeightPreview => 'Eine stille Seite trägt weiter · 字里行间';

  @override
  String get lineSpacingLabel => 'Zeilenabstand';

  @override
  String get letterSpacingLabel => 'Zeichenabstand';

  @override
  String get textAlignmentLabel => 'Textausrichtung';

  @override
  String get textAlignmentNatural => 'Natürlich';

  @override
  String get textAlignmentJustified => 'Blocksatz';

  @override
  String get firstLineIndentLabel => 'Erstzeileneinzug';

  @override
  String get paragraphSpacingLabel => 'Absatzabstand';

  @override
  String get pageTurningMode => 'Seitenmodus';

  @override
  String get pageTurningSlide => 'Horizontales Gleiten';

  @override
  String get pageTurningScroll => 'Vertikales Blättern';

  @override
  String get tapZoneSettings => 'Tippzonen';

  @override
  String get tapZoneNextPage => 'Nächste Seite';

  @override
  String get tapZonePreviousPage => 'Vorherige Seite';

  @override
  String get tapZoneMenu => 'Menü';

  @override
  String get tapZoneNextChapter => 'Nächstes Kapitel';

  @override
  String get tapZonePreviousChapter => 'Vorheriges Kapitel';

  @override
  String get tapZoneNone => 'Keine Aktion';

  @override
  String get tapZoneSettingsHint =>
      'Lege fest, was die neun Tippflächen jeweils tun';

  @override
  String get tapZoneChooseAction => 'Aktion wählen';

  @override
  String get tapZoneMenuRequiredHint =>
      'Tippe auf eine Fläche, um ihre Aktion zu ändern. Mindestens eine Fläche muss Menü bleiben; wird jedes Menü entfernt, wird die mittlere Fläche wieder zum Menü.';

  @override
  String get tapZoneReset => 'Standard wiederherstellen';

  @override
  String get highlightColor => 'Markierungsfarbe';

  @override
  String get noteTypeHighlight => 'Markierung';

  @override
  String get noteTypeUnderline => 'Unterstreichung';

  @override
  String get noteTypeNote => 'Notiz';

  @override
  String get author => 'Autor';

  @override
  String get progress => 'Fortschritt';

  @override
  String get deleteBook => 'Buch löschen';

  @override
  String get readerToolbarTOC => 'Inhaltsverzeichnis';

  @override
  String get readerAddBookmark => 'Lesezeichen hinzufügen';

  @override
  String get bookmarkAdded => 'Lesezeichen hinzugefügt';

  @override
  String get bookmarkRemoved => 'Lesezeichen entfernt';

  @override
  String get readerNavigationTitle => 'Navigation beim Lesen';

  @override
  String readerNavigationPosition(int current, int total) {
    return 'Kapitel $current von $total';
  }

  @override
  String get readerSearchChapters => 'Kapitel durchsuchen';

  @override
  String get readerBackToCurrentChapter => 'Zurück zum aktuellen Kapitel';

  @override
  String get readerCurrentChapter => 'Aktuell';

  @override
  String get readerCurrentPosition => 'Aktuelle Position';

  @override
  String get readerNoChapterResults => 'Keine passenden Kapitel';

  @override
  String get readerNoChapterResultsHint =>
      'Versuche ein anderes Wort aus dem Kapiteltitel.';

  @override
  String get readerNoBookmarks => 'Noch keine Lesezeichen';

  @override
  String get readerNoBookmarksHint =>
      'Tippe oben rechts auf die Lesezeichen-Taste, um deine Stelle zu speichern.';

  @override
  String get readerUnsupportedFormat =>
      'Dieses Format kann noch nicht gelesen werden.';

  @override
  String get currentChapter => 'Aktuelles Kapitel';

  @override
  String get readerPrefaceTitle => 'Vorspann';

  @override
  String get readerModeHorizontalPage => 'Keine Animation';

  @override
  String get readerModeVerticalScrollHint =>
      'Blättere vorab erzeugte Seiten vertikal durch; wische seitlich, um Kapitel zu wechseln';

  @override
  String get readerModeWholeBookScrollHint =>
      'Vorab erzeugte Kapitel bilden eine positionierbare durchlaufende vertikale Liste';

  @override
  String get readerScrollByChapterTitle => 'Kapitelweise scrollen';

  @override
  String get readerScrollByChapterOnHint =>
      'Blättere ein Kapitel Seite für Seite durch; wische seitlich, um das Kapitel zu wechseln';

  @override
  String get readerScrollByChapterOffHint =>
      'Alle Kapitel gehen Seite für Seite in eine positionierbare durchlaufende vertikale Liste über';

  @override
  String get readerModeHorizontalPageHint =>
      'Tippe links für die vorherige Seite und rechts für die nächste Seite';

  @override
  String get readerModeHorizontalSlideHint =>
      'Seiten folgen deinem Finger horizontal und rasten ein';

  @override
  String get readerModeCoverSlide => 'Cover';

  @override
  String get readerModeCoverSlideHint =>
      'Die aktuelle Seite gleitet nach links weg und gibt die Seite darunter frei';

  @override
  String get readerModePageCurl => 'Seitenumschlag';

  @override
  String get readerModePageCurlHint =>
      'Ziehe seitlich, um die Seite umzuschlagen, und lass los, um zu blättern oder zurückzuschnellen';

  @override
  String get readerTextBrightnessLabel => 'Text-Helligkeit';

  @override
  String get readerDimTextInDarkModeTitle => 'Text im Dunkelmodus abdunkeln';

  @override
  String get readerDimTextInDarkModeHint =>
      'Im Dunkelmodus 70 % Helligkeit verwenden';

  @override
  String get readerHorizontalMarginLabel => 'Horizontaler Rand';

  @override
  String get readerTopMarginLabel => 'Oberer Rand';

  @override
  String get readerBottomMarginLabel => 'Unterer Rand';

  @override
  String get readerTxtChapterTitlePageTitle => 'Kapiteltitel auf eigener Seite';

  @override
  String get readerTxtChapterTitlePageHint =>
      'Wenn ausgeschaltet, erscheint der Kapiteltitel über dem Fließtext';

  @override
  String readerChapterFallback(int number) {
    return 'Kapitel $number';
  }

  @override
  String readerOpenFailed(String error) {
    return 'Öffnen fehlgeschlagen: $error';
  }

  @override
  String get readerNoContent => 'Dieses Buch hat keinen lesbaren Inhalt';

  @override
  String readerStatusPaged(
    int chapter,
    int chapterCount,
    int page,
    int pageCount,
  ) {
    return 'Kapitel $chapter/$chapterCount · Seite $page/$pageCount';
  }

  @override
  String get readerTopBarStyleTitle => 'Obere Informationen';

  @override
  String get readerTopBarStyleSystem => 'Systemstatusleiste';

  @override
  String get readerTopBarStyleSystemHint =>
      'Systemzeit, Signal und Akku anzeigen';

  @override
  String get readerTopBarStyleReader => 'Info-Leiste des Lesers';

  @override
  String get readerTopBarStyleReaderHint =>
      'Zeit, Kapiteltitel und Akku anzeigen';

  @override
  String get readerTopBarStyleFloating => 'Schwebende Info-Leiste';

  @override
  String get readerTopBarStyleFloatingHint =>
      'Zeit und Akku im Statusleistenbereich anzeigen, ohne Lesefläche zu verbrauchen';

  @override
  String get readerTopBarStyleHidden => 'Vollständig immersiv';

  @override
  String get readerTopBarStyleHiddenHint => 'Oben keine Informationen anzeigen';

  @override
  String get readerThemeTitle => 'Lese-Design';

  @override
  String get readerThemeDescription =>
      'Ändert nur die Leseseite und ihre Steuerung';

  @override
  String get readerSettingsTabTheme => 'Design';

  @override
  String get readerSettingsTabText => 'Text';

  @override
  String get readerSettingsTabLayout => 'Layout';

  @override
  String get readerSettingsTabPaging => 'Blättern';

  @override
  String get readerSettingsAdvancedTypography => 'Erweiterte Typografie';

  @override
  String get readerAutoPageTurnTitle => 'Automatisches Blättern';

  @override
  String get readerAutoPageTurnOff => 'Nicht gestartet';

  @override
  String get readerAutoPageTurnShortcutTitle =>
      'Kurzbefehl für automatisches Lesen';

  @override
  String get readerAutoPageTurnShortcutHint =>
      'Für schnelles Starten oder Pausieren in den Lesesteuerungen zeigen';

  @override
  String get readerAutoPageTurnModeTimed => 'Zeitgesteuertes Blättern';

  @override
  String get readerAutoPageTurnModeSweep => 'Blättern mit Linie';

  @override
  String get readerAutoPageTurnModeContinuous => 'Fortlaufendes Scrollen';

  @override
  String get readerAutoPageTurnModeInterval => 'Intervall-Scrollen';

  @override
  String get readerAutoPageTurnTimedHint =>
      'Wartet das gewählte Intervall ab und blättert dann zur nächsten Seite.';

  @override
  String get readerAutoPageTurnSweepHint =>
      'Eine Linie wandert nach unten und gibt die nächste Seite darüber nach und nach frei.';

  @override
  String get readerAutoPageTurnContinuousHint =>
      'Scrollt gleichmäßig mit konstanter Lesegeschwindigkeit nach unten.';

  @override
  String get readerAutoPageTurnIntervalHint =>
      'Wartet das gewählte Intervall ab und scrollt dann um etwa einen Bildschirm nach unten.';

  @override
  String get readerAutoPageTurnSweepDurationLabel => 'Durchlaufdauer';

  @override
  String get readerAutoPageTurnScrollSpeedLabel => 'Scrollgeschwindigkeit';

  @override
  String readerAutoPageTurnSecondsPerScreen(int seconds) {
    return '$seconds Sekunden pro Bildschirm';
  }

  @override
  String readerAutoPageTurnModeValue(String mode, int seconds) {
    return '$mode · ${seconds}s/Bildschirm';
  }

  @override
  String readerAutoPageTurnModePaused(String mode, int seconds) {
    return 'Pausiert · $mode · ${seconds}s/Bildschirm';
  }

  @override
  String get readerAutoPageTurnIntervalLabel => 'Seitenintervall';

  @override
  String get readerAutoPageTurnStart => 'Automatisches Blättern starten';

  @override
  String get readerAutoPageTurnResume => 'Automatisches Blättern fortsetzen';

  @override
  String get readerThemeDay => 'Tag';

  @override
  String get readerThemeFollowSystem => 'System folgen';

  @override
  String get readerThemeMist => 'Nebel';

  @override
  String get readerThemeGreen => 'Augenschonend';

  @override
  String get readerThemeRose => 'Rose';

  @override
  String get readerThemeNavy => 'Tiefblau';

  @override
  String get readerThemeNight => 'Nacht';

  @override
  String get readerThemePureBlack => 'Reinschwarz';

  @override
  String get readerThemeParchment => 'Pergament';

  @override
  String get readerThemeCustom => 'Eigene';

  @override
  String get readerPullBookmarkTitle => 'Lesezeichen durch Herunterziehen';

  @override
  String get readerPullBookmarkHint =>
      'Ziehe vom oberen Rand nach unten und lass los, um ein Lesezeichen für diese Seite hinzuzufügen oder zu entfernen';

  @override
  String get readerPullBookmarkAddHint =>
      'Weiter ziehen, um das Lesezeichen hinzuzufügen';

  @override
  String get readerPullBookmarkRemoveHint =>
      'Weiter ziehen, um das Lesezeichen zu entfernen';

  @override
  String get readerPullBookmarkReleaseHint => 'Loslassen zum Abschließen';

  @override
  String get readerTapAnimationTitle => 'Tipp-Animation';

  @override
  String get readerTapAnimationHint =>
      'Nutzt die aktuelle Blätter-Animation für seitliche Tips; ausschalten für sofortige Aktualisierung';

  @override
  String get readerTabletTwoPageTitle => 'Zweiseiten-Layout für Tablets';

  @override
  String get readerTabletTwoPageHint =>
      'Zeigt im Querformat linke und rechte Seite nebeneinander; ausschalten, um immer nur eine Seite zu verwenden';

  @override
  String get readerCustomThemeReset => 'Zurücksetzen';

  @override
  String get readerCustomThemeColors => 'Design-Farben';

  @override
  String get readerCustomThemeTextColor => 'Textfarbe';

  @override
  String get readerCustomThemeTextColorHint =>
      'Fließtext, Überschriften und Hauptsymbole';

  @override
  String get readerCustomThemeBackground => 'Lese-Hintergrund';

  @override
  String get readerCustomThemeBackgroundHint =>
      'Die Papier- und Leseflächenfarbe';

  @override
  String get readerCustomThemeControlBar => 'Farbe der Steuerleiste';

  @override
  String get readerCustomThemeControlBarHint =>
      'Obere und untere Steuerungen sowie Einstellungsflächen';

  @override
  String get readerCustomThemeContrastGood =>
      'Der Text hat klaren Kontrast für entspanntes Langlesen';

  @override
  String get readerCustomThemeContrastLow =>
      'Der Textkontrast ist gering und kann Lesermüdigkeit verursachen';

  @override
  String get readerCustomThemeSave => 'Speichern und verwenden';

  @override
  String get readerCustomThemePreview => 'Live-Vorschau';

  @override
  String get readerCustomThemePreviewChapter =>
      'Kapitel eins · Wind zwischen den Seiten';

  @override
  String get readerCustomThemePreviewBody =>
      'Dies ist dein Leseraum. Stimme Text-, Papier- und Steuerfarben ab, bis sich jede Seite klar wie deine anfühlt.';

  @override
  String get readerCustomThemeHexInvalid =>
      'Gib einen sechstelligen Hex-Farbcode ein, z. B. #F6F0E4';

  @override
  String get readerCustomThemeHexLabel => 'Hex-Farbe';

  @override
  String get readerCustomThemeAdd => 'Design hinzufügen';

  @override
  String get readerCustomThemeReorderHint =>
      'Halte den Griff rechts, um Designs zu sortieren. Dieselbe Reihenfolge erscheint in den Leseeinstellungen.';

  @override
  String get readerCustomThemeUse => 'Ausgewähltes Design verwenden';

  @override
  String get readerCustomThemeDeleteTitle => 'Lese-Design löschen?';

  @override
  String readerCustomThemeDeleteMessage(String name) {
    return '„$name“ wird samt gespeichertem Hintergrundbild aus deinen Designs entfernt.';
  }

  @override
  String get readerCustomThemeNewTitle => 'Neues Lese-Design';

  @override
  String get readerCustomThemeEditTitle => 'Lese-Design bearbeiten';

  @override
  String get readerCustomThemeName => 'Designname';

  @override
  String get readerCustomThemeNameHint =>
      'Zum Beispiel Regennacht oder Nachmittagspapier';

  @override
  String get readerCustomThemeBackgroundImage => 'Hintergrundbild';

  @override
  String get readerCustomThemeBackgroundImageHint =>
      'Unterstützt JPG, PNG und WebP. Das Bild wird in den App-Speicher kopiert.';

  @override
  String get readerCustomThemeChooseImage => 'Bild hochladen';

  @override
  String get readerCustomThemeReplaceImage => 'Bild ersetzen';

  @override
  String get readerCustomThemeRemoveImage => 'Bild entfernen';

  @override
  String get readerCustomThemeImageStrength => 'Stärke des Hintergrundbilds';

  @override
  String get readerCustomThemeImageUnsupported =>
      'Der Import von Hintergrundbildern wird auf dieser Plattform nicht unterstützt';

  @override
  String get readerCustomThemeImageTooLarge =>
      'Das Bild darf nicht größer als 20 MB sein';

  @override
  String get readerCustomThemeImageFormat =>
      'Wähle ein JPG-, PNG- oder WebP-Bild';

  @override
  String get readerCustomThemeImageFailed =>
      'Das Hintergrundbild konnte nicht importiert werden. Versuche es erneut.';

  @override
  String get importUnknownTitle => 'Unbekannter Titel';

  @override
  String get importUnknownAuthor => 'Unbekannter Autor';

  @override
  String get bookUntitled => 'Ohne Titel';

  @override
  String get readerAddAnnotation => 'Anmerkung hinzufügen';

  @override
  String get readerAnnotationHint =>
      'Schreibe deine Gedanken zu dieser Stelle…';

  @override
  String get readerAnnotationSaved => 'Anmerkung gespeichert';

  @override
  String get readerAnnotationDeleted => 'Anmerkung gelöscht';

  @override
  String get readerNoAnnotations => 'Noch keine Anmerkungen';

  @override
  String get readerNoAnnotationsHint =>
      'Markiere Text oder füge einen Kommentar hinzu. Tippe eine unterstrichene Anmerkung an, um sie erneut zu lesen.';

  @override
  String get readerChapterProgressTitle => 'Kapitelfortschritt';

  @override
  String get readerChapterProgressHidden => 'Ausgeblendet';

  @override
  String readerChapterProgressFraction(int chapter, int total) {
    return '$chapter/$total Kapitel';
  }

  @override
  String readerChapterProgressRemaining(int count) {
    return 'Noch $count Kapitel';
  }
}
