// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get home => 'Inicio';

  @override
  String get library => 'Estantería';

  @override
  String get settings => 'Ajustes';

  @override
  String get theme => 'Tema';

  @override
  String get accent => 'Color de acento';

  @override
  String get bookmarks => 'Marcadores';

  @override
  String get notes => 'Notas';

  @override
  String get highlights => 'Resaltados';

  @override
  String get ttsReading => 'Texto a voz';

  @override
  String get pause => 'Pausar';

  @override
  String get stop => 'Detener';

  @override
  String get language => 'Idioma';

  @override
  String get fontSize => 'Tamaño de letra';

  @override
  String get readingProgress => 'Progreso de lectura';

  @override
  String get totalPages => 'Páginas totales';

  @override
  String get currentPage => 'Página actual';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get delete => 'Eliminar';

  @override
  String get edit => 'Editar';

  @override
  String get save => 'Guardar';

  @override
  String get back => 'Atrás';

  @override
  String get next => 'Siguiente';

  @override
  String get previous => 'Anterior';

  @override
  String get search => 'Buscar';

  @override
  String get loading => 'Cargando...';

  @override
  String get error => 'Error';

  @override
  String get readingSettings => 'Ajustes de lectura';

  @override
  String get readerFont => 'Fuente de lectura';

  @override
  String get readerFontSelectionDescription =>
      'Elige la fuente de lectura. EPUB ofrece la fuente del libro, la del sistema y las fuentes instaladas.';

  @override
  String get readerFontBookPriorityHint =>
      'Usa la fuente incrustada del libro cuando está disponible; si no, usa la fuente de lectura predeterminada de la plataforma.';

  @override
  String get readerFontOverrideHint =>
      'Anula las fuentes incrustadas por el editor.';

  @override
  String get fontBookEmbedded => 'Integrada en el libro';

  @override
  String get fontSystem => 'Predeterminada de la plataforma';

  @override
  String get fontSystemDescription =>
      'Usa una fuente de lectura optimizada para la plataforma, con glifos y paginación estables.';

  @override
  String get fontSerifDescription =>
      'Tipografía serif de carácter sereno y editorial para lecturas prolongadas.';

  @override
  String get fontSansSerifDescription =>
      'Tipografía sans serif clara, ideal para interfaces compactas y lectura cotidiana.';

  @override
  String get fontMonospaceDescription =>
      'Tipografía de ancho fijo, indicada para código, material técnico y diseños centrados.';

  @override
  String get fontPreviewText => 'Origo X · Lee con libertad 开卷有益';

  @override
  String get customFonts => 'Mis fuentes';

  @override
  String get builtInFonts => 'Fuentes integradas';

  @override
  String fontVariableWeightRange(int min, int max) {
    return 'Grosor ajustable $min–$max';
  }

  @override
  String get fontStaticWeight => 'Grosor fijo (la negrita se sintetiza)';

  @override
  String get importFont => 'Importar fuente';

  @override
  String get importingFont => 'Importando fuente…';

  @override
  String get customFontImportUnsupported =>
      'La importación persistente de fuentes aún no es compatible con esta plataforma.';

  @override
  String get customFontUnsupportedFormat =>
      'Elige un archivo de fuente TTF u OTF.';

  @override
  String get customFontInvalid =>
      'Este archivo no es una fuente válida o compatible.';

  @override
  String get customFontTooLarge => 'El archivo de fuente supera los 50 MB.';

  @override
  String get customFontReadFailed => 'No se pudo leer el archivo de fuente.';

  @override
  String get customFontLoadFailed => 'No se pudo cargar la fuente.';

  @override
  String get customFontStorageFailed =>
      'No se pudo guardar la fuente en este dispositivo.';

  @override
  String get renameFont => 'Renombrar fuente';

  @override
  String get fontFamilyLabel => 'Fuente';

  @override
  String get fontSizeLabel => 'Tamaño de letra';

  @override
  String get readerFontWeightLabel => 'Grosor de la fuente';

  @override
  String get readerFontWeightLight => 'Ligera';

  @override
  String get readerFontWeightRegular => 'Normal';

  @override
  String get readerFontWeightMedium => 'Media';

  @override
  String get readerFontWeightSemiBold => 'Seminegrita';

  @override
  String get readerFontWeightBold => 'Negrita';

  @override
  String readerFontWeightVariableHint(int min, int max) {
    return 'Los controles de lectura usan cinco pasos legibles de 300 a 700. El rango completo real de esta fuente es $min–$max.';
  }

  @override
  String get readerFontWeightSyntheticHint =>
      'Los controles de lectura usan cinco pasos de 300 a 700. Esta fuente no declara un eje de grosor variable, así que el sistema aproxima el resultado y puede variar según la plataforma.';

  @override
  String get readerFontWeightPreview =>
      'Una página tranquila llega más lejos · 字里行间';

  @override
  String get lineSpacingLabel => 'Interlineado';

  @override
  String get letterSpacingLabel => 'Espaciado entre letras';

  @override
  String get textAlignmentLabel => 'Alineación del texto';

  @override
  String get textAlignmentNatural => 'Natural';

  @override
  String get textAlignmentJustified => 'Justificado';

  @override
  String get firstLineIndentLabel => 'Sangría de primera línea';

  @override
  String get paragraphSpacingLabel => 'Espaciado entre párrafos';

  @override
  String get pageTurningMode => 'Modo de página';

  @override
  String get pageTurningSlide => 'Deslizamiento horizontal';

  @override
  String get pageTurningScroll => 'Paginación vertical';

  @override
  String get tapZoneSettings => 'Zonas táctiles';

  @override
  String get tapZoneNextPage => 'Página siguiente';

  @override
  String get tapZonePreviousPage => 'Página anterior';

  @override
  String get tapZoneMenu => 'Menú';

  @override
  String get tapZoneNextChapter => 'Capítulo siguiente';

  @override
  String get tapZonePreviousChapter => 'Capítulo anterior';

  @override
  String get tapZoneNone => 'Sin acción';

  @override
  String get tapZoneSettingsHint =>
      'Personaliza qué hace cada una de las nueve áreas táctiles';

  @override
  String get tapZoneChooseAction => 'Elige una acción';

  @override
  String get tapZoneMenuRequiredHint =>
      'Toca un área para cambiar su acción. Al menos una área debe seguir siendo Menú; si eliminas todos los Menús, el área central vuelve a ser Menú.';

  @override
  String get tapZoneReset => 'Restablecer valores predeterminados';

  @override
  String get highlightColor => 'Color de resaltado';

  @override
  String get noteTypeHighlight => 'Resaltado';

  @override
  String get noteTypeUnderline => 'Subrayado';

  @override
  String get noteTypeNote => 'Nota';

  @override
  String get author => 'Autor';

  @override
  String get progress => 'Progreso';

  @override
  String get deleteBook => 'Eliminar libro';

  @override
  String get readerToolbarTOC => 'Índice';

  @override
  String get readerAddBookmark => 'Añadir marcador';

  @override
  String get bookmarkAdded => 'Marcador añadido';

  @override
  String get bookmarkRemoved => 'Marcador eliminado';

  @override
  String get readerNavigationTitle => 'Navegación de lectura';

  @override
  String readerNavigationPosition(int current, int total) {
    return 'Capítulo $current de $total';
  }

  @override
  String get readerSearchChapters => 'Buscar capítulos';

  @override
  String get readerBackToCurrentChapter => 'Volver al capítulo actual';

  @override
  String get readerCurrentChapter => 'Actual';

  @override
  String get readerCurrentPosition => 'Posición actual';

  @override
  String get readerNoChapterResults => 'No hay capítulos coincidentes';

  @override
  String get readerNoChapterResultsHint =>
      'Prueba con otra palabra del título del capítulo.';

  @override
  String get readerNoBookmarks => 'Aún no hay marcadores';

  @override
  String get readerNoBookmarksHint =>
      'Toca el botón de marcador de la esquina superior derecha para guardar tu lugar.';

  @override
  String get readerUnsupportedFormat =>
      'Este formato todavía no se puede leer.';

  @override
  String get currentChapter => 'Capítulo actual';

  @override
  String get readerPrefaceTitle => 'Preliminares';

  @override
  String get readerModeHorizontalPage => 'Sin animación';

  @override
  String get readerModeVerticalScrollHint =>
      'Desliza páginas prepaginadas verticalmente; desliza lateralmente para cambiar de capítulo';

  @override
  String get readerModeWholeBookScrollHint =>
      'Los capítulos prepaginados forman una lista vertical posicionable';

  @override
  String get readerScrollByChapterTitle => 'Desplazar por capítulo';

  @override
  String get readerScrollByChapterOnHint =>
      'Pasa página a página dentro de un capítulo y desliza lateralmente para cambiar de capítulo';

  @override
  String get readerScrollByChapterOffHint =>
      'Todos los capítulos se enlazan página a página en una lista vertical posicionable';

  @override
  String get readerModeHorizontalPageHint =>
      'Toca el lado izquierdo para la página anterior y el derecho para la siguiente';

  @override
  String get readerModeHorizontalSlideHint =>
      'Las páginas siguen tu dedo horizontalmente y encajan en su sitio';

  @override
  String get readerModeCoverSlide => 'Cubierta';

  @override
  String get readerModeCoverSlideHint =>
      'La página actual se desliza hacia la izquierda, descubriendo la página siguiente debajo';

  @override
  String get readerModePageCurl => 'Vuelta de página';

  @override
  String get readerModePageCurlHint =>
      'Arrastra lateralmente para curvar la página y suelta para girarla o que vuelva';

  @override
  String get readerTextBrightnessLabel => 'Brillo del texto';

  @override
  String get readerDimTextInDarkModeTitle => 'Atenuar el texto en modo oscuro';

  @override
  String get readerDimTextInDarkModeHint =>
      'Usa un 70 % de brillo en modo oscuro';

  @override
  String get readerHorizontalMarginLabel => 'Margen horizontal';

  @override
  String get readerTopMarginLabel => 'Margen superior';

  @override
  String get readerBottomMarginLabel => 'Margen inferior';

  @override
  String get readerTxtChapterTitlePageTitle =>
      'Título del capítulo en su propia página';

  @override
  String get readerTxtChapterTitlePageHint =>
      'Cuando está desactivado, el título del capítulo aparece sobre el cuerpo del texto';

  @override
  String readerChapterFallback(int number) {
    return 'Capítulo $number';
  }

  @override
  String readerOpenFailed(String error) {
    return 'Error al abrir: $error';
  }

  @override
  String get readerNoContent => 'Este libro no tiene contenido legible';

  @override
  String readerStatusPaged(
    int chapter,
    int chapterCount,
    int page,
    int pageCount,
  ) {
    return 'Capítulo $chapter/$chapterCount · Página $page/$pageCount';
  }

  @override
  String get readerTopBarStyleTitle => 'Información superior';

  @override
  String get readerTopBarStyleSystem => 'Barra de estado del sistema';

  @override
  String get readerTopBarStyleSystemHint =>
      'Muestra la hora, la señal y la batería del sistema';

  @override
  String get readerTopBarStyleReader => 'Barra de información del lector';

  @override
  String get readerTopBarStyleReaderHint =>
      'Muestra la hora, el título del capítulo y la batería';

  @override
  String get readerTopBarStyleFloating => 'Barra de información flotante';

  @override
  String get readerTopBarStyleFloatingHint =>
      'Muestra la hora y la batería en la zona de la barra de estado sin ocupar espacio de lectura';

  @override
  String get readerTopBarStyleHidden => 'Totalmente inmersivo';

  @override
  String get readerTopBarStyleHiddenHint =>
      'No muestra información en la parte superior';

  @override
  String get readerThemeTitle => 'Tema de lectura';

  @override
  String get readerThemeDescription =>
      'Solo cambia la página de lectura y sus controles';

  @override
  String get readerSettingsTabTheme => 'Tema';

  @override
  String get readerSettingsTabText => 'Texto';

  @override
  String get readerSettingsTabLayout => 'Diseño';

  @override
  String get readerSettingsTabPaging => 'Paginación';

  @override
  String get readerSettingsAdvancedTypography => 'Tipografía avanzada';

  @override
  String get readerAutoPageTurnTitle => 'Pasar páginas automáticamente';

  @override
  String get readerAutoPageTurnOff => 'Sin iniciar';

  @override
  String get readerAutoPageTurnShortcutTitle => 'Atajo de lectura automática';

  @override
  String get readerAutoPageTurnShortcutHint =>
      'Mostrar con los controles de lectura para iniciar o pausar rápidamente';

  @override
  String get readerAutoPageTurnModeTimed => 'Paso de página temporizado';

  @override
  String get readerAutoPageTurnModeSweep => 'Paso de página con barrido';

  @override
  String get readerAutoPageTurnModeContinuous => 'Desplazamiento continuo';

  @override
  String get readerAutoPageTurnModeInterval => 'Desplazamiento por intervalos';

  @override
  String get readerAutoPageTurnTimedHint =>
      'Espera el intervalo elegido y pasa a la página siguiente.';

  @override
  String get readerAutoPageTurnSweepHint =>
      'Una línea barre hacia abajo, revelando gradualmente la página siguiente encima.';

  @override
  String get readerAutoPageTurnContinuousHint =>
      'Se desplaza hacia abajo de forma continua a una velocidad de lectura constante.';

  @override
  String get readerAutoPageTurnIntervalHint =>
      'Espera el intervalo elegido y luego se desplaza aproximadamente una pantalla.';

  @override
  String get readerAutoPageTurnSweepDurationLabel => 'Duración del barrido';

  @override
  String get readerAutoPageTurnScrollSpeedLabel =>
      'Velocidad de desplazamiento';

  @override
  String readerAutoPageTurnSecondsPerScreen(int seconds) {
    return '$seconds segundos por pantalla';
  }

  @override
  String readerAutoPageTurnModeValue(String mode, int seconds) {
    return '$mode · ${seconds}s/pantalla';
  }

  @override
  String readerAutoPageTurnModePaused(String mode, int seconds) {
    return 'En pausa · $mode · ${seconds}s/pantalla';
  }

  @override
  String get readerAutoPageTurnIntervalLabel => 'Intervalo de páginas';

  @override
  String get readerAutoPageTurnStart => 'Iniciar el paso automático de páginas';

  @override
  String get readerAutoPageTurnResume =>
      'Reanudar el paso automático de páginas';

  @override
  String get readerThemeDay => 'Día';

  @override
  String get readerThemeFollowSystem => 'Seguir el sistema';

  @override
  String get readerThemeMist => 'Bruma';

  @override
  String get readerThemeGreen => 'Cuidado de ojos';

  @override
  String get readerThemeRose => 'Rosa';

  @override
  String get readerThemeNavy => 'Azul profundo';

  @override
  String get readerThemeNight => 'Noche';

  @override
  String get readerThemePureBlack => 'Negro puro';

  @override
  String get readerThemeParchment => 'Pergamino';

  @override
  String get readerThemeCustom => 'Personalizado';

  @override
  String get readerPullBookmarkTitle => 'Marcador desplegable';

  @override
  String get readerPullBookmarkHint =>
      'Desliza hacia abajo desde el borde superior y suelta para añadir o quitar un marcador de esta página';

  @override
  String get readerPullBookmarkAddHint =>
      'Sigue tirando para añadir el marcador';

  @override
  String get readerPullBookmarkRemoveHint =>
      'Sigue tirando para quitar el marcador';

  @override
  String get readerPullBookmarkReleaseHint => 'Suelta para terminar';

  @override
  String get readerTapAnimationTitle => 'Animación al tocar';

  @override
  String get readerTapAnimationHint =>
      'Usa la animación de paso de página actual para los toques laterales; desactívala para refrescar al instante';

  @override
  String get readerTabletTwoPageTitle => 'Diseño de dos páginas en tablet';

  @override
  String get readerTabletTwoPageHint =>
      'Muestra las páginas izquierda y derecha lado a lado en horizontal; desactívalo para usar siempre una sola página';

  @override
  String get readerCustomThemeReset => 'Restablecer';

  @override
  String get readerCustomThemeColors => 'Colores del tema';

  @override
  String get readerCustomThemeTextColor => 'Color del texto';

  @override
  String get readerCustomThemeTextColorHint =>
      'Texto del cuerpo, títulos e iconos principales';

  @override
  String get readerCustomThemeBackground => 'Fondo de lectura';

  @override
  String get readerCustomThemeBackgroundHint =>
      'El color del papel y del lienzo de lectura';

  @override
  String get readerCustomThemeControlBar => 'Color de la barra de control';

  @override
  String get readerCustomThemeControlBarHint =>
      'Controles superior e inferior y superficies de ajustes';

  @override
  String get readerCustomThemeContrastGood =>
      'El texto tiene un contraste claro para una lectura prolongada cómoda';

  @override
  String get readerCustomThemeContrastLow =>
      'El contraste del texto es bajo y puede causar fatiga visual';

  @override
  String get readerCustomThemeSave => 'Guardar y usar';

  @override
  String get readerCustomThemePreview => 'Vista previa en vivo';

  @override
  String get readerCustomThemePreviewChapter =>
      'Capítulo uno · Viento entre las páginas';

  @override
  String get readerCustomThemePreviewBody =>
      'Este es tu espacio de lectura. Ajusta los colores del texto, el papel y los controles hasta que cada página se sienta verdaderamente tuya.';

  @override
  String get readerCustomThemeHexInvalid =>
      'Introduce un color hexadecimal de 6 dígitos, como #F6F0E4';

  @override
  String get readerCustomThemeHexLabel => 'Color hexadecimal';

  @override
  String get readerCustomThemeAdd => 'Añadir tema';

  @override
  String get readerCustomThemeReorderHint =>
      'Mantén pulsado el tirador de la derecha para reordenar los temas. El mismo orden aparece en los ajustes de lectura.';

  @override
  String get readerCustomThemeUse => 'Usar el tema seleccionado';

  @override
  String get readerCustomThemeDeleteTitle => '¿Eliminar el tema de lectura?';

  @override
  String readerCustomThemeDeleteMessage(String name) {
    return '“$name” se eliminará de tus temas, junto con su imagen de fondo guardada.';
  }

  @override
  String get readerCustomThemeNewTitle => 'Nuevo tema de lectura';

  @override
  String get readerCustomThemeEditTitle => 'Editar tema de lectura';

  @override
  String get readerCustomThemeName => 'Nombre del tema';

  @override
  String get readerCustomThemeNameHint =>
      'Por ejemplo, Noche de lluvia o Tarde de papel';

  @override
  String get readerCustomThemeBackgroundImage => 'Imagen de fondo';

  @override
  String get readerCustomThemeBackgroundImageHint =>
      'Admite JPG, PNG y WebP. La imagen se copia al almacenamiento de la app.';

  @override
  String get readerCustomThemeChooseImage => 'Subir imagen';

  @override
  String get readerCustomThemeReplaceImage => 'Reemplazar imagen';

  @override
  String get readerCustomThemeRemoveImage => 'Quitar imagen';

  @override
  String get readerCustomThemeImageStrength =>
      'Intensidad de la imagen de fondo';

  @override
  String get readerCustomThemeImageUnsupported =>
      'La importación de imágenes de fondo no es compatible con esta plataforma';

  @override
  String get readerCustomThemeImageTooLarge =>
      'La imagen no debe superar los 20 MB';

  @override
  String get readerCustomThemeImageFormat => 'Elige una imagen JPG, PNG o WebP';

  @override
  String get readerCustomThemeImageFailed =>
      'No se pudo importar la imagen de fondo. Inténtalo de nuevo.';

  @override
  String get importUnknownTitle => 'Título desconocido';

  @override
  String get importUnknownAuthor => 'Autor desconocido';

  @override
  String get bookUntitled => 'Sin título';

  @override
  String get readerAddAnnotation => 'Añadir anotación';

  @override
  String get readerAnnotationHint =>
      'Escribe lo que piensas sobre este pasaje…';

  @override
  String get readerAnnotationSaved => 'Anotación guardada';

  @override
  String get readerAnnotationDeleted => 'Anotación eliminada';

  @override
  String get readerNoAnnotations => 'Aún no hay anotaciones';

  @override
  String get readerNoAnnotationsHint =>
      'Selecciona texto para resaltarlo o añadir un comentario. Toca un comentario subrayado para volver a leerlo.';

  @override
  String get readerChapterProgressTitle => 'Progreso de capítulos';

  @override
  String get readerChapterProgressHidden => 'Oculto';

  @override
  String readerChapterProgressFraction(int chapter, int total) {
    return '$chapter/$total capítulos';
  }

  @override
  String readerChapterProgressRemaining(int count) {
    return '$count capítulos por delante';
  }
}
