// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get home => 'Accueil';

  @override
  String get library => 'Bibliothèque';

  @override
  String get settings => 'Paramètres';

  @override
  String get theme => 'Thème';

  @override
  String get accent => 'Couleur d\'accentuation';

  @override
  String get bookmarks => 'Marque-pages';

  @override
  String get notes => 'Notes';

  @override
  String get highlights => 'Surlignages';

  @override
  String get ttsReading => 'Synthèse vocale';

  @override
  String get pause => 'Pause';

  @override
  String get stop => 'Arrêter';

  @override
  String get language => 'Langue';

  @override
  String get fontSize => 'Taille de police';

  @override
  String get readingProgress => 'Progression de lecture';

  @override
  String get totalPages => 'Pages au total';

  @override
  String get currentPage => 'Page actuelle';

  @override
  String get cancel => 'Annuler';

  @override
  String get confirm => 'Confirmer';

  @override
  String get delete => 'Supprimer';

  @override
  String get edit => 'Modifier';

  @override
  String get save => 'Enregistrer';

  @override
  String get back => 'Retour';

  @override
  String get next => 'Suivant';

  @override
  String get previous => 'Précédent';

  @override
  String get search => 'Rechercher';

  @override
  String get loading => 'Chargement...';

  @override
  String get error => 'Erreur';

  @override
  String get readingSettings => 'Paramètres de lecture';

  @override
  String get readerFont => 'Police de lecture';

  @override
  String get readerFontSelectionDescription =>
      'Choisissez la police de lecture. EPUB propose la police du livre, celle du système et vos polices installées.';

  @override
  String get readerFontBookPriorityHint =>
      'Utilise la police intégrée au livre si disponible ; sinon utilise la police de lecture par défaut de la plateforme.';

  @override
  String get readerFontOverrideHint =>
      'Remplace les polices intégrées par l\'éditeur.';

  @override
  String get fontBookEmbedded => 'Intégrée au livre';

  @override
  String get fontSystem => 'Par défaut de la plateforme';

  @override
  String get fontSystemDescription =>
      'Utilise une police de lecture optimisée pour la plateforme, pour des glyphes et une pagination stables.';

  @override
  String get fontSerifDescription =>
      'Une police avec empattements au caractère calme et éditorial, idéale pour la lecture prolongée.';

  @override
  String get fontSansSerifDescription =>
      'Une police sans empattements et claire, adaptée aux interfaces compactes et à la lecture quotidienne.';

  @override
  String get fontMonospaceDescription =>
      'Une police à chasse fixe, adaptée au code, au contenu technique et aux mises en page épurées.';

  @override
  String get fontPreviewText => 'Origo X · Lisez librement 开卷有益';

  @override
  String get customFonts => 'Mes polices';

  @override
  String get builtInFonts => 'Polices intégrées';

  @override
  String fontVariableWeightRange(int min, int max) {
    return 'Graisse réglable $min–$max';
  }

  @override
  String get fontStaticWeight => 'Graisse fixe (le gras est synthétisé)';

  @override
  String get importFont => 'Importer une police';

  @override
  String get importingFont => 'Importation de la police…';

  @override
  String get customFontImportUnsupported =>
      'L\'importation persistante de polices n\'est pas encore prise en charge sur cette plateforme.';

  @override
  String get customFontUnsupportedFormat =>
      'Choisissez un fichier de police TTF ou OTF.';

  @override
  String get customFontInvalid =>
      'Ce fichier n\'est pas une police valide ou prise en charge.';

  @override
  String get customFontTooLarge => 'Le fichier de police dépasse 50 Mo.';

  @override
  String get customFontReadFailed =>
      'Le fichier de police n\'a pas pu être lu.';

  @override
  String get customFontLoadFailed => 'La police n\'a pas pu être chargée.';

  @override
  String get customFontStorageFailed =>
      'La police n\'a pas pu être enregistrée sur cet appareil.';

  @override
  String get renameFont => 'Renommer la police';

  @override
  String get fontFamilyLabel => 'Police';

  @override
  String get fontSizeLabel => 'Taille de police';

  @override
  String get readerFontWeightLabel => 'Graisse de police';

  @override
  String get readerFontWeightLight => 'Légère';

  @override
  String get readerFontWeightRegular => 'Normale';

  @override
  String get readerFontWeightMedium => 'Moyenne';

  @override
  String get readerFontWeightSemiBold => 'Demi-grasse';

  @override
  String get readerFontWeightBold => 'Grasse';

  @override
  String readerFontWeightVariableHint(int min, int max) {
    return 'Les réglages de lecture utilisent cinq paliers lisibles de 300 à 700. La vraie plage complète de cette police est $min–$max.';
  }

  @override
  String get readerFontWeightSyntheticHint =>
      'Les réglages de lecture utilisent cinq paliers de 300 à 700. Cette police ne déclare pas d\'axe de graisse variable ; le système approxime le résultat, qui peut différer selon la plateforme.';

  @override
  String get readerFontWeightPreview =>
      'Une page paisible se lit plus loin · 字里行间';

  @override
  String get lineSpacingLabel => 'Interligne';

  @override
  String get letterSpacingLabel => 'Espacement des caractères';

  @override
  String get textAlignmentLabel => 'Alignement du texte';

  @override
  String get textAlignmentNatural => 'Naturel';

  @override
  String get textAlignmentJustified => 'Justifié';

  @override
  String get firstLineIndentLabel => 'Retrait de première ligne';

  @override
  String get paragraphSpacingLabel => 'Espacement des paragraphes';

  @override
  String get pageTurningMode => 'Mode de pagination';

  @override
  String get pageTurningSlide => 'Glissement horizontal';

  @override
  String get pageTurningScroll => 'Pagination verticale';

  @override
  String get tapZoneSettings => 'Zones tactiles';

  @override
  String get tapZoneNextPage => 'Page suivante';

  @override
  String get tapZonePreviousPage => 'Page précédente';

  @override
  String get tapZoneMenu => 'Menu';

  @override
  String get tapZoneNextChapter => 'Chapitre suivant';

  @override
  String get tapZonePreviousChapter => 'Chapitre précédent';

  @override
  String get tapZoneNone => 'Aucune action';

  @override
  String get tapZoneSettingsHint =>
      'Personnalisez l\'action de chacune des neuf zones tactiles';

  @override
  String get tapZoneChooseAction => 'Choisir une action';

  @override
  String get tapZoneMenuRequiredHint =>
      'Touchez une zone pour changer son action. Au moins une zone doit rester sur Menu ; si tous les menus sont retirés, la zone centrale redevient Menu.';

  @override
  String get tapZoneReset => 'Rétablir les valeurs par défaut';

  @override
  String get highlightColor => 'Couleur de surlignage';

  @override
  String get noteTypeHighlight => 'Surlignage';

  @override
  String get noteTypeUnderline => 'Soulignement';

  @override
  String get noteTypeNote => 'Note';

  @override
  String get author => 'Auteur';

  @override
  String get progress => 'Progression';

  @override
  String get deleteBook => 'Supprimer le livre';

  @override
  String get readerToolbarTOC => 'Table des matières';

  @override
  String get readerAddBookmark => 'Ajouter un marque-page';

  @override
  String get bookmarkAdded => 'Marque-page ajouté';

  @override
  String get bookmarkRemoved => 'Marque-page supprimé';

  @override
  String get readerNavigationTitle => 'Navigation de lecture';

  @override
  String readerNavigationPosition(int current, int total) {
    return 'Chapitre $current sur $total';
  }

  @override
  String get readerSearchChapters => 'Rechercher des chapitres';

  @override
  String get readerBackToCurrentChapter => 'Retour au chapitre actuel';

  @override
  String get readerCurrentChapter => 'Actuel';

  @override
  String get readerCurrentPosition => 'Position actuelle';

  @override
  String get readerNoChapterResults => 'Aucun chapitre correspondant';

  @override
  String get readerNoChapterResultsHint =>
      'Essayez un autre mot du titre du chapitre.';

  @override
  String get readerNoBookmarks => 'Aucun marque-page pour le moment';

  @override
  String get readerNoBookmarksHint =>
      'Touchez le bouton marque-page en haut à droite pour conserver votre position.';

  @override
  String get readerUnsupportedFormat => 'Ce format ne peut pas encore être lu.';

  @override
  String get currentChapter => 'Chapitre actuel';

  @override
  String get readerPrefaceTitle => 'Préambule';

  @override
  String get readerModeHorizontalPage => 'Sans animation';

  @override
  String get readerModeVerticalScrollHint =>
      'Faites défiler verticalement des pages prépaginées ; balayez latéralement pour changer de chapitre';

  @override
  String get readerModeWholeBookScrollHint =>
      'Les chapitres prépaginés forment une liste verticale positionnable';

  @override
  String get readerScrollByChapterTitle => 'Défilement par chapitre';

  @override
  String get readerScrollByChapterOnHint =>
      'Parcourez un chapitre page par page, puis balayez latéralement pour changer de chapitre';

  @override
  String get readerScrollByChapterOffHint =>
      'Tous les chapitres s\'enchaînent page par page dans une liste verticale positionnable';

  @override
  String get readerModeHorizontalPageHint =>
      'Touchez le côté gauche pour la page précédente, le côté droit pour la page suivante';

  @override
  String get readerModeHorizontalSlideHint =>
      'Les pages suivent votre doigt horizontalement puis se mettent en place';

  @override
  String get readerModeCoverSlide => 'Couverture';

  @override
  String get readerModeCoverSlideHint =>
      'La page actuelle glisse vers la gauche, découvrant la page suivante en dessous';

  @override
  String get readerModePageCurl => 'Curl de page';

  @override
  String get readerModePageCurlHint =>
      'Faites glisser latéralement pour courber la page, puis relâchez pour tourner ou revenir';

  @override
  String get readerTextBrightnessLabel => 'Luminosité du texte';

  @override
  String get readerDimTextInDarkModeTitle => 'Atténuer le texte en mode sombre';

  @override
  String get readerDimTextInDarkModeHint =>
      'Utiliser 70% de luminosité en mode sombre';

  @override
  String get readerHorizontalMarginLabel => 'Marge horizontale';

  @override
  String get readerTopMarginLabel => 'Marge supérieure';

  @override
  String get readerBottomMarginLabel => 'Marge inférieure';

  @override
  String get readerTxtChapterTitlePageTitle =>
      'Titre de chapitre sur sa propre page';

  @override
  String get readerTxtChapterTitlePageHint =>
      'Désactivé, le titre du chapitre apparaît au-dessus du corps du texte';

  @override
  String readerChapterFallback(int number) {
    return 'Chapitre $number';
  }

  @override
  String readerOpenFailed(String error) {
    return 'Échec de l\'ouverture : $error';
  }

  @override
  String get readerNoContent => 'Ce livre n\'a aucun contenu lisible';

  @override
  String readerStatusPaged(
    int chapter,
    int chapterCount,
    int page,
    int pageCount,
  ) {
    return 'Chapitre $chapter/$chapterCount · Page $page/$pageCount';
  }

  @override
  String get readerTopBarStyleTitle => 'Informations en haut';

  @override
  String get readerTopBarStyleSystem => 'Barre d\'état système';

  @override
  String get readerTopBarStyleSystemHint =>
      'Afficher l\'heure, le signal et la batterie du système';

  @override
  String get readerTopBarStyleReader => 'Barre d\'informations du lecteur';

  @override
  String get readerTopBarStyleReaderHint =>
      'Afficher l\'heure, le titre du chapitre et la batterie';

  @override
  String get readerTopBarStyleFloating => 'Barre d\'infos flottante';

  @override
  String get readerTopBarStyleFloatingHint =>
      'Afficher l\'heure et la batterie dans la zone de la barre d\'état sans prendre d\'espace de lecture';

  @override
  String get readerTopBarStyleHidden => 'Pleinement immersif';

  @override
  String get readerTopBarStyleHiddenHint => 'Ne rien afficher en haut';

  @override
  String get readerThemeTitle => 'Thème de lecture';

  @override
  String get readerThemeDescription =>
      'Ne modifie que la page de lecture et ses commandes';

  @override
  String get readerSettingsTabTheme => 'Thème';

  @override
  String get readerSettingsTabText => 'Texte';

  @override
  String get readerSettingsTabLayout => 'Disposition';

  @override
  String get readerSettingsTabPaging => 'Pagination';

  @override
  String get readerSettingsAdvancedTypography => 'Typographie avancée';

  @override
  String get readerAutoPageTurnTitle => 'Tourne-page automatique';

  @override
  String get readerAutoPageTurnOff => 'Non démarré';

  @override
  String get readerAutoPageTurnShortcutTitle =>
      'Raccourci de lecture automatique';

  @override
  String get readerAutoPageTurnShortcutHint =>
      'Afficher avec les commandes de lecture pour démarrer ou mettre en pause rapidement';

  @override
  String get readerAutoPageTurnModeTimed => 'Tourne-page minuté';

  @override
  String get readerAutoPageTurnModeSweep => 'Tourne-page par balayage';

  @override
  String get readerAutoPageTurnModeContinuous => 'Défilement continu';

  @override
  String get readerAutoPageTurnModeInterval => 'Défilement par intervalle';

  @override
  String get readerAutoPageTurnTimedHint =>
      'Attend l\'intervalle choisi, puis passe à la page suivante.';

  @override
  String get readerAutoPageTurnSweepHint =>
      'Une ligne balaie vers le bas, révélant progressivement la page suivante au-dessus d\'elle.';

  @override
  String get readerAutoPageTurnContinuousHint =>
      'Défile vers le bas en continu à une vitesse de lecture régulière.';

  @override
  String get readerAutoPageTurnIntervalHint =>
      'Attend l\'intervalle choisi, puis fait défiler vers le bas d\'environ un écran.';

  @override
  String get readerAutoPageTurnSweepDurationLabel => 'Durée du balayage';

  @override
  String get readerAutoPageTurnScrollSpeedLabel => 'Vitesse de défilement';

  @override
  String readerAutoPageTurnSecondsPerScreen(int seconds) {
    return '$seconds secondes par écran';
  }

  @override
  String readerAutoPageTurnModeValue(String mode, int seconds) {
    return '$mode · ${seconds}s/écran';
  }

  @override
  String readerAutoPageTurnModePaused(String mode, int seconds) {
    return 'En pause · $mode · ${seconds}s/écran';
  }

  @override
  String get readerAutoPageTurnIntervalLabel => 'Intervalle de page';

  @override
  String get readerAutoPageTurnStart => 'Démarrer le tourne-page automatique';

  @override
  String get readerAutoPageTurnResume => 'Reprendre le tourne-page automatique';

  @override
  String get readerThemeDay => 'Jour';

  @override
  String get readerThemeFollowSystem => 'Suivre le système';

  @override
  String get readerThemeMist => 'Brume';

  @override
  String get readerThemeGreen => 'Confort des yeux';

  @override
  String get readerThemeRose => 'Rose';

  @override
  String get readerThemeNavy => 'Bleu profond';

  @override
  String get readerThemeNight => 'Nuit';

  @override
  String get readerThemePureBlack => 'Noir pur';

  @override
  String get readerThemeParchment => 'Parchemin';

  @override
  String get readerThemeCustom => 'Personnalisé';

  @override
  String get readerPullBookmarkTitle => 'Marque-page déroulant';

  @override
  String get readerPullBookmarkHint =>
      'Tirez depuis le bord supérieur et relâchez pour ajouter ou retirer un marque-page sur cette page';

  @override
  String get readerPullBookmarkAddHint =>
      'Tirez plus loin pour ajouter le marque-page';

  @override
  String get readerPullBookmarkRemoveHint =>
      'Tirez plus loin pour retirer le marque-page';

  @override
  String get readerPullBookmarkReleaseHint => 'Relâchez pour terminer';

  @override
  String get readerTapAnimationTitle => 'Animation tactile';

  @override
  String get readerTapAnimationHint =>
      'Utiliser l\'animation de changement de page actuelle pour les touches latérales ; désactiver pour un rafraîchissement instantané';

  @override
  String get readerTabletTwoPageTitle => 'Disposition deux pages sur tablette';

  @override
  String get readerTabletTwoPageHint =>
      'Afficher les pages gauche et droite côte à côte en paysage ; désactiver pour toujours utiliser une seule page';

  @override
  String get readerCustomThemeReset => 'Réinitialiser';

  @override
  String get readerCustomThemeColors => 'Couleurs du thème';

  @override
  String get readerCustomThemeTextColor => 'Couleur du texte';

  @override
  String get readerCustomThemeTextColorHint =>
      'Corps du texte, titres et icônes principales';

  @override
  String get readerCustomThemeBackground => 'Arrière-plan de lecture';

  @override
  String get readerCustomThemeBackgroundHint =>
      'La couleur du papier et du canevas de lecture';

  @override
  String get readerCustomThemeControlBar => 'Couleur de la barre de commande';

  @override
  String get readerCustomThemeControlBarHint =>
      'Commandes supérieures et inférieures et surfaces de réglages';

  @override
  String get readerCustomThemeContrastGood =>
      'Le texte offre un contraste net pour une longue lecture confortable';

  @override
  String get readerCustomThemeContrastLow =>
      'Le contraste du texte est faible et peut causer de la fatigue visuelle';

  @override
  String get readerCustomThemeSave => 'Enregistrer et utiliser';

  @override
  String get readerCustomThemePreview => 'Aperçu en direct';

  @override
  String get readerCustomThemePreviewChapter =>
      'Chapitre un · Le vent entre les pages';

  @override
  String get readerCustomThemePreviewBody =>
      'Voici votre espace de lecture. Ajustez les couleurs du texte, du papier et des commandes jusqu\'à ce que chaque page soit vraiment vôtre.';

  @override
  String get readerCustomThemeHexInvalid =>
      'Saisissez une couleur hexadécimale à 6 chiffres, par exemple #F6F0E4';

  @override
  String get readerCustomThemeHexLabel => 'Couleur hexadécimale';

  @override
  String get readerCustomThemeAdd => 'Ajouter un thème';

  @override
  String get readerCustomThemeReorderHint =>
      'Maintenez la poignée à droite pour réordonner les thèmes. Le même ordre apparaît dans les paramètres de lecture.';

  @override
  String get readerCustomThemeUse => 'Utiliser le thème sélectionné';

  @override
  String get readerCustomThemeDeleteTitle => 'Supprimer le thème de lecture ?';

  @override
  String readerCustomThemeDeleteMessage(String name) {
    return '\"$name\" sera retiré de vos thèmes, ainsi que son image d\'arrière-plan enregistrée.';
  }

  @override
  String get readerCustomThemeNewTitle => 'Nouveau thème de lecture';

  @override
  String get readerCustomThemeEditTitle => 'Modifier le thème de lecture';

  @override
  String get readerCustomThemeName => 'Nom du thème';

  @override
  String get readerCustomThemeNameHint =>
      'Par exemple, Nuit pluvieuse ou Papier d\'après-midi';

  @override
  String get readerCustomThemeBackgroundImage => 'Image d\'arrière-plan';

  @override
  String get readerCustomThemeBackgroundImageHint =>
      'Prend en charge JPG, PNG et WebP. L\'image est copiée dans le stockage de l\'application.';

  @override
  String get readerCustomThemeChooseImage => 'Téléverser une image';

  @override
  String get readerCustomThemeReplaceImage => 'Remplacer l\'image';

  @override
  String get readerCustomThemeRemoveImage => 'Retirer l\'image';

  @override
  String get readerCustomThemeImageStrength =>
      'Intensité de l\'image d\'arrière-plan';

  @override
  String get readerCustomThemeImageUnsupported =>
      'L\'importation d\'image d\'arrière-plan n\'est pas prise en charge sur cette plateforme';

  @override
  String get readerCustomThemeImageTooLarge =>
      'L\'image ne doit pas dépasser 20 Mo';

  @override
  String get readerCustomThemeImageFormat =>
      'Choisissez une image JPG, PNG ou WebP';

  @override
  String get readerCustomThemeImageFailed =>
      'Impossible d\'importer l\'image d\'arrière-plan. Réessayez.';

  @override
  String get importUnknownTitle => 'Titre inconnu';

  @override
  String get importUnknownAuthor => 'Auteur inconnu';

  @override
  String get bookUntitled => 'Sans titre';

  @override
  String get readerAddAnnotation => 'Ajouter une annotation';

  @override
  String get readerAnnotationHint => 'Écrivez vos réflexions sur ce passage…';

  @override
  String get readerAnnotationSaved => 'Annotation enregistrée';

  @override
  String get readerAnnotationDeleted => 'Annotation supprimée';

  @override
  String get readerNoAnnotations => 'Aucune annotation pour le moment';

  @override
  String get readerNoAnnotationsHint =>
      'Sélectionnez du texte pour surligner ou ajouter un commentaire. Touchez un commentaire souligné pour le relire.';

  @override
  String get readerChapterProgressTitle => 'Progression du chapitre';

  @override
  String get readerChapterProgressHidden => 'Masquée';

  @override
  String readerChapterProgressFraction(int chapter, int total) {
    return '$chapter/$total chapitres';
  }

  @override
  String readerChapterProgressRemaining(int count) {
    return '$count chapitres à venir';
  }
}
