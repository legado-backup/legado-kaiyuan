// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get home => 'Início';

  @override
  String get library => 'Estante';

  @override
  String get settings => 'Configurações';

  @override
  String get theme => 'Tema';

  @override
  String get accent => 'Cor de destaque';

  @override
  String get bookmarks => 'Marcadores';

  @override
  String get notes => 'Notas';

  @override
  String get highlights => 'Destaques';

  @override
  String get ttsReading => 'Texto para fala';

  @override
  String get pause => 'Pausar';

  @override
  String get stop => 'Parar';

  @override
  String get language => 'Idioma';

  @override
  String get fontSize => 'Tamanho da fonte';

  @override
  String get readingProgress => 'Progresso de leitura';

  @override
  String get totalPages => 'Total de páginas';

  @override
  String get currentPage => 'Página atual';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get delete => 'Excluir';

  @override
  String get edit => 'Editar';

  @override
  String get save => 'Salvar';

  @override
  String get back => 'Voltar';

  @override
  String get next => 'Avançar';

  @override
  String get previous => 'Anterior';

  @override
  String get search => 'Pesquisar';

  @override
  String get loading => 'Carregando...';

  @override
  String get error => 'Erro';

  @override
  String get readingSettings => 'Configurações de leitura';

  @override
  String get readerFont => 'Fonte de leitura';

  @override
  String get readerFontSelectionDescription =>
      'Escolha a fonte de leitura. EPUB oferece a fonte do livro, a do sistema e as fontes instaladas.';

  @override
  String get readerFontBookPriorityHint =>
      'Usa a fonte incorporada do livro quando disponível; caso contrário, usa a fonte de leitura padrão da plataforma.';

  @override
  String get readerFontOverrideHint =>
      'Substitui as fontes incorporadas pelo editor.';

  @override
  String get fontBookEmbedded => 'Incorporada no livro';

  @override
  String get fontSystem => 'Padrão da plataforma';

  @override
  String get fontSystemDescription =>
      'Usa uma fonte de leitura otimizada para a plataforma, com glifos e paginação estáveis.';

  @override
  String get fontSerifDescription =>
      'Tipografia serifada com caráter calmo e editorial para leitura prolongada.';

  @override
  String get fontSansSerifDescription =>
      'Tipografia sem serifa clara, ideal para interfaces compactas e leitura cotidiana.';

  @override
  String get fontMonospaceDescription =>
      'Tipografia monoespaçada, adequada para código, material técnico e layouts focados.';

  @override
  String get fontPreviewText => 'Origo X · Read freely 开卷有益';

  @override
  String get customFonts => 'Minhas fontes';

  @override
  String get builtInFonts => 'Fontes integradas';

  @override
  String fontVariableWeightRange(int min, int max) {
    return 'Peso ajustável $min–$max';
  }

  @override
  String get fontStaticWeight => 'Peso fixo (negrito é sintetizado)';

  @override
  String get importFont => 'Importar fonte';

  @override
  String get importingFont => 'Importando fonte…';

  @override
  String get customFontImportUnsupported =>
      'A importação permanente de fontes ainda não é suportada nesta plataforma.';

  @override
  String get customFontUnsupportedFormat =>
      'Escolha um arquivo de fonte TTF ou OTF.';

  @override
  String get customFontInvalid =>
      'Este arquivo não é uma fonte válida ou suportada.';

  @override
  String get customFontTooLarge => 'O arquivo de fonte tem mais de 50 MB.';

  @override
  String get customFontReadFailed => 'Não foi possível ler o arquivo de fonte.';

  @override
  String get customFontLoadFailed => 'Não foi possível carregar a fonte.';

  @override
  String get customFontStorageFailed =>
      'Não foi possível salvar a fonte neste dispositivo.';

  @override
  String get renameFont => 'Renomear fonte';

  @override
  String get fontFamilyLabel => 'Fonte';

  @override
  String get fontSizeLabel => 'Tamanho da fonte';

  @override
  String get readerFontWeightLabel => 'Peso da fonte';

  @override
  String get readerFontWeightLight => 'Leve';

  @override
  String get readerFontWeightRegular => 'Normal';

  @override
  String get readerFontWeightMedium => 'Médio';

  @override
  String get readerFontWeightSemiBold => 'Seminegrito';

  @override
  String get readerFontWeightBold => 'Negrito';

  @override
  String readerFontWeightVariableHint(int min, int max) {
    return 'Os controles de leitura usam cinco níveis legíveis entre 300–700. O intervalo completo real desta fonte é $min–$max.';
  }

  @override
  String get readerFontWeightSyntheticHint =>
      'Os controles de leitura usam cinco níveis entre 300–700. Esta fonte não declara um eixo de peso variável, então o sistema aproxima o resultado, que pode variar por plataforma.';

  @override
  String get readerFontWeightPreview =>
      'Uma página silenciosa leva mais longe · 字里行间';

  @override
  String get lineSpacingLabel => 'Espaçamento entre linhas';

  @override
  String get letterSpacingLabel => 'Espaçamento entre letras';

  @override
  String get textAlignmentLabel => 'Alinhamento do texto';

  @override
  String get textAlignmentNatural => 'Natural';

  @override
  String get textAlignmentJustified => 'Justificado';

  @override
  String get firstLineIndentLabel => 'Recuo da primeira linha';

  @override
  String get paragraphSpacingLabel => 'Espaçamento entre parágrafos';

  @override
  String get pageTurningMode => 'Modo de página';

  @override
  String get pageTurningSlide => 'Deslizar horizontal';

  @override
  String get pageTurningScroll => 'Paginação vertical';

  @override
  String get tapZoneSettings => 'Zonas de toque';

  @override
  String get tapZoneNextPage => 'Próxima página';

  @override
  String get tapZonePreviousPage => 'Página anterior';

  @override
  String get tapZoneMenu => 'Menu';

  @override
  String get tapZoneNextChapter => 'Próximo capítulo';

  @override
  String get tapZonePreviousChapter => 'Capítulo anterior';

  @override
  String get tapZoneNone => 'Nenhuma ação';

  @override
  String get tapZoneSettingsHint =>
      'Personalize o que cada uma das nove áreas de toque faz';

  @override
  String get tapZoneChooseAction => 'Escolha uma ação';

  @override
  String get tapZoneMenuRequiredHint =>
      'Toque em uma área para alterar sua ação. Pelo menos uma área deve permanecer como Menu; se todos os Menus forem removidos, a área central volta a ser Menu.';

  @override
  String get tapZoneReset => 'Restaurar padrões';

  @override
  String get highlightColor => 'Cor do destaque';

  @override
  String get noteTypeHighlight => 'Destaque';

  @override
  String get noteTypeUnderline => 'Sublinhado';

  @override
  String get noteTypeNote => 'Nota';

  @override
  String get author => 'Autor';

  @override
  String get progress => 'Progresso';

  @override
  String get deleteBook => 'Excluir livro';

  @override
  String get readerToolbarTOC => 'Sumário';

  @override
  String get readerAddBookmark => 'Adicionar marcador';

  @override
  String get bookmarkAdded => 'Marcador adicionado';

  @override
  String get bookmarkRemoved => 'Marcador removido';

  @override
  String get readerNavigationTitle => 'Navegação de leitura';

  @override
  String readerNavigationPosition(int current, int total) {
    return 'Capítulo $current de $total';
  }

  @override
  String get readerSearchChapters => 'Pesquisar capítulos';

  @override
  String get readerBackToCurrentChapter => 'Voltar ao capítulo atual';

  @override
  String get readerCurrentChapter => 'Atual';

  @override
  String get readerCurrentPosition => 'Posição atual';

  @override
  String get readerNoChapterResults => 'Nenhum capítulo correspondente';

  @override
  String get readerNoChapterResultsHint =>
      'Tente outra palavra do título do capítulo.';

  @override
  String get readerNoBookmarks => 'Ainda não há marcadores';

  @override
  String get readerNoBookmarksHint =>
      'Toque no botão de marcador no canto superior direito para salvar seu ponto.';

  @override
  String get readerUnsupportedFormat => 'Este formato ainda não pode ser lido.';

  @override
  String get currentChapter => 'Capítulo atual';

  @override
  String get readerPrefaceTitle => 'Páginas preliminares';

  @override
  String get readerModeHorizontalPage => 'Sem animação';

  @override
  String get readerModeVerticalScrollHint =>
      'Deslize verticalmente por páginas pré-paginadas; deslize para os lados para trocar de capítulo';

  @override
  String get readerModeWholeBookScrollHint =>
      'Capítulos pré-paginados formam uma lista vertical navegável';

  @override
  String get readerScrollByChapterTitle => 'Rolar por capítulo';

  @override
  String get readerScrollByChapterOnHint =>
      'Deslize por um capítulo página a página e depois deslize para os lados para trocar de capítulo';

  @override
  String get readerScrollByChapterOffHint =>
      'Todos os capítulos se conectam página a página em uma lista vertical única';

  @override
  String get readerModeHorizontalPageHint =>
      'Toque no lado esquerdo para a página anterior e no lado direito para a próxima página';

  @override
  String get readerModeHorizontalSlideHint =>
      'As páginas seguem seu dedo horizontalmente e se encaixam no lugar';

  @override
  String get readerModeCoverSlide => 'Capa';

  @override
  String get readerModeCoverSlideHint =>
      'A página atual desliza para a esquerda, revelando a próxima página por baixo';

  @override
  String get readerModePageCurl => 'Dobra de página';

  @override
  String get readerModePageCurlHint =>
      'Arraste para os lados para dobrar a página e solte para virar ou voltar';

  @override
  String get readerTextBrightnessLabel => 'Brilho do texto';

  @override
  String get readerDimTextInDarkModeTitle => 'Escurecer texto no modo escuro';

  @override
  String get readerDimTextInDarkModeHint => 'Usar 70% de brilho no modo escuro';

  @override
  String get readerHorizontalMarginLabel => 'Margem horizontal';

  @override
  String get readerTopMarginLabel => 'Margem superior';

  @override
  String get readerBottomMarginLabel => 'Margem inferior';

  @override
  String get readerTxtChapterTitlePageTitle =>
      'Título do capítulo em página própria';

  @override
  String get readerTxtChapterTitlePageHint =>
      'Quando desativado, o título do capítulo aparece acima do corpo do texto';

  @override
  String readerChapterFallback(int number) {
    return 'Capítulo $number';
  }

  @override
  String readerOpenFailed(String error) {
    return 'Falha ao abrir: $error';
  }

  @override
  String get readerNoContent => 'Este livro não tem conteúdo legível';

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
  String get readerTopBarStyleTitle => 'Informações do topo';

  @override
  String get readerTopBarStyleSystem => 'Barra de status do sistema';

  @override
  String get readerTopBarStyleSystemHint =>
      'Mostrar hora, sinal e bateria do sistema';

  @override
  String get readerTopBarStyleReader => 'Barra de informações do leitor';

  @override
  String get readerTopBarStyleReaderHint =>
      'Mostrar hora, título do capítulo e bateria';

  @override
  String get readerTopBarStyleFloating => 'Barra de informações flutuante';

  @override
  String get readerTopBarStyleFloatingHint =>
      'Mostrar hora e bateria na área da barra de status sem ocupar espaço de leitura';

  @override
  String get readerTopBarStyleHidden => 'Totalmente imersivo';

  @override
  String get readerTopBarStyleHiddenHint => 'Não mostrar informações no topo';

  @override
  String get readerThemeTitle => 'Tema de leitura';

  @override
  String get readerThemeDescription =>
      'Altera apenas a página de leitura e seus controles';

  @override
  String get readerSettingsTabTheme => 'Tema';

  @override
  String get readerSettingsTabText => 'Texto';

  @override
  String get readerSettingsTabLayout => 'Layout';

  @override
  String get readerSettingsTabPaging => 'Paginação';

  @override
  String get readerSettingsAdvancedTypography => 'Tipografia avançada';

  @override
  String get readerAutoPageTurnTitle => 'Virar página automaticamente';

  @override
  String get readerAutoPageTurnOff => 'Não iniciado';

  @override
  String get readerAutoPageTurnShortcutTitle => 'Atalho de leitura automática';

  @override
  String get readerAutoPageTurnShortcutHint =>
      'Mostrar junto aos controles de leitura para iniciar ou pausar rapidamente';

  @override
  String get readerAutoPageTurnModeTimed => 'Virar página por tempo';

  @override
  String get readerAutoPageTurnModeSweep => 'Virar página por varredura';

  @override
  String get readerAutoPageTurnModeContinuous => 'Rolagem contínua';

  @override
  String get readerAutoPageTurnModeInterval => 'Rolagem por intervalo';

  @override
  String get readerAutoPageTurnTimedHint =>
      'Aguarda o intervalo selecionado e depois passa para a próxima página.';

  @override
  String get readerAutoPageTurnSweepHint =>
      'Uma linha varre de cima para baixo, revelando gradualmente a próxima página acima dela.';

  @override
  String get readerAutoPageTurnContinuousHint =>
      'Rola para baixo continuamente em um ritmo de leitura constante.';

  @override
  String get readerAutoPageTurnIntervalHint =>
      'Aguarda o intervalo selecionado e depois rola cerca de uma tela para baixo.';

  @override
  String get readerAutoPageTurnSweepDurationLabel => 'Duração da varredura';

  @override
  String get readerAutoPageTurnScrollSpeedLabel => 'Velocidade de rolagem';

  @override
  String readerAutoPageTurnSecondsPerScreen(int seconds) {
    return '$seconds segundos por tela';
  }

  @override
  String readerAutoPageTurnModeValue(String mode, int seconds) {
    return '$mode · ${seconds}s/tela';
  }

  @override
  String readerAutoPageTurnModePaused(String mode, int seconds) {
    return 'Pausado · $mode · ${seconds}s/tela';
  }

  @override
  String get readerAutoPageTurnIntervalLabel => 'Intervalo de página';

  @override
  String get readerAutoPageTurnStart => 'Iniciar virar página automático';

  @override
  String get readerAutoPageTurnResume => 'Retomar virar página automático';

  @override
  String get readerThemeDay => 'Dia';

  @override
  String get readerThemeFollowSystem => 'Seguir sistema';

  @override
  String get readerThemeMist => 'Névoa';

  @override
  String get readerThemeGreen => 'Conforto ocular';

  @override
  String get readerThemeRose => 'Rosa';

  @override
  String get readerThemeNavy => 'Azul profundo';

  @override
  String get readerThemeNight => 'Noite';

  @override
  String get readerThemePureBlack => 'Preto puro';

  @override
  String get readerThemeParchment => 'Pergaminho';

  @override
  String get readerThemeCustom => 'Personalizado';

  @override
  String get readerPullBookmarkTitle => 'Marcador por puxar';

  @override
  String get readerPullBookmarkHint =>
      'Puxe a partir da borda superior e solte para adicionar ou remover um marcador desta página';

  @override
  String get readerPullBookmarkAddHint => 'Puxe mais para adicionar marcador';

  @override
  String get readerPullBookmarkRemoveHint => 'Puxe mais para remover marcador';

  @override
  String get readerPullBookmarkReleaseHint => 'Solte para concluir';

  @override
  String get readerTapAnimationTitle => 'Animação de toque';

  @override
  String get readerTapAnimationHint =>
      'Usa a animação de virar página atual nos toques laterais; desative para atualizar instantaneamente';

  @override
  String get readerTabletTwoPageTitle => 'Layout de duas páginas no tablet';

  @override
  String get readerTabletTwoPageHint =>
      'Mostra páginas esquerda e direita lado a lado no modo paisagem; desative para usar sempre uma única página';

  @override
  String get readerCustomThemeReset => 'Redefinir';

  @override
  String get readerCustomThemeColors => 'Cores do tema';

  @override
  String get readerCustomThemeTextColor => 'Cor do texto';

  @override
  String get readerCustomThemeTextColorHint =>
      'Texto do corpo, títulos e ícones principais';

  @override
  String get readerCustomThemeBackground => 'Fundo de leitura';

  @override
  String get readerCustomThemeBackgroundHint =>
      'A cor do papel e da tela de leitura';

  @override
  String get readerCustomThemeControlBar => 'Cor da barra de controles';

  @override
  String get readerCustomThemeControlBarHint =>
      'Controles superior e inferior e superfícies de configurações';

  @override
  String get readerCustomThemeContrastGood =>
      'O texto tem contraste claro para uma leitura prolongada confortável';

  @override
  String get readerCustomThemeContrastLow =>
      'O contraste do texto está baixo e pode causar fadiga de leitura';

  @override
  String get readerCustomThemeSave => 'Salvar e usar';

  @override
  String get readerCustomThemePreview => 'Prévia ao vivo';

  @override
  String get readerCustomThemePreviewChapter =>
      'Capítulo Um · Vento entre as páginas';

  @override
  String get readerCustomThemePreviewBody =>
      'Este é o seu espaço de leitura. Ajuste as cores do texto, do papel e dos controles até cada página parecer genuinamente sua.';

  @override
  String get readerCustomThemeHexInvalid =>
      'Digite uma cor hexadecimal de 6 dígitos, como #F6F0E4';

  @override
  String get readerCustomThemeHexLabel => 'Cor hexadecimal';

  @override
  String get readerCustomThemeAdd => 'Adicionar tema';

  @override
  String get readerCustomThemeReorderHint =>
      'Segure a alça à direita para reordenar os temas. A mesma ordem aparece nas configurações de leitura.';

  @override
  String get readerCustomThemeUse => 'Usar tema selecionado';

  @override
  String get readerCustomThemeDeleteTitle => 'Excluir tema de leitura?';

  @override
  String readerCustomThemeDeleteMessage(String name) {
    return '“$name” será removido dos seus temas, junto com a imagem de fundo salva.';
  }

  @override
  String get readerCustomThemeNewTitle => 'Novo tema de leitura';

  @override
  String get readerCustomThemeEditTitle => 'Editar tema de leitura';

  @override
  String get readerCustomThemeName => 'Nome do tema';

  @override
  String get readerCustomThemeNameHint =>
      'Por exemplo, Noite de chuva ou Papel da tarde';

  @override
  String get readerCustomThemeBackgroundImage => 'Imagem de fundo';

  @override
  String get readerCustomThemeBackgroundImageHint =>
      'Suporta JPG, PNG e WebP. A imagem é copiada para o armazenamento do app.';

  @override
  String get readerCustomThemeChooseImage => 'Enviar imagem';

  @override
  String get readerCustomThemeReplaceImage => 'Substituir imagem';

  @override
  String get readerCustomThemeRemoveImage => 'Remover imagem';

  @override
  String get readerCustomThemeImageStrength => 'Intensidade da imagem de fundo';

  @override
  String get readerCustomThemeImageUnsupported =>
      'A importação de imagem de fundo não é suportada nesta plataforma';

  @override
  String get readerCustomThemeImageTooLarge =>
      'A imagem deve ter no máximo 20 MB';

  @override
  String get readerCustomThemeImageFormat =>
      'Escolha uma imagem JPG, PNG ou WebP';

  @override
  String get readerCustomThemeImageFailed =>
      'Não foi possível importar a imagem de fundo. Tente novamente.';

  @override
  String get importUnknownTitle => 'Título desconhecido';

  @override
  String get importUnknownAuthor => 'Autor desconhecido';

  @override
  String get bookUntitled => 'Sem título';

  @override
  String get readerAddAnnotation => 'Adicionar anotação';

  @override
  String get readerAnnotationHint =>
      'Escreva suas impressões sobre esta passagem…';

  @override
  String get readerAnnotationSaved => 'Anotação salva';

  @override
  String get readerAnnotationDeleted => 'Anotação excluída';

  @override
  String get readerNoAnnotations => 'Ainda não há anotações';

  @override
  String get readerNoAnnotationsHint =>
      'Selecione texto para destacar ou adicionar um comentário. Toque em um comentário sublinhado para lê-lo novamente.';

  @override
  String get readerChapterProgressTitle => 'Progresso do capítulo';

  @override
  String get readerChapterProgressHidden => 'Oculto';

  @override
  String readerChapterProgressFraction(int chapter, int total) {
    return '$chapter/$total capítulos';
  }

  @override
  String readerChapterProgressRemaining(int count) {
    return '$count capítulos à frente';
  }
}
