// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get home => 'ホーム';

  @override
  String get library => '本棚';

  @override
  String get settings => '設定';

  @override
  String get theme => 'テーマ';

  @override
  String get accent => 'アクセントカラー';

  @override
  String get bookmarks => 'ブックマーク';

  @override
  String get notes => 'メモ';

  @override
  String get highlights => 'ハイライト';

  @override
  String get ttsReading => '読み上げ';

  @override
  String get pause => '一時停止';

  @override
  String get stop => '停止';

  @override
  String get language => '言語';

  @override
  String get fontSize => '文字サイズ';

  @override
  String get readingProgress => '読書の進捗';

  @override
  String get totalPages => '総ページ数';

  @override
  String get currentPage => '現在のページ';

  @override
  String get cancel => 'キャンセル';

  @override
  String get confirm => '確認';

  @override
  String get delete => '削除';

  @override
  String get edit => '編集';

  @override
  String get save => '保存';

  @override
  String get back => '戻る';

  @override
  String get next => '次のページ';

  @override
  String get previous => '前のページ';

  @override
  String get search => '検索';

  @override
  String get loading => '読み込み中...';

  @override
  String get error => 'エラー';

  @override
  String get readingSettings => '読書設定';

  @override
  String get readerFont => '読書フォント';

  @override
  String get readerFontSelectionDescription =>
      '読書用フォントを選択します。EPUB では書籍内蔵、システム、インストール済みのフォントを選べます。';

  @override
  String get readerFontBookPriorityHint =>
      '埋め込みフォントがあれば優先し、なければプラットフォーム標準の読書フォントを使います。';

  @override
  String get readerFontOverrideHint => '出版社が書籍に埋め込んだフォントより優先します。';

  @override
  String get fontBookEmbedded => '書籍内蔵';

  @override
  String get fontSystem => 'プラットフォーム標準';

  @override
  String get fontSystemDescription =>
      '現在のプラットフォーム向けに最適化した標準読書フォントを使用し、字形とページ分割を安定させます。';

  @override
  String get fontSerifDescription => '落ち着いた出版物らしいセリフ体で、長時間の読書に適しています。';

  @override
  String get fontSansSerifDescription => '明瞭なサンセリフ体で、コンパクトな画面と日常の読書に適しています。';

  @override
  String get fontMonospaceDescription => 'コードや技術文書、集中しやすい組版に適した等幅フォントです。';

  @override
  String get fontPreviewText => 'Origo X · 自由に読む 開卷有益';

  @override
  String get customFonts => 'マイフォント';

  @override
  String get builtInFonts => '内蔵フォント';

  @override
  String fontVariableWeightRange(int min, int max) {
    return '可変ウェイト $min–$max';
  }

  @override
  String get fontStaticWeight => '固定ウェイト（太字はシステム合成）';

  @override
  String get importFont => 'フォントをインポート';

  @override
  String get importingFont => 'フォントをインポート中…';

  @override
  String get customFontImportUnsupported =>
      'このプラットフォームではフォントの永続インポートにまだ対応していません。';

  @override
  String get customFontUnsupportedFormat => 'TTF または OTF ファイルを選択してください。';

  @override
  String get customFontInvalid => '有効または対応しているフォントファイルではありません。';

  @override
  String get customFontTooLarge => 'フォントファイルは 50 MB 以下にしてください。';

  @override
  String get customFontReadFailed => 'フォントファイルを読み取れませんでした。';

  @override
  String get customFontLoadFailed => 'フォントを読み込めませんでした。';

  @override
  String get customFontStorageFailed => 'フォントをこの端末に保存できませんでした。';

  @override
  String get renameFont => 'フォント名を変更';

  @override
  String get fontFamilyLabel => 'フォント';

  @override
  String get fontSizeLabel => '文字サイズ';

  @override
  String get readerFontWeightLabel => '文字の太さ';

  @override
  String get readerFontWeightLight => '細め';

  @override
  String get readerFontWeightRegular => '標準';

  @override
  String get readerFontWeightMedium => '中間';

  @override
  String get readerFontWeightSemiBold => 'やや太め';

  @override
  String get readerFontWeightBold => '太字';

  @override
  String readerFontWeightVariableHint(int min, int max) {
    return '読書用には 300–700 の5段階を使用します。現在のフォントの実際の全範囲は $min–$max です。';
  }

  @override
  String get readerFontWeightSyntheticHint =>
      '読書用には 300–700 の5段階を使用します。現在のフォントは可変ウェイトを宣言していないため、システムによる近似結果はプラットフォームごとに異なる場合があります。';

  @override
  String get readerFontWeightPreview => '静かなページを、もう少し先へ · Reading';

  @override
  String get lineSpacingLabel => '行間';

  @override
  String get letterSpacingLabel => '字間';

  @override
  String get textAlignmentLabel => '文字揃え';

  @override
  String get textAlignmentNatural => '自然';

  @override
  String get textAlignmentJustified => '両端揃え';

  @override
  String get firstLineIndentLabel => '字下げ';

  @override
  String get paragraphSpacingLabel => '段落間隔';

  @override
  String get pageTurningMode => 'ページめくり';

  @override
  String get pageTurningSlide => '横スライド';

  @override
  String get pageTurningScroll => '縦ページ送り';

  @override
  String get tapZoneSettings => 'タップ領域';

  @override
  String get tapZoneNextPage => '次のページ';

  @override
  String get tapZonePreviousPage => '前のページ';

  @override
  String get tapZoneMenu => 'メニュー';

  @override
  String get tapZoneNextChapter => '次の章';

  @override
  String get tapZonePreviousChapter => '前の章';

  @override
  String get tapZoneNone => '操作なし';

  @override
  String get tapZoneSettingsHint => '9分割エリアそれぞれのタップ動作をカスタマイズ';

  @override
  String get tapZoneChooseAction => '操作を選択';

  @override
  String get tapZoneMenuRequiredHint =>
      'エリアをタップして動作を変更します。メニューは少なくとも1つ必要です。すべて外すと中央が自動的にメニューへ戻ります。';

  @override
  String get tapZoneReset => '既定に戻す';

  @override
  String get highlightColor => 'マーカーの色';

  @override
  String get noteTypeHighlight => 'ハイライト';

  @override
  String get noteTypeUnderline => '下線';

  @override
  String get noteTypeNote => 'メモ';

  @override
  String get author => '著者';

  @override
  String get progress => '進捗';

  @override
  String get deleteBook => '書籍を削除';

  @override
  String get readerToolbarTOC => '目次';

  @override
  String get readerAddBookmark => 'ブックマークを追加';

  @override
  String get bookmarkAdded => 'ブックマークを追加しました';

  @override
  String get bookmarkRemoved => 'ブックマークを削除しました';

  @override
  String get readerNavigationTitle => '読書ナビゲーション';

  @override
  String readerNavigationPosition(int current, int total) {
    return '第 $current/$total 章';
  }

  @override
  String get readerSearchChapters => '章を検索';

  @override
  String get readerBackToCurrentChapter => '現在の章に戻る';

  @override
  String get readerCurrentChapter => '現在';

  @override
  String get readerCurrentPosition => '現在位置';

  @override
  String get readerNoChapterResults => '一致する章がありません';

  @override
  String get readerNoChapterResultsHint => '章タイトルの別のキーワードを試してください。';

  @override
  String get readerNoBookmarks => 'ブックマークはまだありません';

  @override
  String get readerNoBookmarksHint => '右上のブックマークボタンをタップして現在位置を保存できます。';

  @override
  String get readerUnsupportedFormat => 'この形式はまだ読書に対応していません';

  @override
  String get currentChapter => '現在の章';

  @override
  String get readerPrefaceTitle => '前付';

  @override
  String get readerModeHorizontalPage => 'アニメーションなし';

  @override
  String get readerModeVerticalScrollHint => '事前に分割したページを縦に送り、左右スワイプで章を切り替え';

  @override
  String get readerModeWholeBookScrollHint => '事前に分割した全章を位置指定できる縦リストで表示';

  @override
  String get readerScrollByChapterTitle => '章ごとにスクロール';

  @override
  String get readerScrollByChapterOnHint => '章内をページ単位で縦に送り、左右スワイプで章を切り替え';

  @override
  String get readerScrollByChapterOffHint => '全章をページ単位でつないだ位置指定可能な縦リストで表示';

  @override
  String get readerModeHorizontalPageHint => '左側タップで前のページ、右側タップで次のページ';

  @override
  String get readerModeHorizontalSlideHint => 'ページが指に追従して横に動き、離すと吸着します';

  @override
  String get readerModeCoverSlide => 'カバー';

  @override
  String get readerModeCoverSlideHint => '現在のページが左へスライドし、下にある次のページが現れます';

  @override
  String get readerModePageCurl => 'ページカール';

  @override
  String get readerModePageCurlHint => '左右にドラッグしてページをめくり、離すと完了または戻ります';

  @override
  String get readerTextBrightnessLabel => '文字の明るさ';

  @override
  String get readerDimTextInDarkModeTitle => 'ダークモードで文字を暗くする';

  @override
  String get readerDimTextInDarkModeHint => 'ダークモードでは明るさを70%に固定します';

  @override
  String get readerHorizontalMarginLabel => '左右余白';

  @override
  String get readerTopMarginLabel => '上余白';

  @override
  String get readerBottomMarginLabel => '下余白';

  @override
  String get readerTxtChapterTitlePageTitle => '章タイトルを独立ページに表示';

  @override
  String get readerTxtChapterTitlePageHint => 'オフにすると、章タイトルは本文の先頭に表示されます';

  @override
  String readerChapterFallback(int number) {
    return '第 $number 章';
  }

  @override
  String readerOpenFailed(String error) {
    return '開けませんでした：$error';
  }

  @override
  String get readerNoContent => 'この本には表示できる本文がありません';

  @override
  String readerStatusPaged(
    int chapter,
    int chapterCount,
    int page,
    int pageCount,
  ) {
    return '第 $chapter/$chapterCount 章 · $page/$pageCount ページ';
  }

  @override
  String get readerTopBarStyleTitle => '上部の情報表示';

  @override
  String get readerTopBarStyleSystem => 'システムステータスバー';

  @override
  String get readerTopBarStyleSystemHint => 'システムの時刻、通信状態、電池残量を表示します';

  @override
  String get readerTopBarStyleReader => 'リーダー情報バー';

  @override
  String get readerTopBarStyleReaderHint => '時刻、章タイトル、電池残量を表示します';

  @override
  String get readerTopBarStyleFloating => 'フローティング情報バー';

  @override
  String get readerTopBarStyleFloatingHint =>
      'ステータスバーの位置に時刻と電池残量を表示し、本文の領域を占有しません';

  @override
  String get readerTopBarStyleHidden => '完全没入';

  @override
  String get readerTopBarStyleHiddenHint => '上部には何も表示しません';

  @override
  String get readerThemeTitle => '読書テーマ';

  @override
  String get readerThemeDescription => '読書画面と読書コントロールだけを変更します';

  @override
  String get readerSettingsTabTheme => 'テーマ';

  @override
  String get readerSettingsTabText => '文字';

  @override
  String get readerSettingsTabLayout => '版面';

  @override
  String get readerSettingsTabPaging => 'めくり';

  @override
  String get readerSettingsAdvancedTypography => '詳細な組版';

  @override
  String get readerAutoPageTurnTitle => '自動ページめくり';

  @override
  String get readerAutoPageTurnOff => '未開始';

  @override
  String get readerAutoPageTurnShortcutTitle => '自動読書ショートカット';

  @override
  String get readerAutoPageTurnShortcutHint => '読書コントロールと一緒に表示し、すぐに開始・一時停止できます';

  @override
  String get readerAutoPageTurnModeTimed => 'タイマーめくり';

  @override
  String get readerAutoPageTurnModeSweep => 'スイープめくり';

  @override
  String get readerAutoPageTurnModeContinuous => '連続スクロール';

  @override
  String get readerAutoPageTurnModeInterval => '間隔スクロール';

  @override
  String get readerAutoPageTurnTimedHint => '設定した間隔で次のページへ進みます。';

  @override
  String get readerAutoPageTurnSweepHint => '境界線が下へ移動し、その上に次のページを徐々に表示します。';

  @override
  String get readerAutoPageTurnContinuousHint => '一定の読書速度で本文を連続して下へスクロールします。';

  @override
  String get readerAutoPageTurnIntervalHint => '設定した間隔で約1画面分を滑らかにスクロールします。';

  @override
  String get readerAutoPageTurnSweepDurationLabel => 'スイープ時間';

  @override
  String get readerAutoPageTurnScrollSpeedLabel => 'スクロール速度';

  @override
  String readerAutoPageTurnSecondsPerScreen(int seconds) {
    return '1画面 $seconds秒';
  }

  @override
  String readerAutoPageTurnModeValue(String mode, int seconds) {
    return '$mode · 1画面$seconds秒';
  }

  @override
  String readerAutoPageTurnModePaused(String mode, int seconds) {
    return '一時停止 · $mode · 1画面$seconds秒';
  }

  @override
  String get readerAutoPageTurnIntervalLabel => 'ページ間隔';

  @override
  String get readerAutoPageTurnStart => '自動ページめくりを開始';

  @override
  String get readerAutoPageTurnResume => '自動ページめくりを再開';

  @override
  String get readerThemeDay => '昼';

  @override
  String get readerThemeFollowSystem => 'システムに合わせる';

  @override
  String get readerThemeMist => 'ミスト';

  @override
  String get readerThemeGreen => 'アイケア';

  @override
  String get readerThemeRose => 'ローズ';

  @override
  String get readerThemeNavy => 'ディープブルー';

  @override
  String get readerThemeNight => '夜';

  @override
  String get readerThemePureBlack => 'ピュアブラック';

  @override
  String get readerThemeParchment => '羊皮紙';

  @override
  String get readerThemeCustom => 'カスタム';

  @override
  String get readerPullBookmarkTitle => 'プルダウンしおり';

  @override
  String get readerPullBookmarkHint => '画面上端から下へ引き、離すと現在のページのしおりを追加または削除します';

  @override
  String get readerPullBookmarkAddHint => 'さらに引いてしおりを追加';

  @override
  String get readerPullBookmarkRemoveHint => 'さらに引いてしおりを削除';

  @override
  String get readerPullBookmarkReleaseHint => '離して完了';

  @override
  String get readerTapAnimationTitle => 'タップアニメーション';

  @override
  String get readerTapAnimationHint =>
      '左右のタップで現在のページめくりアニメーションを使用。オフでは即時に切り替えます';

  @override
  String get readerTabletTwoPageTitle => 'タブレットの見開き表示';

  @override
  String get readerTabletTwoPageHint =>
      '横向きでは左右2ページを並べて表示します。オフにすると常に1ページ表示になります';

  @override
  String get readerCustomThemeReset => 'リセット';

  @override
  String get readerCustomThemeColors => 'テーマカラー';

  @override
  String get readerCustomThemeTextColor => '文字色';

  @override
  String get readerCustomThemeTextColorHint => '本文、見出し、主要アイコン';

  @override
  String get readerCustomThemeBackground => '読書背景';

  @override
  String get readerCustomThemeBackgroundHint => '紙面と読書キャンバスの色';

  @override
  String get readerCustomThemeControlBar => 'コントロールバーの色';

  @override
  String get readerCustomThemeControlBarHint => '上下の操作バーと設定パネル';

  @override
  String get readerCustomThemeContrastGood => '本文と背景のコントラストは長時間の読書に適しています';

  @override
  String get readerCustomThemeContrastLow => '本文のコントラストが低く、目が疲れやすい可能性があります';

  @override
  String get readerCustomThemeSave => '保存して使用';

  @override
  String get readerCustomThemePreview => 'ライブプレビュー';

  @override
  String get readerCustomThemePreviewChapter => '第一章 · ページの間を吹く風';

  @override
  String get readerCustomThemePreviewBody =>
      'ここはあなたの読書空間です。文字、紙面、操作バーの色を整え、自分らしい一ページに仕上げましょう。';

  @override
  String get readerCustomThemeHexInvalid => '#F6F0E4 のような6桁の16進カラーを入力してください';

  @override
  String get readerCustomThemeHexLabel => '16進カラー';

  @override
  String get readerCustomThemeAdd => 'テーマを追加';

  @override
  String get readerCustomThemeReorderHint =>
      '右側のハンドルを長押しして並べ替えます。順序は読書設定にも反映されます。';

  @override
  String get readerCustomThemeUse => '選択したテーマを使用';

  @override
  String get readerCustomThemeDeleteTitle => '読書テーマを削除しますか？';

  @override
  String readerCustomThemeDeleteMessage(String name) {
    return '「$name」をテーマ一覧から削除し、保存された背景画像も消去します。';
  }

  @override
  String get readerCustomThemeNewTitle => '読書テーマを作成';

  @override
  String get readerCustomThemeEditTitle => '読書テーマを編集';

  @override
  String get readerCustomThemeName => 'テーマ名';

  @override
  String get readerCustomThemeNameHint => '例：雨の夜、午後の紙';

  @override
  String get readerCustomThemeBackgroundImage => '背景画像';

  @override
  String get readerCustomThemeBackgroundImageHint =>
      'JPG、PNG、WebP に対応。画像はアプリの保存領域にコピーされます。';

  @override
  String get readerCustomThemeChooseImage => '画像をアップロード';

  @override
  String get readerCustomThemeReplaceImage => '画像を変更';

  @override
  String get readerCustomThemeRemoveImage => '画像を削除';

  @override
  String get readerCustomThemeImageStrength => '背景画像の濃さ';

  @override
  String get readerCustomThemeImageUnsupported => 'このプラットフォームでは背景画像を読み込めません';

  @override
  String get readerCustomThemeImageTooLarge => '画像は 20 MB 以下にしてください';

  @override
  String get readerCustomThemeImageFormat => 'JPG、PNG、WebP の画像を選択してください';

  @override
  String get readerCustomThemeImageFailed => '背景画像を読み込めませんでした。もう一度お試しください。';

  @override
  String get importUnknownTitle => '不明なタイトル';

  @override
  String get importUnknownAuthor => '不明な著者';

  @override
  String get bookUntitled => '無題';

  @override
  String get readerAddAnnotation => '注釈を追加';

  @override
  String get readerAnnotationHint => 'この文章について考えたことを書いてください…';

  @override
  String get readerAnnotationSaved => '注釈を保存しました';

  @override
  String get readerAnnotationDeleted => '注釈を削除しました';

  @override
  String get readerNoAnnotations => '注釈はまだありません';

  @override
  String get readerNoAnnotationsHint =>
      '文章を選択してハイライトやコメントを追加できます。下線付きのコメントをタップすると内容を確認できます。';

  @override
  String get readerChapterProgressTitle => '章の進捗';

  @override
  String get readerChapterProgressHidden => '表示しない';

  @override
  String readerChapterProgressFraction(int chapter, int total) {
    return '$chapter/$total章';
  }

  @override
  String readerChapterProgressRemaining(int count) {
    return '残り$count章';
  }
}
