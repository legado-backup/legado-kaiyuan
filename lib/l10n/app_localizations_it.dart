// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get library => 'Libreria';

  @override
  String get settings => 'Impostazioni';

  @override
  String get theme => 'Tema';

  @override
  String get accent => 'Colore accento';

  @override
  String get bookmarks => 'Segnalibri';

  @override
  String get notes => 'Note';

  @override
  String get highlights => 'Evidenziazioni';

  @override
  String get ttsReading => 'Sintesi vocale';

  @override
  String get pause => 'Pausa';

  @override
  String get stop => 'Ferma';

  @override
  String get language => 'Lingua';

  @override
  String get fontSize => 'Dimensione carattere';

  @override
  String get readingProgress => 'Progressi di lettura';

  @override
  String get totalPages => 'Pagine totali';

  @override
  String get currentPage => 'Pagina attuale';

  @override
  String get cancel => 'Annulla';

  @override
  String get confirm => 'Conferma';

  @override
  String get delete => 'Elimina';

  @override
  String get edit => 'Modifica';

  @override
  String get save => 'Salva';

  @override
  String get back => 'Indietro';

  @override
  String get next => 'Avanti';

  @override
  String get previous => 'Precedente';

  @override
  String get search => 'Cerca';

  @override
  String get loading => 'Caricamento...';

  @override
  String get error => 'Errore';

  @override
  String get readingSettings => 'Impostazioni di lettura';

  @override
  String get readerFont => 'Carattere di lettura';

  @override
  String get readerFontSelectionDescription =>
      'Scegli il carattere di lettura. EPUB offre il carattere del libro, quello di sistema e i caratteri installati.';

  @override
  String get readerFontBookPriorityHint =>
      'Usa il carattere incorporato nel libro quando disponibile; altrimenti usa il carattere di lettura predefinito della piattaforma.';

  @override
  String get readerFontOverrideHint =>
      'Sostituisce i caratteri incorporati dall\'editore.';

  @override
  String get fontBookEmbedded => 'Incorporato nel libro';

  @override
  String get fontSystem => 'Predefinito della piattaforma';

  @override
  String get fontSystemDescription =>
      'Usa un carattere di lettura ottimizzato per la piattaforma, per glifi e paginazione stabili.';

  @override
  String get fontSerifDescription =>
      'Carattere serif dal tono calmo ed editoriale, per la lettura prolungata.';

  @override
  String get fontSansSerifDescription =>
      'Carattere sans serif chiaro, adatto a interfacce compatte e alla lettura quotidiana.';

  @override
  String get fontMonospaceDescription =>
      'Carattere a spaziatura fissa, adatto a codice, materiale tecnico e layout essenziali.';

  @override
  String get fontPreviewText => 'Origo X · Leggi liberamente 开卷有益';

  @override
  String get customFonts => 'I miei caratteri';

  @override
  String get builtInFonts => 'Caratteri incorporati';

  @override
  String fontVariableWeightRange(int min, int max) {
    return 'Spessore regolabile $min–$max';
  }

  @override
  String get fontStaticWeight => 'Spessore fisso (il grassetto è sintetizzato)';

  @override
  String get importFont => 'Importa carattere';

  @override
  String get importingFont => 'Importazione carattere…';

  @override
  String get customFontImportUnsupported =>
      'L\'importazione permanente dei caratteri non è ancora supportata su questa piattaforma.';

  @override
  String get customFontUnsupportedFormat =>
      'Scegli un file di carattere TTF o OTF.';

  @override
  String get customFontInvalid =>
      'Questo file non è un carattere valido o supportato.';

  @override
  String get customFontTooLarge => 'Il file del carattere supera 50 MB.';

  @override
  String get customFontReadFailed =>
      'Impossibile leggere il file del carattere.';

  @override
  String get customFontLoadFailed => 'Impossibile caricare il carattere.';

  @override
  String get customFontStorageFailed =>
      'Impossibile salvare il carattere su questo dispositivo.';

  @override
  String get renameFont => 'Rinomina carattere';

  @override
  String get fontFamilyLabel => 'Carattere';

  @override
  String get fontSizeLabel => 'Dimensione carattere';

  @override
  String get readerFontWeightLabel => 'Spessore carattere';

  @override
  String get readerFontWeightLight => 'Sottile';

  @override
  String get readerFontWeightRegular => 'Normale';

  @override
  String get readerFontWeightMedium => 'Medio';

  @override
  String get readerFontWeightSemiBold => 'Semi-grassetto';

  @override
  String get readerFontWeightBold => 'Grassetto';

  @override
  String readerFontWeightVariableHint(int min, int max) {
    return 'I controlli di lettura usano cinque gradazioni leggibili da 300 a 700. L\'intervallo completo reale di questo carattere è $min–$max.';
  }

  @override
  String get readerFontWeightSyntheticHint =>
      'I controlli di lettura usano cinque gradazioni da 300 a 700. Questo carattere non dichiara un asse di spessore variabile, quindi il sistema approssima il risultato, che può variare tra piattaforme.';

  @override
  String get readerFontWeightPreview =>
      'Una pagina quieta porta più lontano · 字里行间';

  @override
  String get lineSpacingLabel => 'Interlinea';

  @override
  String get letterSpacingLabel => 'Spaziatura lettere';

  @override
  String get textAlignmentLabel => 'Allineamento testo';

  @override
  String get textAlignmentNatural => 'Naturale';

  @override
  String get textAlignmentJustified => 'Giustificato';

  @override
  String get firstLineIndentLabel => 'Rientro prima riga';

  @override
  String get paragraphSpacingLabel => 'Spaziatura paragrafi';

  @override
  String get pageTurningMode => 'Modalità pagina';

  @override
  String get pageTurningSlide => 'Scorrimento orizzontale';

  @override
  String get pageTurningScroll => 'Paginazione verticale';

  @override
  String get tapZoneSettings => 'Zone touch';

  @override
  String get tapZoneNextPage => 'Pagina successiva';

  @override
  String get tapZonePreviousPage => 'Pagina precedente';

  @override
  String get tapZoneMenu => 'Menu';

  @override
  String get tapZoneNextChapter => 'Capitolo successivo';

  @override
  String get tapZonePreviousChapter => 'Capitolo precedente';

  @override
  String get tapZoneNone => 'Nessuna azione';

  @override
  String get tapZoneSettingsHint =>
      'Personalizza l\'azione di ognuna delle nove zone touch';

  @override
  String get tapZoneChooseAction => 'Scegli un\'azione';

  @override
  String get tapZoneMenuRequiredHint =>
      'Tocca un\'area per cambiarne l\'azione. Almeno un\'area deve restare Menu; se rimuovi tutti i Menu, l\'area centrale tornerà a essere Menu.';

  @override
  String get tapZoneReset => 'Ripristina predefiniti';

  @override
  String get highlightColor => 'Colore evidenziazione';

  @override
  String get noteTypeHighlight => 'Evidenziazione';

  @override
  String get noteTypeUnderline => 'Sottolineatura';

  @override
  String get noteTypeNote => 'Nota';

  @override
  String get author => 'Autore';

  @override
  String get progress => 'Avanzamento';

  @override
  String get deleteBook => 'Elimina libro';

  @override
  String get readerToolbarTOC => 'Indice';

  @override
  String get readerAddBookmark => 'Aggiungi segnalibro';

  @override
  String get bookmarkAdded => 'Segnalibro aggiunto';

  @override
  String get bookmarkRemoved => 'Segnalibro rimosso';

  @override
  String get readerNavigationTitle => 'Navigazione di lettura';

  @override
  String readerNavigationPosition(int current, int total) {
    return 'Capitolo $current di $total';
  }

  @override
  String get readerSearchChapters => 'Cerca capitoli';

  @override
  String get readerBackToCurrentChapter => 'Torna al capitolo attuale';

  @override
  String get readerCurrentChapter => 'Attuale';

  @override
  String get readerCurrentPosition => 'Posizione attuale';

  @override
  String get readerNoChapterResults => 'Nessun capitolo corrispondente';

  @override
  String get readerNoChapterResultsHint =>
      'Prova un\'altra parola del titolo del capitolo.';

  @override
  String get readerNoBookmarks => 'Ancora nessun segnalibro';

  @override
  String get readerNoBookmarksHint =>
      'Tocca il pulsante segnalibro in alto a destra per salvare il tuo punto.';

  @override
  String get readerUnsupportedFormat =>
      'Questo formato non può ancora essere letto.';

  @override
  String get currentChapter => 'Capitolo attuale';

  @override
  String get readerPrefaceTitle => 'Frontespizio';

  @override
  String get readerModeHorizontalPage => 'Nessuna animazione';

  @override
  String get readerModeVerticalScrollHint =>
      'Scorri verticalmente le pagine pre-impaginate; scorri di lato per cambiare capitolo';

  @override
  String get readerModeWholeBookScrollHint =>
      'I capitoli pre-impaginati formano un\'unica lista verticale posizionabile';

  @override
  String get readerScrollByChapterTitle => 'Scorrimento per capitolo';

  @override
  String get readerScrollByChapterOnHint =>
      'Scorri un capitolo pagina per pagina, poi scorri di lato per cambiare capitolo';

  @override
  String get readerScrollByChapterOffHint =>
      'Tutti i capitoli si collegano pagina per pagina in un\'unica lista verticale posizionabile';

  @override
  String get readerModeHorizontalPageHint =>
      'Tocca il lato sinistro per la pagina precedente, il destro per la successiva';

  @override
  String get readerModeHorizontalSlideHint =>
      'Le pagine seguono il dito in orizzontale e si bloccano al loro posto';

  @override
  String get readerModeCoverSlide => 'Copertina';

  @override
  String get readerModeCoverSlideHint =>
      'La pagina attuale scorre verso sinistra, scoprendo la pagina successiva sotto di essa';

  @override
  String get readerModePageCurl => 'Curva pagina';

  @override
  String get readerModePageCurlHint =>
      'Trascina di lato per curvare la pagina, poi rilascia per girarla o farla tornare';

  @override
  String get readerTextBrightnessLabel => 'Luminosità testo';

  @override
  String get readerDimTextInDarkModeTitle =>
      'Abbassa il testo in modalità scura';

  @override
  String get readerDimTextInDarkModeHint =>
      'Usa il 70% di luminosità in modalità scura';

  @override
  String get readerHorizontalMarginLabel => 'Margine orizzontale';

  @override
  String get readerTopMarginLabel => 'Margine superiore';

  @override
  String get readerBottomMarginLabel => 'Margine inferiore';

  @override
  String get readerTxtChapterTitlePageTitle =>
      'Titolo del capitolo in una pagina a parte';

  @override
  String get readerTxtChapterTitlePageHint =>
      'Se disattivato, il titolo del capitolo appare sopra il testo';

  @override
  String readerChapterFallback(int number) {
    return 'Capitolo $number';
  }

  @override
  String readerOpenFailed(String error) {
    return 'Apertura non riuscita: $error';
  }

  @override
  String get readerNoContent => 'Questo libro non ha contenuti leggibili';

  @override
  String readerStatusPaged(
    int chapter,
    int chapterCount,
    int page,
    int pageCount,
  ) {
    return 'Capitolo $chapter/$chapterCount · Pagina $page/$pageCount';
  }

  @override
  String get readerTopBarStyleTitle => 'Informazioni in alto';

  @override
  String get readerTopBarStyleSystem => 'Barra di stato di sistema';

  @override
  String get readerTopBarStyleSystemHint =>
      'Mostra ora, segnale e batteria di sistema';

  @override
  String get readerTopBarStyleReader => 'Barra informativa del lettore';

  @override
  String get readerTopBarStyleReaderHint =>
      'Mostra ora, titolo del capitolo e batteria';

  @override
  String get readerTopBarStyleFloating => 'Barra info flottante';

  @override
  String get readerTopBarStyleFloatingHint =>
      'Mostra ora e batteria nell\'area della barra di stato senza occupare spazio di lettura';

  @override
  String get readerTopBarStyleHidden => 'Completamente immersivo';

  @override
  String get readerTopBarStyleHiddenHint => 'Non mostra informazioni in alto';

  @override
  String get readerThemeTitle => 'Tema di lettura';

  @override
  String get readerThemeDescription =>
      'Modifica solo la pagina di lettura e i suoi controlli';

  @override
  String get readerSettingsTabTheme => 'Tema';

  @override
  String get readerSettingsTabText => 'Testo';

  @override
  String get readerSettingsTabLayout => 'Layout';

  @override
  String get readerSettingsTabPaging => 'Paginazione';

  @override
  String get readerSettingsAdvancedTypography => 'Tipografia avanzata';

  @override
  String get readerAutoPageTurnTitle => 'Sfogliamento automatico';

  @override
  String get readerAutoPageTurnOff => 'Non avviato';

  @override
  String get readerAutoPageTurnShortcutTitle =>
      'Scorciatoia di lettura automatica';

  @override
  String get readerAutoPageTurnShortcutHint =>
      'Mostra con i controlli di lettura per avviare o mettere in pausa rapidamente';

  @override
  String get readerAutoPageTurnModeTimed => 'Sfoglio a tempo';

  @override
  String get readerAutoPageTurnModeSweep => 'Sfoglio a scansione';

  @override
  String get readerAutoPageTurnModeContinuous => 'Scorrimento continuo';

  @override
  String get readerAutoPageTurnModeInterval => 'Scorrimento a intervalli';

  @override
  String get readerAutoPageTurnTimedHint =>
      'Attende l\'intervallo scelto, poi passa alla pagina successiva.';

  @override
  String get readerAutoPageTurnSweepHint =>
      'Una riga scende verso il basso, rivelando gradualmente la pagina successiva sopra di essa.';

  @override
  String get readerAutoPageTurnContinuousHint =>
      'Scorre continuamente verso il basso a una velocità di lettura costante.';

  @override
  String get readerAutoPageTurnIntervalHint =>
      'Attende l\'intervallo scelto, poi scorre in giù di circa uno schermo.';

  @override
  String get readerAutoPageTurnSweepDurationLabel => 'Durata della scansione';

  @override
  String get readerAutoPageTurnScrollSpeedLabel => 'Velocità di scorrimento';

  @override
  String readerAutoPageTurnSecondsPerScreen(int seconds) {
    return '$seconds secondi per schermo';
  }

  @override
  String readerAutoPageTurnModeValue(String mode, int seconds) {
    return '$mode · ${seconds}s/schermo';
  }

  @override
  String readerAutoPageTurnModePaused(String mode, int seconds) {
    return 'In pausa · $mode · ${seconds}s/schermo';
  }

  @override
  String get readerAutoPageTurnIntervalLabel => 'Intervallo pagine';

  @override
  String get readerAutoPageTurnStart => 'Avvia sfogliamento automatico';

  @override
  String get readerAutoPageTurnResume => 'Riprendi sfogliamento automatico';

  @override
  String get readerThemeDay => 'Giorno';

  @override
  String get readerThemeFollowSystem => 'Segui il sistema';

  @override
  String get readerThemeMist => 'Nebbia';

  @override
  String get readerThemeGreen => 'Riposo oculare';

  @override
  String get readerThemeRose => 'Rosa';

  @override
  String get readerThemeNavy => 'Blu profondo';

  @override
  String get readerThemeNight => 'Notte';

  @override
  String get readerThemePureBlack => 'Nero puro';

  @override
  String get readerThemeParchment => 'Pergamena';

  @override
  String get readerThemeCustom => 'Personalizzato';

  @override
  String get readerPullBookmarkTitle => 'Segnalibro a tendina';

  @override
  String get readerPullBookmarkHint =>
      'Trascina verso il basso dal bordo superiore e rilascia per aggiungere o rimuovere un segnalibro per questa pagina';

  @override
  String get readerPullBookmarkAddHint =>
      'Trascina più giù per aggiungere il segnalibro';

  @override
  String get readerPullBookmarkRemoveHint =>
      'Trascina più giù per rimuovere il segnalibro';

  @override
  String get readerPullBookmarkReleaseHint => 'Rilascia per completare';

  @override
  String get readerTapAnimationTitle => 'Animazione al tocco';

  @override
  String get readerTapAnimationHint =>
      'Usa l\'animazione di sfogliamento attuale per i tocchi laterali; disattiva per aggiornare all\'istante';

  @override
  String get readerTabletTwoPageTitle => 'Layout a due pagine su tablet';

  @override
  String get readerTabletTwoPageHint =>
      'Mostra le pagine sinistra e destra affiancate in orizzontale; disattiva per usare sempre una pagina singola';

  @override
  String get readerCustomThemeReset => 'Ripristina';

  @override
  String get readerCustomThemeColors => 'Colori del tema';

  @override
  String get readerCustomThemeTextColor => 'Colore del testo';

  @override
  String get readerCustomThemeTextColorHint =>
      'Testo principale, titoli e icone principali';

  @override
  String get readerCustomThemeBackground => 'Sfondo di lettura';

  @override
  String get readerCustomThemeBackgroundHint =>
      'Il colore della carta e dell\'area di lettura';

  @override
  String get readerCustomThemeControlBar => 'Colore della barra di controllo';

  @override
  String get readerCustomThemeControlBarHint =>
      'Controlli superiore e inferiore e superfici delle impostazioni';

  @override
  String get readerCustomThemeContrastGood =>
      'Il testo ha un contrasto chiaro per una lettura prolungata confortevole';

  @override
  String get readerCustomThemeContrastLow =>
      'Il contrasto del testo è basso e può affaticare la lettura';

  @override
  String get readerCustomThemeSave => 'Salva e usa';

  @override
  String get readerCustomThemePreview => 'Anteprima dal vivo';

  @override
  String get readerCustomThemePreviewChapter =>
      'Capitolo uno · Vento tra le pagine';

  @override
  String get readerCustomThemePreviewBody =>
      'Questo è il tuo spazio di lettura. Regola i colori di testo, carta e controlli finché ogni pagina non sembra decisamente tua.';

  @override
  String get readerCustomThemeHexInvalid =>
      'Inserisci un colore esadecimale a 6 cifre, ad esempio #F6F0E4';

  @override
  String get readerCustomThemeHexLabel => 'Colore esadecimale';

  @override
  String get readerCustomThemeAdd => 'Aggiungi tema';

  @override
  String get readerCustomThemeReorderHint =>
      'Tieni premuta la maniglia a destra per riordinare i temi. Lo stesso ordine appare nelle impostazioni di lettura.';

  @override
  String get readerCustomThemeUse => 'Usa il tema selezionato';

  @override
  String get readerCustomThemeDeleteTitle => 'Eliminare il tema di lettura?';

  @override
  String readerCustomThemeDeleteMessage(String name) {
    return '“$name” verrà rimosso dai tuoi temi, insieme alla sua immagine di sfondo salvata.';
  }

  @override
  String get readerCustomThemeNewTitle => 'Nuovo tema di lettura';

  @override
  String get readerCustomThemeEditTitle => 'Modifica tema di lettura';

  @override
  String get readerCustomThemeName => 'Nome del tema';

  @override
  String get readerCustomThemeNameHint =>
      'Ad esempio, Notte di pioggia o Carta del pomeriggio';

  @override
  String get readerCustomThemeBackgroundImage => 'Immagine di sfondo';

  @override
  String get readerCustomThemeBackgroundImageHint =>
      'Supporta JPG, PNG e WebP. L\'immagine viene copiata nell\'archivio dell\'app.';

  @override
  String get readerCustomThemeChooseImage => 'Carica immagine';

  @override
  String get readerCustomThemeReplaceImage => 'Sostituisci immagine';

  @override
  String get readerCustomThemeRemoveImage => 'Rimuovi immagine';

  @override
  String get readerCustomThemeImageStrength =>
      'Intensità dell\'immagine di sfondo';

  @override
  String get readerCustomThemeImageUnsupported =>
      'L\'importazione di immagini di sfondo non è supportata su questa piattaforma';

  @override
  String get readerCustomThemeImageTooLarge =>
      'L\'immagine non deve superare 20 MB';

  @override
  String get readerCustomThemeImageFormat =>
      'Scegli un\'immagine JPG, PNG o WebP';

  @override
  String get readerCustomThemeImageFailed =>
      'Impossibile importare l\'immagine di sfondo. Riprova.';

  @override
  String get importUnknownTitle => 'Titolo sconosciuto';

  @override
  String get importUnknownAuthor => 'Autore sconosciuto';

  @override
  String get bookUntitled => 'Senza titolo';

  @override
  String get readerAddAnnotation => 'Aggiungi annotazione';

  @override
  String get readerAnnotationHint => 'Scrivi cosa pensi di questo passaggio…';

  @override
  String get readerAnnotationSaved => 'Annotazione salvata';

  @override
  String get readerAnnotationDeleted => 'Annotazione eliminata';

  @override
  String get readerNoAnnotations => 'Ancora nessuna annotazione';

  @override
  String get readerNoAnnotationsHint =>
      'Seleziona del testo per evidenziarlo o aggiungere un commento. Tocca un commento sottolineato per rileggerlo.';

  @override
  String get readerChapterProgressTitle => 'Avanzamento capitolo';

  @override
  String get readerChapterProgressHidden => 'Nascosto';

  @override
  String readerChapterProgressFraction(int chapter, int total) {
    return '$chapter/$total capitoli';
  }

  @override
  String readerChapterProgressRemaining(int count) {
    return '$count capitoli rimanenti';
  }
}
