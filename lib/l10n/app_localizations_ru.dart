// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get home => 'Главная';

  @override
  String get library => 'Книжная полка';

  @override
  String get settings => 'Настройки';

  @override
  String get theme => 'Тема';

  @override
  String get accent => 'Акцентный цвет';

  @override
  String get bookmarks => 'Закладки';

  @override
  String get notes => 'Заметки';

  @override
  String get highlights => 'Выделения';

  @override
  String get ttsReading => 'Озвучивание текста';

  @override
  String get pause => 'Пауза';

  @override
  String get stop => 'Стоп';

  @override
  String get language => 'Язык';

  @override
  String get fontSize => 'Размер шрифта';

  @override
  String get readingProgress => 'Прогресс чтения';

  @override
  String get totalPages => 'Всего страниц';

  @override
  String get currentPage => 'Текущая страница';

  @override
  String get cancel => 'Отмена';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get delete => 'Удалить';

  @override
  String get edit => 'Изменить';

  @override
  String get save => 'Сохранить';

  @override
  String get back => 'Назад';

  @override
  String get next => 'Далее';

  @override
  String get previous => 'Предыдущий';

  @override
  String get search => 'Поиск';

  @override
  String get loading => 'Загрузка...';

  @override
  String get error => 'Ошибка';

  @override
  String get readingSettings => 'Настройки чтения';

  @override
  String get readerFont => 'Шрифт чтения';

  @override
  String get readerFontSelectionDescription =>
      'Выберите шрифт для чтения. EPUB предлагает шрифт книги, системный и установленные шрифты.';

  @override
  String get readerFontBookPriorityHint =>
      'Использует встроенный шрифт книги, если он есть; иначе — системный шрифт чтения по умолчанию.';

  @override
  String get readerFontOverrideHint => 'Заменяет шрифты, встроенные издателем.';

  @override
  String get fontBookEmbedded => 'Встроенный в книгу';

  @override
  String get fontSystem => 'Как в системе';

  @override
  String get fontSystemDescription =>
      'Оптимизированный для платформы шрифт чтения со стабильными глифами и разбивкой на страницы.';

  @override
  String get fontSerifDescription =>
      'Шрифт с засечками со спокойным редакционным характером для длительного чтения.';

  @override
  String get fontSansSerifDescription =>
      'Чёткий шрифт без засечек для компактных интерфейсов и повседневного чтения.';

  @override
  String get fontMonospaceDescription =>
      'Моноширинный шрифт для кода, технических текстов и строгой вёрстки.';

  @override
  String get fontPreviewText => 'Origo X · Read freely 开卷有益';

  @override
  String get customFonts => 'Мои шрифты';

  @override
  String get builtInFonts => 'Встроенные шрифты';

  @override
  String fontVariableWeightRange(int min, int max) {
    return 'Настраиваемая насыщенность $min–$max';
  }

  @override
  String get fontStaticWeight =>
      'Фиксированная насыщенность (жирное начертание синтезируется)';

  @override
  String get importFont => 'Импортировать шрифт';

  @override
  String get importingFont => 'Импорт шрифта…';

  @override
  String get customFontImportUnsupported =>
      'Постоянный импорт шрифтов пока не поддерживается на этой платформе.';

  @override
  String get customFontUnsupportedFormat => 'Выберите файл шрифта TTF или OTF.';

  @override
  String get customFontInvalid =>
      'Этот файл не является допустимым или поддерживаемым шрифтом.';

  @override
  String get customFontTooLarge => 'Файл шрифта больше 50 МБ.';

  @override
  String get customFontReadFailed => 'Не удалось прочитать файл шрифта.';

  @override
  String get customFontLoadFailed => 'Не удалось загрузить шрифт.';

  @override
  String get customFontStorageFailed =>
      'Не удалось сохранить шрифт на этом устройстве.';

  @override
  String get renameFont => 'Переименовать шрифт';

  @override
  String get fontFamilyLabel => 'Шрифт';

  @override
  String get fontSizeLabel => 'Размер шрифта';

  @override
  String get readerFontWeightLabel => 'Насыщенность шрифта';

  @override
  String get readerFontWeightLight => 'Светлый';

  @override
  String get readerFontWeightRegular => 'Обычный';

  @override
  String get readerFontWeightMedium => 'Средний';

  @override
  String get readerFontWeightSemiBold => 'Полужирный';

  @override
  String get readerFontWeightBold => 'Жирный';

  @override
  String readerFontWeightVariableHint(int min, int max) {
    return 'Настройки чтения используют пять различимых ступеней от 300 до 700. Полный диапазон этого шрифта — $min–$max.';
  }

  @override
  String get readerFontWeightSyntheticHint =>
      'Настройки чтения используют пять ступеней от 300 до 700. У этого шрифта нет объявленной оси насыщенности, поэтому система подбирает начертание приблизительно; результат может отличаться на разных платформах.';

  @override
  String get readerFontWeightPreview => 'Тихая страница читается легче · 字里行间';

  @override
  String get lineSpacingLabel => 'Межстрочный интервал';

  @override
  String get letterSpacingLabel => 'Межбуквенный интервал';

  @override
  String get textAlignmentLabel => 'Выравнивание текста';

  @override
  String get textAlignmentNatural => 'Естественное';

  @override
  String get textAlignmentJustified => 'По ширине';

  @override
  String get firstLineIndentLabel => 'Отступ первой строки';

  @override
  String get paragraphSpacingLabel => 'Интервал между абзацами';

  @override
  String get pageTurningMode => 'Режим страниц';

  @override
  String get pageTurningSlide => 'Горизонтальное перелистывание';

  @override
  String get pageTurningScroll => 'Вертикальная прокрутка';

  @override
  String get tapZoneSettings => 'Зоны нажатия';

  @override
  String get tapZoneNextPage => 'Следующая страница';

  @override
  String get tapZonePreviousPage => 'Предыдущая страница';

  @override
  String get tapZoneMenu => 'Меню';

  @override
  String get tapZoneNextChapter => 'Следующая глава';

  @override
  String get tapZonePreviousChapter => 'Предыдущая глава';

  @override
  String get tapZoneNone => 'Без действия';

  @override
  String get tapZoneSettingsHint =>
      'Настройте действие для каждой из девяти зон нажатия';

  @override
  String get tapZoneChooseAction => 'Выберите действие';

  @override
  String get tapZoneMenuRequiredHint =>
      'Коснитесь зоны, чтобы изменить её действие. Хотя бы одна зона должна оставаться «Меню»; если убрать все зоны «Меню», центральная зона снова станет «Меню».';

  @override
  String get tapZoneReset => 'Восстановить по умолчанию';

  @override
  String get highlightColor => 'Цвет выделения';

  @override
  String get noteTypeHighlight => 'Выделение';

  @override
  String get noteTypeUnderline => 'Подчёркивание';

  @override
  String get noteTypeNote => 'Заметка';

  @override
  String get author => 'Автор';

  @override
  String get progress => 'Прогресс';

  @override
  String get deleteBook => 'Удалить книгу';

  @override
  String get readerToolbarTOC => 'Оглавление';

  @override
  String get readerAddBookmark => 'Добавить закладку';

  @override
  String get bookmarkAdded => 'Закладка добавлена';

  @override
  String get bookmarkRemoved => 'Закладка удалена';

  @override
  String get readerNavigationTitle => 'Навигация по чтению';

  @override
  String readerNavigationPosition(int current, int total) {
    return 'Глава $current из $total';
  }

  @override
  String get readerSearchChapters => 'Поиск по главам';

  @override
  String get readerBackToCurrentChapter => 'Вернуться к текущей главе';

  @override
  String get readerCurrentChapter => 'Текущая';

  @override
  String get readerCurrentPosition => 'Текущая позиция';

  @override
  String get readerNoChapterResults => 'Подходящих глав нет';

  @override
  String get readerNoChapterResultsHint =>
      'Попробуйте другое слово из названия главы.';

  @override
  String get readerNoBookmarks => 'Закладок пока нет';

  @override
  String get readerNoBookmarksHint =>
      'Коснитесь кнопки закладки в правом верхнем углу, чтобы сохранить место.';

  @override
  String get readerUnsupportedFormat =>
      'Этот формат пока не поддерживается для чтения.';

  @override
  String get currentChapter => 'Текущая глава';

  @override
  String get readerPrefaceTitle => 'Вступление';

  @override
  String get readerModeHorizontalPage => 'Без анимации';

  @override
  String get readerModeVerticalScrollHint =>
      'Листайте готовые страницы по вертикали; смахивайте в сторону для смены главы';

  @override
  String get readerModeWholeBookScrollHint =>
      'Готовые главы образуют один прокручиваемый вертикальный список';

  @override
  String get readerScrollByChapterTitle => 'Прокрутка по главам';

  @override
  String get readerScrollByChapterOnHint =>
      'Листайте одну главу по страницам, затем смахивайте в сторону для смены главы';

  @override
  String get readerScrollByChapterOffHint =>
      'Все главы соединяются постранично в один прокручиваемый вертикальный список';

  @override
  String get readerModeHorizontalPageHint =>
      'Касание слева — предыдущая страница, справа — следующая';

  @override
  String get readerModeHorizontalSlideHint =>
      'Страницы следуют за пальцем по горизонтали и фиксируются на месте';

  @override
  String get readerModeCoverSlide => 'Сдвиг листа';

  @override
  String get readerModeCoverSlideHint =>
      'Текущая страница уезжает влево, открывая следующую под ней';

  @override
  String get readerModePageCurl => 'Загиб страницы';

  @override
  String get readerModePageCurlHint =>
      'Потяните в сторону, чтобы загнуть страницу, затем отпустите для перелистывания или возврата';

  @override
  String get readerTextBrightnessLabel => 'Яркость текста';

  @override
  String get readerDimTextInDarkModeTitle => 'Приглушать текст в тёмной теме';

  @override
  String get readerDimTextInDarkModeHint =>
      'Использовать 70% яркости в тёмной теме';

  @override
  String get readerHorizontalMarginLabel => 'Горизонтальные поля';

  @override
  String get readerTopMarginLabel => 'Верхнее поле';

  @override
  String get readerBottomMarginLabel => 'Нижнее поле';

  @override
  String get readerTxtChapterTitlePageTitle =>
      'Название главы на отдельной странице';

  @override
  String get readerTxtChapterTitlePageHint =>
      'Если выключено, название главы отображается над основным текстом';

  @override
  String readerChapterFallback(int number) {
    return 'Глава $number';
  }

  @override
  String readerOpenFailed(String error) {
    return 'Не удалось открыть: $error';
  }

  @override
  String get readerNoContent => 'В этой книге нет читаемого содержимого';

  @override
  String readerStatusPaged(
    int chapter,
    int chapterCount,
    int page,
    int pageCount,
  ) {
    return 'Глава $chapter/$chapterCount · Страница $page/$pageCount';
  }

  @override
  String get readerTopBarStyleTitle => 'Верхняя информация';

  @override
  String get readerTopBarStyleSystem => 'Системная строка состояния';

  @override
  String get readerTopBarStyleSystemHint =>
      'Показывать системное время, сигнал и батарею';

  @override
  String get readerTopBarStyleReader => 'Информационная панель читалки';

  @override
  String get readerTopBarStyleReaderHint =>
      'Показывать время, название главы и батарею';

  @override
  String get readerTopBarStyleFloating => 'Плавающая информационная панель';

  @override
  String get readerTopBarStyleFloatingHint =>
      'Показывать время и батарею в области строки состояния, не занимая места для чтения';

  @override
  String get readerTopBarStyleHidden => 'Полное погружение';

  @override
  String get readerTopBarStyleHiddenHint =>
      'Не показывать никакой информации сверху';

  @override
  String get readerThemeTitle => 'Тема чтения';

  @override
  String get readerThemeDescription =>
      'Меняет только страницу чтения и её элементы управления';

  @override
  String get readerSettingsTabTheme => 'Тема';

  @override
  String get readerSettingsTabText => 'Текст';

  @override
  String get readerSettingsTabLayout => 'Вёрстка';

  @override
  String get readerSettingsTabPaging => 'Страницы';

  @override
  String get readerSettingsAdvancedTypography => 'Дополнительная типографика';

  @override
  String get readerAutoPageTurnTitle => 'Автолистание';

  @override
  String get readerAutoPageTurnOff => 'Не запущено';

  @override
  String get readerAutoPageTurnShortcutTitle => 'Быстрый доступ к авточтению';

  @override
  String get readerAutoPageTurnShortcutHint =>
      'Показывать в элементах управления чтением для быстрого запуска или паузы';

  @override
  String get readerAutoPageTurnModeTimed => 'Листание по таймеру';

  @override
  String get readerAutoPageTurnModeSweep => 'Плавное листание';

  @override
  String get readerAutoPageTurnModeContinuous => 'Непрерывная прокрутка';

  @override
  String get readerAutoPageTurnModeInterval => 'Прокрутка по интервалу';

  @override
  String get readerAutoPageTurnTimedHint =>
      'Ждать выбранный интервал, затем перейти к следующей странице.';

  @override
  String get readerAutoPageTurnSweepHint =>
      'Линия опускается вниз, постепенно открывая следующую страницу над ней.';

  @override
  String get readerAutoPageTurnContinuousHint =>
      'Непрерывная прокрутка вниз с постоянной скоростью чтения.';

  @override
  String get readerAutoPageTurnIntervalHint =>
      'Ждать выбранный интервал, затем прокрутить вниз примерно на один экран.';

  @override
  String get readerAutoPageTurnSweepDurationLabel =>
      'Длительность плавного листания';

  @override
  String get readerAutoPageTurnScrollSpeedLabel => 'Скорость прокрутки';

  @override
  String readerAutoPageTurnSecondsPerScreen(int seconds) {
    return '$seconds с на экран';
  }

  @override
  String readerAutoPageTurnModeValue(String mode, int seconds) {
    return '$mode · $seconds с/экран';
  }

  @override
  String readerAutoPageTurnModePaused(String mode, int seconds) {
    return 'Пауза · $mode · $seconds с/экран';
  }

  @override
  String get readerAutoPageTurnIntervalLabel => 'Интервал страниц';

  @override
  String get readerAutoPageTurnStart => 'Запустить автолистание';

  @override
  String get readerAutoPageTurnResume => 'Возобновить автолистание';

  @override
  String get readerThemeDay => 'День';

  @override
  String get readerThemeFollowSystem => 'Как в системе';

  @override
  String get readerThemeMist => 'Дымка';

  @override
  String get readerThemeGreen => 'Защита глаз';

  @override
  String get readerThemeRose => 'Роза';

  @override
  String get readerThemeNavy => 'Глубокий синий';

  @override
  String get readerThemeNight => 'Ночь';

  @override
  String get readerThemePureBlack => 'Чистый чёрный';

  @override
  String get readerThemeParchment => 'Пергамент';

  @override
  String get readerThemeCustom => 'Своя';

  @override
  String get readerPullBookmarkTitle => 'Закладка потягиванием вниз';

  @override
  String get readerPullBookmarkHint =>
      'Потяните от верхнего края и отпустите, чтобы добавить или удалить закладку для этой страницы';

  @override
  String get readerPullBookmarkAddHint =>
      'Потяните сильнее, чтобы добавить закладку';

  @override
  String get readerPullBookmarkRemoveHint =>
      'Потяните сильнее, чтобы удалить закладку';

  @override
  String get readerPullBookmarkReleaseHint => 'Отпустите для завершения';

  @override
  String get readerTapAnimationTitle => 'Анимация касания';

  @override
  String get readerTapAnimationHint =>
      'Использовать текущую анимацию перелистывания для боковых касаний; выключите для мгновенного обновления';

  @override
  String get readerTabletTwoPageTitle => 'Две страницы на планшете';

  @override
  String get readerTabletTwoPageHint =>
      'В альбомной ориентации показывать левую и правую страницы рядом; выключите, чтобы всегда использовать одну страницу';

  @override
  String get readerCustomThemeReset => 'Сбросить';

  @override
  String get readerCustomThemeColors => 'Цвета темы';

  @override
  String get readerCustomThemeTextColor => 'Цвет текста';

  @override
  String get readerCustomThemeTextColorHint =>
      'Основной текст, заголовки и главные значки';

  @override
  String get readerCustomThemeBackground => 'Фон чтения';

  @override
  String get readerCustomThemeBackgroundHint => 'Цвет «бумаги» и холста чтения';

  @override
  String get readerCustomThemeControlBar => 'Цвет панели управления';

  @override
  String get readerCustomThemeControlBarHint =>
      'Верхняя и нижняя панели и поверхности настроек';

  @override
  String get readerCustomThemeContrastGood =>
      'Контраст текста достаточен для комфортного длительного чтения';

  @override
  String get readerCustomThemeContrastLow =>
      'Контраст текста низкий и может вызвать утомление';

  @override
  String get readerCustomThemeSave => 'Сохранить и использовать';

  @override
  String get readerCustomThemePreview => 'Живой предпросмотр';

  @override
  String get readerCustomThemePreviewChapter =>
      'Глава первая · Ветер между страниц';

  @override
  String get readerCustomThemePreviewBody =>
      'Это ваше пространство чтения. Настройте цвета текста, бумаги и панелей, пока каждая страница не станет по-настоящему вашей.';

  @override
  String get readerCustomThemeHexInvalid =>
      'Введите 6-значный hex-цвет, например #F6F0E4';

  @override
  String get readerCustomThemeHexLabel => 'Hex-цвет';

  @override
  String get readerCustomThemeAdd => 'Добавить тему';

  @override
  String get readerCustomThemeReorderHint =>
      'Удерживайте маркер справа, чтобы изменить порядок тем. Тот же порядок отображается в настройках чтения.';

  @override
  String get readerCustomThemeUse => 'Использовать выбранную тему';

  @override
  String get readerCustomThemeDeleteTitle => 'Удалить тему чтения?';

  @override
  String readerCustomThemeDeleteMessage(String name) {
    return 'Тема «$name» будет удалена вместе с сохранённым фоновым изображением.';
  }

  @override
  String get readerCustomThemeNewTitle => 'Новая тема чтения';

  @override
  String get readerCustomThemeEditTitle => 'Изменить тему чтения';

  @override
  String get readerCustomThemeName => 'Название темы';

  @override
  String get readerCustomThemeNameHint =>
      'Например, «Дождливая ночь» или «Послеобеденная бумага»';

  @override
  String get readerCustomThemeBackgroundImage => 'Фоновое изображение';

  @override
  String get readerCustomThemeBackgroundImageHint =>
      'Поддерживаются JPG, PNG и WebP. Изображение копируется в хранилище приложения.';

  @override
  String get readerCustomThemeChooseImage => 'Загрузить изображение';

  @override
  String get readerCustomThemeReplaceImage => 'Заменить изображение';

  @override
  String get readerCustomThemeRemoveImage => 'Убрать изображение';

  @override
  String get readerCustomThemeImageStrength =>
      'Интенсивность фонового изображения';

  @override
  String get readerCustomThemeImageUnsupported =>
      'Импорт фоновых изображений не поддерживается на этой платформе';

  @override
  String get readerCustomThemeImageTooLarge =>
      'Изображение должно быть не больше 20 МБ';

  @override
  String get readerCustomThemeImageFormat =>
      'Выберите изображение JPG, PNG или WebP';

  @override
  String get readerCustomThemeImageFailed =>
      'Не удалось импортировать фоновое изображение. Попробуйте снова.';

  @override
  String get importUnknownTitle => 'Название неизвестно';

  @override
  String get importUnknownAuthor => 'Автор неизвестен';

  @override
  String get bookUntitled => 'Без названия';

  @override
  String get readerAddAnnotation => 'Добавить аннотацию';

  @override
  String get readerAnnotationHint => 'Напишите свои мысли об этом отрывке…';

  @override
  String get readerAnnotationSaved => 'Аннотация сохранена';

  @override
  String get readerAnnotationDeleted => 'Аннотация удалена';

  @override
  String get readerNoAnnotations => 'Аннотаций пока нет';

  @override
  String get readerNoAnnotationsHint =>
      'Выделите текст, чтобы подсветить его или добавить комментарий. Коснитесь подчёркнутого комментария, чтобы прочитать его снова.';

  @override
  String get readerChapterProgressTitle => 'Прогресс по главам';

  @override
  String get readerChapterProgressHidden => 'Скрыто';

  @override
  String readerChapterProgressFraction(int chapter, int total) {
    return 'Глав: $chapter/$total';
  }

  @override
  String readerChapterProgressRemaining(int count) {
    return 'Впереди глав: $count';
  }
}
