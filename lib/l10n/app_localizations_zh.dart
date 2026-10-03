// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get home => '首页';

  @override
  String get library => '书架';

  @override
  String get settings => '设置';

  @override
  String get theme => '主题';

  @override
  String get accent => '强调色';

  @override
  String get bookmarks => '书签';

  @override
  String get notes => '笔记';

  @override
  String get highlights => '高亮';

  @override
  String get ttsReading => '听书';

  @override
  String get pause => '暂停';

  @override
  String get stop => '停止';

  @override
  String get language => '语言';

  @override
  String get fontSize => '字体大小';

  @override
  String get readingProgress => '阅读进度';

  @override
  String get totalPages => '总页数';

  @override
  String get currentPage => '当前页';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '确认';

  @override
  String get delete => '删除';

  @override
  String get edit => '编辑';

  @override
  String get save => '保存';

  @override
  String get back => '返回';

  @override
  String get next => '下一页';

  @override
  String get previous => '上一页';

  @override
  String get search => '搜索';

  @override
  String get loading => '加载中...';

  @override
  String get error => '错误';

  @override
  String get readingSettings => '阅读设置';

  @override
  String get readerFont => '阅读字体';

  @override
  String get readerFontSelectionDescription =>
      '选择阅读正文的字体。EPUB 可选书籍内置、系统字体或其他已安装字体。';

  @override
  String get readerFontBookPriorityHint => '书籍有内嵌字体时优先使用，否则使用平台默认阅读字体。';

  @override
  String get readerFontOverrideHint => '覆盖出版社在书籍中内嵌的字体。';

  @override
  String get fontBookEmbedded => '书籍内置';

  @override
  String get fontSystem => '平台默认';

  @override
  String get fontSystemDescription => '使用为当前平台优化的默认阅读字体，保持字形与分页稳定。';

  @override
  String get fontSerifDescription => '沉静、有出版物气质的衬线字体，适合长时间阅读。';

  @override
  String get fontSansSerifDescription => '清晰简洁的无衬线字体，适合紧凑界面和日常阅读。';

  @override
  String get fontMonospaceDescription => '等宽字体，适合代码、技术内容和专注排版。';

  @override
  String get fontPreviewText => 'Origo X · 自由阅读，开卷有益';

  @override
  String get customFonts => '我的字体';

  @override
  String get builtInFonts => '内置字体';

  @override
  String fontVariableWeightRange(int min, int max) {
    return '可调字重 $min–$max';
  }

  @override
  String get fontStaticWeight => '固定字重（加粗为系统合成）';

  @override
  String get importFont => '导入字体';

  @override
  String get importingFont => '正在导入字体…';

  @override
  String get customFontImportUnsupported => '当前平台暂不支持持久化导入字体。';

  @override
  String get customFontUnsupportedFormat => '请选择 TTF 或 OTF 字体文件。';

  @override
  String get customFontInvalid => '该文件不是有效或受支持的字体。';

  @override
  String get customFontTooLarge => '字体文件不能超过 50 MB。';

  @override
  String get customFontReadFailed => '无法读取字体文件。';

  @override
  String get customFontLoadFailed => '无法加载该字体。';

  @override
  String get customFontStorageFailed => '无法将字体保存到当前设备。';

  @override
  String get renameFont => '重命名字体';

  @override
  String get fontFamilyLabel => '字体';

  @override
  String get fontSizeLabel => '字体大小';

  @override
  String get readerFontWeightLabel => '字体粗细';

  @override
  String get readerFontWeightLight => '较细';

  @override
  String get readerFontWeightRegular => '标准';

  @override
  String get readerFontWeightMedium => '中等';

  @override
  String get readerFontWeightSemiBold => '半粗';

  @override
  String get readerFontWeightBold => '粗';

  @override
  String readerFontWeightVariableHint(int min, int max) {
    return '阅读调节提供 300–700 五档；当前字体的真实完整范围为 $min–$max。';
  }

  @override
  String get readerFontWeightSyntheticHint =>
      '阅读调节提供 300–700 五档；当前字体未声明可变字重，由系统近似合成，效果可能因平台而异。';

  @override
  String get readerFontWeightPreview => '春风又绿江南岸 · Reading';

  @override
  String get lineSpacingLabel => '行距';

  @override
  String get letterSpacingLabel => '字间距';

  @override
  String get textAlignmentLabel => '对齐方式';

  @override
  String get textAlignmentNatural => '自然对齐';

  @override
  String get textAlignmentJustified => '两端对齐';

  @override
  String get firstLineIndentLabel => '首行缩进';

  @override
  String get paragraphSpacingLabel => '段落间距';

  @override
  String get pageTurningMode => '翻页模式';

  @override
  String get pageTurningSlide => '水平滑动';

  @override
  String get pageTurningScroll => '上下翻页';

  @override
  String get tapZoneSettings => '点击区域设置';

  @override
  String get tapZoneNextPage => '下一页';

  @override
  String get tapZonePreviousPage => '上一页';

  @override
  String get tapZoneMenu => '菜单';

  @override
  String get tapZoneNextChapter => '下一章';

  @override
  String get tapZonePreviousChapter => '上一章';

  @override
  String get tapZoneNone => '无操作';

  @override
  String get tapZoneSettingsHint => '自定义九宫格每个区域的点击动作';

  @override
  String get tapZoneChooseAction => '选择操作';

  @override
  String get tapZoneMenuRequiredHint =>
      '点击任意区域修改动作。至少保留一个菜单区域；全部移除时，中间区域会自动恢复为菜单。';

  @override
  String get tapZoneReset => '恢复默认';

  @override
  String get highlightColor => '荧光笔颜色';

  @override
  String get noteTypeHighlight => '高亮';

  @override
  String get noteTypeUnderline => '下划线';

  @override
  String get noteTypeNote => '笔记';

  @override
  String get author => '作者';

  @override
  String get progress => '进度';

  @override
  String get deleteBook => '删除书籍';

  @override
  String get readerToolbarTOC => '目录';

  @override
  String get readerAddBookmark => '添加书签';

  @override
  String get bookmarkAdded => '已添加书签';

  @override
  String get bookmarkRemoved => '已移除书签';

  @override
  String get readerNavigationTitle => '阅读导航';

  @override
  String readerNavigationPosition(int current, int total) {
    return '第 $current/$total 章';
  }

  @override
  String get readerSearchChapters => '搜索章节';

  @override
  String get readerBackToCurrentChapter => '回到当前章节';

  @override
  String get readerCurrentChapter => '当前';

  @override
  String get readerCurrentPosition => '当前位置';

  @override
  String get readerNoChapterResults => '没有找到相关章节';

  @override
  String get readerNoChapterResultsHint => '尝试使用章节标题中的其他关键词。';

  @override
  String get readerNoBookmarks => '还没有书签';

  @override
  String get readerNoBookmarksHint => '阅读时点击右上角的书签按钮，即可保存当前位置。';

  @override
  String get readerUnsupportedFormat => '该文件格式暂不支持阅读';

  @override
  String get currentChapter => '当前章节';

  @override
  String get readerPrefaceTitle => '正文前';

  @override
  String get readerModeHorizontalPage => '无动画';

  @override
  String get readerModeVerticalScrollHint => '预分页内容上下连续滑动，左右滑动切换章节';

  @override
  String get readerModeWholeBookScrollHint => '全书预分页后组成可定位的纵向列表';

  @override
  String get readerScrollByChapterTitle => '按章节滚动';

  @override
  String get readerScrollByChapterOnHint => '单章内按页上下滑动，左右滑动切换章节';

  @override
  String get readerScrollByChapterOffHint => '所有章节按页连接为可定位的纵向列表';

  @override
  String get readerModeHorizontalPageHint => '点击左侧上一页，点击右侧下一页';

  @override
  String get readerModeHorizontalSlideHint => '页面跟随手指横向移动并吸附翻页';

  @override
  String get readerModeCoverSlide => '覆盖翻页';

  @override
  String get readerModeCoverSlideHint => '当前页向左划出，底下的下一页逐渐露出';

  @override
  String get readerModePageCurl => '仿真翻页';

  @override
  String get readerModePageCurlHint => '左右拖动卷起页面，松手后完成翻页或回弹';

  @override
  String get readerTextBrightnessLabel => '文字亮度';

  @override
  String get readerDimTextInDarkModeTitle => '夜间模式降低文字亮度';

  @override
  String get readerDimTextInDarkModeHint => '夜间模式下固定使用 70% 亮度';

  @override
  String get readerHorizontalMarginLabel => '左右页边距';

  @override
  String get readerTopMarginLabel => '上页边距';

  @override
  String get readerBottomMarginLabel => '下页边距';

  @override
  String get readerTxtChapterTitlePageTitle => '章节标题独立成页';

  @override
  String get readerTxtChapterTitlePageHint => '关闭后，章节标题显示在正文开头';

  @override
  String readerChapterFallback(int number) {
    return '第 $number 章';
  }

  @override
  String readerOpenFailed(String error) {
    return '打开失败：$error';
  }

  @override
  String get readerNoContent => '书籍没有可显示的正文';

  @override
  String readerStatusPaged(
    int chapter,
    int chapterCount,
    int page,
    int pageCount,
  ) {
    return '第 $chapter/$chapterCount 章 · $page/$pageCount 页';
  }

  @override
  String get readerTopBarStyleTitle => '顶部信息';

  @override
  String get readerTopBarStyleSystem => '系统状态栏';

  @override
  String get readerTopBarStyleSystemHint => '显示系统时间、信号与电量';

  @override
  String get readerTopBarStyleReader => '阅读信息栏';

  @override
  String get readerTopBarStyleReaderHint => '显示时间、章节标题与电量';

  @override
  String get readerTopBarStyleFloating => '灵动信息栏';

  @override
  String get readerTopBarStyleFloatingHint => '在状态栏位置显示时间与电量，不占用正文空间';

  @override
  String get readerTopBarStyleHidden => '完全沉浸';

  @override
  String get readerTopBarStyleHiddenHint => '顶部不显示任何信息';

  @override
  String get readerThemeTitle => '阅读主题';

  @override
  String get readerThemeDescription => '仅改变阅读页面与阅读控制栏，不影响应用主题';

  @override
  String get readerSettingsTabTheme => '主题';

  @override
  String get readerSettingsTabText => '文字';

  @override
  String get readerSettingsTabLayout => '版式';

  @override
  String get readerSettingsTabPaging => '翻页';

  @override
  String get readerSettingsAdvancedTypography => '高级排版';

  @override
  String get readerAutoPageTurnTitle => '自动翻页';

  @override
  String get readerAutoPageTurnOff => '未开启';

  @override
  String get readerAutoPageTurnShortcutTitle => '自动翻页快捷按钮';

  @override
  String get readerAutoPageTurnShortcutHint => '随阅读控制栏显示，方便开始或暂停自动翻页';

  @override
  String get readerAutoPageTurnModeTimed => '定时翻页';

  @override
  String get readerAutoPageTurnModeSweep => '扫屏翻页';

  @override
  String get readerAutoPageTurnModeContinuous => '匀速滚动';

  @override
  String get readerAutoPageTurnModeInterval => '间隔滚动';

  @override
  String get readerAutoPageTurnTimedHint => '停留设定时间后，翻到下一页。';

  @override
  String get readerAutoPageTurnSweepHint => '分界线从上往下扫过，线上方逐渐显示下一页。';

  @override
  String get readerAutoPageTurnContinuousHint => '正文按照稳定的阅读速度持续向下滚动。';

  @override
  String get readerAutoPageTurnIntervalHint => '停留设定时间后，平滑向下滚动约一屏。';

  @override
  String get readerAutoPageTurnSweepDurationLabel => '扫屏时长';

  @override
  String get readerAutoPageTurnScrollSpeedLabel => '滚动速度';

  @override
  String readerAutoPageTurnSecondsPerScreen(int seconds) {
    return '$seconds 秒/屏';
  }

  @override
  String readerAutoPageTurnModeValue(String mode, int seconds) {
    return '$mode · $seconds 秒/屏';
  }

  @override
  String readerAutoPageTurnModePaused(String mode, int seconds) {
    return '已暂停 · $mode · $seconds 秒/屏';
  }

  @override
  String get readerAutoPageTurnIntervalLabel => '翻页间隔';

  @override
  String get readerAutoPageTurnStart => '开始自动翻页';

  @override
  String get readerAutoPageTurnResume => '继续自动翻页';

  @override
  String get readerThemeDay => '白天';

  @override
  String get readerThemeFollowSystem => '跟随系统';

  @override
  String get readerThemeMist => '晨雾';

  @override
  String get readerThemeGreen => '护眼';

  @override
  String get readerThemeRose => '豆沙';

  @override
  String get readerThemeNavy => '深蓝';

  @override
  String get readerThemeNight => '黑夜';

  @override
  String get readerThemePureBlack => '纯黑';

  @override
  String get readerThemeParchment => '牛皮纸';

  @override
  String get readerThemeCustom => '自定义';

  @override
  String get readerPullBookmarkTitle => '下拉书签';

  @override
  String get readerPullBookmarkHint => '从屏幕顶部向下拉，松手即可添加或移除当前页书签';

  @override
  String get readerPullBookmarkAddHint => '继续下拉以添加书签';

  @override
  String get readerPullBookmarkRemoveHint => '继续下拉以移除书签';

  @override
  String get readerPullBookmarkReleaseHint => '松开完成';

  @override
  String get readerTapAnimationTitle => '点击动画';

  @override
  String get readerTapAnimationHint => '左右点击时使用当前翻页模式的动画；关闭后立即刷新页面';

  @override
  String get readerTabletTwoPageTitle => '平板双页布局';

  @override
  String get readerTabletTwoPageHint => '横屏时并排显示左右两页；关闭后始终使用单页布局';

  @override
  String get readerCustomThemeReset => '重置';

  @override
  String get readerCustomThemeColors => '主题颜色';

  @override
  String get readerCustomThemeTextColor => '字体颜色';

  @override
  String get readerCustomThemeTextColorHint => '正文、标题与主要图标';

  @override
  String get readerCustomThemeBackground => '阅读背景';

  @override
  String get readerCustomThemeBackgroundHint => '纸张与阅读画布的底色';

  @override
  String get readerCustomThemeControlBar => '控制栏颜色';

  @override
  String get readerCustomThemeControlBarHint => '顶部、底部控制栏与设置面板';

  @override
  String get readerCustomThemeContrastGood => '正文与背景对比清晰，适合长时间阅读';

  @override
  String get readerCustomThemeContrastLow => '正文与背景对比较低，可能容易疲劳';

  @override
  String get readerCustomThemeSave => '保存并使用';

  @override
  String get readerCustomThemePreview => '实时预览';

  @override
  String get readerCustomThemePreviewChapter => '第一章 · 风从书页间吹过';

  @override
  String get readerCustomThemePreviewBody =>
      '这是你的阅读空间。调整字体、纸张和控制栏的颜色，让每一页都更贴近自己的阅读习惯。';

  @override
  String get readerCustomThemeHexInvalid => '请输入 6 位十六进制颜色，例如 #F6F0E4';

  @override
  String get readerCustomThemeHexLabel => '十六进制颜色';

  @override
  String get readerCustomThemeAdd => '添加主题';

  @override
  String get readerCustomThemeReorderHint => '长按右侧拖动柄调整顺序，排序会同步到阅读设置的主题列表。';

  @override
  String get readerCustomThemeUse => '使用选中的主题';

  @override
  String get readerCustomThemeDeleteTitle => '删除阅读主题？';

  @override
  String readerCustomThemeDeleteMessage(String name) {
    return '“$name”将从主题列表中删除，已保存的背景图片也会一并清理。';
  }

  @override
  String get readerCustomThemeNewTitle => '新建阅读主题';

  @override
  String get readerCustomThemeEditTitle => '编辑阅读主题';

  @override
  String get readerCustomThemeName => '主题名称';

  @override
  String get readerCustomThemeNameHint => '例如：雨夜、午后纸张';

  @override
  String get readerCustomThemeBackgroundImage => '背景图片';

  @override
  String get readerCustomThemeBackgroundImageHint =>
      '支持 JPG、PNG、WebP，图片会复制到应用存储中。';

  @override
  String get readerCustomThemeChooseImage => '上传图片';

  @override
  String get readerCustomThemeReplaceImage => '更换图片';

  @override
  String get readerCustomThemeRemoveImage => '移除图片';

  @override
  String get readerCustomThemeImageStrength => '背景图片强度';

  @override
  String get readerCustomThemeImageUnsupported => '当前平台暂不支持导入背景图片';

  @override
  String get readerCustomThemeImageTooLarge => '图片不能超过 20 MB';

  @override
  String get readerCustomThemeImageFormat => '请选择 JPG、PNG 或 WebP 图片';

  @override
  String get readerCustomThemeImageFailed => '背景图片导入失败，请重试';

  @override
  String get importUnknownTitle => '未知标题';

  @override
  String get importUnknownAuthor => '未知作者';

  @override
  String get bookUntitled => '未命名';

  @override
  String get readerAddAnnotation => '添加批注';

  @override
  String get readerAnnotationHint => '写下你对这段文字的想法…';

  @override
  String get readerAnnotationSaved => '批注已保存';

  @override
  String get readerAnnotationDeleted => '批注已删除';

  @override
  String get readerNoAnnotations => '还没有批注';

  @override
  String get readerNoAnnotationsHint => '选中文字即可高亮或添加文字批注；点击带下划线的批注文字可再次查看笔记。';

  @override
  String get readerChapterProgressTitle => '章节进度';

  @override
  String get readerChapterProgressHidden => '不显示';

  @override
  String readerChapterProgressFraction(int chapter, int total) {
    return '$chapter/$total章';
  }

  @override
  String readerChapterProgressRemaining(int count) {
    return '后续$count章';
  }
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get home => '首頁';

  @override
  String get library => '書架';

  @override
  String get settings => '設定';

  @override
  String get theme => '主題';

  @override
  String get accent => '強調色';

  @override
  String get bookmarks => '書籤';

  @override
  String get notes => '筆記';

  @override
  String get highlights => '螢光標記';

  @override
  String get ttsReading => '聽書';

  @override
  String get pause => '暫停';

  @override
  String get stop => '停止';

  @override
  String get language => '語言';

  @override
  String get fontSize => '字體大小';

  @override
  String get readingProgress => '閱讀進度';

  @override
  String get totalPages => '總頁數';

  @override
  String get currentPage => '目前頁面';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '確認';

  @override
  String get delete => '刪除';

  @override
  String get edit => '編輯';

  @override
  String get save => '儲存';

  @override
  String get back => '返回';

  @override
  String get next => '下一頁';

  @override
  String get previous => '上一頁';

  @override
  String get search => '搜尋';

  @override
  String get loading => '載入中...';

  @override
  String get error => '錯誤';

  @override
  String get readingSettings => '閱讀設定';

  @override
  String get readerFont => '閱讀字體';

  @override
  String get readerFontSelectionDescription =>
      '選擇閱讀正文的字體。EPUB 可選書籍內建、系統字體或其他已安裝字體。';

  @override
  String get readerFontBookPriorityHint => '書籍有內嵌字體時優先使用，否則使用平台預設閱讀字體。';

  @override
  String get readerFontOverrideHint => '覆蓋出版社在書籍中內嵌的字體。';

  @override
  String get fontBookEmbedded => '書籍內建';

  @override
  String get fontSystem => '平台預設';

  @override
  String get fontSystemDescription => '使用針對目前平台最佳化的預設閱讀字體，保持字形與分頁穩定。';

  @override
  String get fontSerifDescription => '沉靜、具出版物氣質的襯線字體，適合長時間閱讀。';

  @override
  String get fontSansSerifDescription => '清晰簡潔的無襯線字體，適合緊湊介面和日常閱讀。';

  @override
  String get fontMonospaceDescription => '等寬字體，適合程式碼、技術內容和專注排版。';

  @override
  String get fontPreviewText => 'Origo X · 自由閱讀，開卷有益';

  @override
  String get customFonts => '我的字體';

  @override
  String get builtInFonts => '內建字體';

  @override
  String fontVariableWeightRange(int min, int max) {
    return '可調字重 $min–$max';
  }

  @override
  String get fontStaticWeight => '固定字重（粗體由系統合成）';

  @override
  String get importFont => '匯入字體';

  @override
  String get importingFont => '正在匯入字體…';

  @override
  String get customFontImportUnsupported => '目前平台暫不支援持久化匯入字體。';

  @override
  String get customFontUnsupportedFormat => '請選擇 TTF 或 OTF 字體檔案。';

  @override
  String get customFontInvalid => '此檔案不是有效或支援的字體。';

  @override
  String get customFontTooLarge => '字體檔案不可超過 50 MB。';

  @override
  String get customFontReadFailed => '無法讀取字體檔案。';

  @override
  String get customFontLoadFailed => '無法載入此字體。';

  @override
  String get customFontStorageFailed => '無法將字體儲存到目前裝置。';

  @override
  String get renameFont => '重新命名字體';

  @override
  String get fontFamilyLabel => '字體';

  @override
  String get fontSizeLabel => '字體大小';

  @override
  String get readerFontWeightLabel => '字體粗細';

  @override
  String get readerFontWeightLight => '較細';

  @override
  String get readerFontWeightRegular => '標準';

  @override
  String get readerFontWeightMedium => '中等';

  @override
  String get readerFontWeightSemiBold => '半粗';

  @override
  String get readerFontWeightBold => '粗';

  @override
  String readerFontWeightVariableHint(int min, int max) {
    return '閱讀調整提供 300–700 五檔；目前字型的真正完整範圍為 $min–$max。';
  }

  @override
  String get readerFontWeightSyntheticHint =>
      '閱讀調整提供 300–700 五檔；目前字型未宣告可變字重，由系統近似合成，效果可能因平台而異。';

  @override
  String get readerFontWeightPreview => '春風又綠江南岸 · Reading';

  @override
  String get lineSpacingLabel => '行距';

  @override
  String get letterSpacingLabel => '字距';

  @override
  String get textAlignmentLabel => '對齊方式';

  @override
  String get textAlignmentNatural => '自然對齊';

  @override
  String get textAlignmentJustified => '左右對齊';

  @override
  String get firstLineIndentLabel => '首行縮排';

  @override
  String get paragraphSpacingLabel => '段落間距';

  @override
  String get pageTurningMode => '翻頁模式';

  @override
  String get pageTurningSlide => '水平滑動';

  @override
  String get pageTurningScroll => '上下翻頁';

  @override
  String get tapZoneSettings => '點擊區域設定';

  @override
  String get tapZoneNextPage => '下一頁';

  @override
  String get tapZonePreviousPage => '上一頁';

  @override
  String get tapZoneMenu => '選單';

  @override
  String get tapZoneNextChapter => '下一章';

  @override
  String get tapZonePreviousChapter => '上一章';

  @override
  String get tapZoneNone => '無操作';

  @override
  String get tapZoneSettingsHint => '自訂九宮格每個區域的點擊動作';

  @override
  String get tapZoneChooseAction => '選擇操作';

  @override
  String get tapZoneMenuRequiredHint =>
      '點擊任意區域修改動作。至少保留一個選單區域；全部移除時，中間區域會自動恢復為選單。';

  @override
  String get tapZoneReset => '恢復預設';

  @override
  String get highlightColor => '螢光筆顏色';

  @override
  String get noteTypeHighlight => '螢光標記';

  @override
  String get noteTypeUnderline => '底線';

  @override
  String get noteTypeNote => '筆記';

  @override
  String get author => '作者';

  @override
  String get progress => '進度';

  @override
  String get deleteBook => '刪除書籍';

  @override
  String get readerToolbarTOC => '目錄';

  @override
  String get readerAddBookmark => '新增書籤';

  @override
  String get bookmarkAdded => '已新增書籤';

  @override
  String get bookmarkRemoved => '已移除書籤';

  @override
  String get readerNavigationTitle => '閱讀導覽';

  @override
  String readerNavigationPosition(int current, int total) {
    return '第 $current/$total 章';
  }

  @override
  String get readerSearchChapters => '搜尋章節';

  @override
  String get readerBackToCurrentChapter => '回到目前章節';

  @override
  String get readerCurrentChapter => '目前';

  @override
  String get readerCurrentPosition => '目前位置';

  @override
  String get readerNoChapterResults => '找不到相關章節';

  @override
  String get readerNoChapterResultsHint => '請嘗試章節標題中的其他關鍵字。';

  @override
  String get readerNoBookmarks => '還沒有書籤';

  @override
  String get readerNoBookmarksHint => '閱讀時點擊右上角的書籤按鈕，即可儲存目前位置。';

  @override
  String get readerUnsupportedFormat => '該檔案格式暫不支援閱讀';

  @override
  String get currentChapter => '目前章節';

  @override
  String get readerPrefaceTitle => '內文前';

  @override
  String get readerModeHorizontalPage => '無動畫';

  @override
  String get readerModeVerticalScrollHint => '預先分頁後上下連續滑動，左右滑動切換章節';

  @override
  String get readerModeWholeBookScrollHint => '全書預先分頁後組成可定位的縱向列表';

  @override
  String get readerScrollByChapterTitle => '按章節捲動';

  @override
  String get readerScrollByChapterOnHint => '單章內按頁上下滑動，左右滑動切換章節';

  @override
  String get readerScrollByChapterOffHint => '所有章節按頁連接為可定位的縱向列表';

  @override
  String get readerModeHorizontalPageHint => '點擊左側上一頁，點擊右側下一頁';

  @override
  String get readerModeHorizontalSlideHint => '頁面跟隨手指橫向移動並吸附翻頁';

  @override
  String get readerModeCoverSlide => '覆蓋翻頁';

  @override
  String get readerModeCoverSlideHint => '目前頁面向左滑出，底下的下一頁逐漸露出';

  @override
  String get readerModePageCurl => '仿真翻頁';

  @override
  String get readerModePageCurlHint => '左右拖動捲起頁面，放開後完成翻頁或回彈';

  @override
  String get readerTextBrightnessLabel => '文字亮度';

  @override
  String get readerDimTextInDarkModeTitle => '夜間模式降低文字亮度';

  @override
  String get readerDimTextInDarkModeHint => '夜間模式下固定使用 70% 亮度';

  @override
  String get readerHorizontalMarginLabel => '左右頁邊距';

  @override
  String get readerTopMarginLabel => '上頁邊距';

  @override
  String get readerBottomMarginLabel => '下頁邊距';

  @override
  String get readerTxtChapterTitlePageTitle => '章節標題獨立成頁';

  @override
  String get readerTxtChapterTitlePageHint => '關閉後，章節標題顯示在正文開頭';

  @override
  String readerChapterFallback(int number) {
    return '第 $number 章';
  }

  @override
  String readerOpenFailed(String error) {
    return '開啟失敗：$error';
  }

  @override
  String get readerNoContent => '書籍沒有可顯示的內文';

  @override
  String readerStatusPaged(
    int chapter,
    int chapterCount,
    int page,
    int pageCount,
  ) {
    return '第 $chapter/$chapterCount 章 · $page/$pageCount 頁';
  }

  @override
  String get readerTopBarStyleTitle => '頂部資訊';

  @override
  String get readerTopBarStyleSystem => '系統狀態列';

  @override
  String get readerTopBarStyleSystemHint => '顯示系統時間、訊號與電量';

  @override
  String get readerTopBarStyleReader => '閱讀資訊列';

  @override
  String get readerTopBarStyleReaderHint => '顯示時間、章節標題與電量';

  @override
  String get readerTopBarStyleFloating => '靈動資訊列';

  @override
  String get readerTopBarStyleFloatingHint => '在狀態列位置顯示時間與電量，不佔用內文空間';

  @override
  String get readerTopBarStyleHidden => '完全沉浸';

  @override
  String get readerTopBarStyleHiddenHint => '頂部不顯示任何資訊';

  @override
  String get readerThemeTitle => '閱讀主題';

  @override
  String get readerThemeDescription => '僅改變閱讀頁面與閱讀控制列，不影響應用程式主題';

  @override
  String get readerSettingsTabTheme => '主題';

  @override
  String get readerSettingsTabText => '文字';

  @override
  String get readerSettingsTabLayout => '版式';

  @override
  String get readerSettingsTabPaging => '翻頁';

  @override
  String get readerSettingsAdvancedTypography => '進階排版';

  @override
  String get readerAutoPageTurnTitle => '自動翻頁';

  @override
  String get readerAutoPageTurnOff => '未開啟';

  @override
  String get readerAutoPageTurnShortcutTitle => '自動翻頁快捷按鈕';

  @override
  String get readerAutoPageTurnShortcutHint => '隨閱讀控制列顯示，方便開始或暫停自動翻頁';

  @override
  String get readerAutoPageTurnModeTimed => '定時翻頁';

  @override
  String get readerAutoPageTurnModeSweep => '掃屏翻頁';

  @override
  String get readerAutoPageTurnModeContinuous => '勻速捲動';

  @override
  String get readerAutoPageTurnModeInterval => '間隔捲動';

  @override
  String get readerAutoPageTurnTimedHint => '停留設定時間後，翻到下一頁。';

  @override
  String get readerAutoPageTurnSweepHint => '分界線從上往下掃過，線上方逐漸顯示下一頁。';

  @override
  String get readerAutoPageTurnContinuousHint => '正文按照穩定的閱讀速度持續向下捲動。';

  @override
  String get readerAutoPageTurnIntervalHint => '停留設定時間後，平滑向下捲動約一屏。';

  @override
  String get readerAutoPageTurnSweepDurationLabel => '掃屏時長';

  @override
  String get readerAutoPageTurnScrollSpeedLabel => '捲動速度';

  @override
  String readerAutoPageTurnSecondsPerScreen(int seconds) {
    return '$seconds 秒/屏';
  }

  @override
  String readerAutoPageTurnModeValue(String mode, int seconds) {
    return '$mode · $seconds 秒/屏';
  }

  @override
  String readerAutoPageTurnModePaused(String mode, int seconds) {
    return '已暫停 · $mode · $seconds 秒/屏';
  }

  @override
  String get readerAutoPageTurnIntervalLabel => '翻頁間隔';

  @override
  String get readerAutoPageTurnStart => '開始自動翻頁';

  @override
  String get readerAutoPageTurnResume => '繼續自動翻頁';

  @override
  String get readerThemeDay => '白天';

  @override
  String get readerThemeFollowSystem => '跟隨系統';

  @override
  String get readerThemeMist => '晨霧';

  @override
  String get readerThemeGreen => '護眼';

  @override
  String get readerThemeRose => '豆沙';

  @override
  String get readerThemeNavy => '深藍';

  @override
  String get readerThemeNight => '黑夜';

  @override
  String get readerThemePureBlack => '純黑';

  @override
  String get readerThemeParchment => '牛皮紙';

  @override
  String get readerThemeCustom => '自訂';

  @override
  String get readerPullBookmarkTitle => '下拉書籤';

  @override
  String get readerPullBookmarkHint => '從螢幕頂部向下拉，放開即可加入或移除目前頁書籤';

  @override
  String get readerPullBookmarkAddHint => '繼續下拉以加入書籤';

  @override
  String get readerPullBookmarkRemoveHint => '繼續下拉以移除書籤';

  @override
  String get readerPullBookmarkReleaseHint => '放開完成';

  @override
  String get readerTapAnimationTitle => '點擊動畫';

  @override
  String get readerTapAnimationHint => '左右點擊時使用目前翻頁模式的動畫；關閉後立即刷新頁面';

  @override
  String get readerTabletTwoPageTitle => '平板雙頁版面';

  @override
  String get readerTabletTwoPageHint => '橫向時並排顯示左右兩頁；關閉後一律使用單頁版面';

  @override
  String get readerCustomThemeReset => '重設';

  @override
  String get readerCustomThemeColors => '主題顏色';

  @override
  String get readerCustomThemeTextColor => '字體顏色';

  @override
  String get readerCustomThemeTextColorHint => '正文、標題與主要圖示';

  @override
  String get readerCustomThemeBackground => '閱讀背景';

  @override
  String get readerCustomThemeBackgroundHint => '紙張與閱讀畫布的底色';

  @override
  String get readerCustomThemeControlBar => '控制列顏色';

  @override
  String get readerCustomThemeControlBarHint => '頂部、底部控制列與設定面板';

  @override
  String get readerCustomThemeContrastGood => '正文與背景對比清晰，適合長時間閱讀';

  @override
  String get readerCustomThemeContrastLow => '正文與背景對比較低，可能容易疲勞';

  @override
  String get readerCustomThemeSave => '儲存並使用';

  @override
  String get readerCustomThemePreview => '即時預覽';

  @override
  String get readerCustomThemePreviewChapter => '第一章 · 風從書頁間吹過';

  @override
  String get readerCustomThemePreviewBody =>
      '這是你的閱讀空間。調整字體、紙張和控制列的顏色，讓每一頁都更貼近自己的閱讀習慣。';

  @override
  String get readerCustomThemeHexInvalid => '請輸入 6 位十六進位顏色，例如 #F6F0E4';

  @override
  String get readerCustomThemeHexLabel => '十六進位顏色';

  @override
  String get readerCustomThemeAdd => '新增主題';

  @override
  String get readerCustomThemeReorderHint => '長按右側拖曳柄調整順序，排序會同步到閱讀設定的主題列表。';

  @override
  String get readerCustomThemeUse => '使用選取的主題';

  @override
  String get readerCustomThemeDeleteTitle => '刪除閱讀主題？';

  @override
  String readerCustomThemeDeleteMessage(String name) {
    return '「$name」將從主題列表中刪除，已儲存的背景圖片也會一併清理。';
  }

  @override
  String get readerCustomThemeNewTitle => '新增閱讀主題';

  @override
  String get readerCustomThemeEditTitle => '編輯閱讀主題';

  @override
  String get readerCustomThemeName => '主題名稱';

  @override
  String get readerCustomThemeNameHint => '例如：雨夜、午後紙張';

  @override
  String get readerCustomThemeBackgroundImage => '背景圖片';

  @override
  String get readerCustomThemeBackgroundImageHint =>
      '支援 JPG、PNG、WebP，圖片會複製到應用程式儲存空間。';

  @override
  String get readerCustomThemeChooseImage => '上傳圖片';

  @override
  String get readerCustomThemeReplaceImage => '更換圖片';

  @override
  String get readerCustomThemeRemoveImage => '移除圖片';

  @override
  String get readerCustomThemeImageStrength => '背景圖片強度';

  @override
  String get readerCustomThemeImageUnsupported => '目前平台暫不支援匯入背景圖片';

  @override
  String get readerCustomThemeImageTooLarge => '圖片不能超過 20 MB';

  @override
  String get readerCustomThemeImageFormat => '請選擇 JPG、PNG 或 WebP 圖片';

  @override
  String get readerCustomThemeImageFailed => '背景圖片匯入失敗，請再試一次';

  @override
  String get importUnknownTitle => '不明標題';

  @override
  String get importUnknownAuthor => '不明作者';

  @override
  String get bookUntitled => '未命名';

  @override
  String get readerAddAnnotation => '新增批註';

  @override
  String get readerAnnotationHint => '寫下你對這段文字的想法…';

  @override
  String get readerAnnotationSaved => '批註已儲存';

  @override
  String get readerAnnotationDeleted => '批註已刪除';

  @override
  String get readerNoAnnotations => '還沒有批註';

  @override
  String get readerNoAnnotationsHint => '選取文字即可高亮或新增文字批註；點擊帶底線的批註文字可再次查看筆記。';

  @override
  String get readerChapterProgressTitle => '章節進度';

  @override
  String get readerChapterProgressHidden => '不顯示';

  @override
  String readerChapterProgressFraction(int chapter, int total) {
    return '$chapter/$total章';
  }

  @override
  String readerChapterProgressRemaining(int count) {
    return '後續$count章';
  }
}
