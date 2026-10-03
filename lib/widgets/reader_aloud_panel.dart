import 'dart:async';

import 'package:flutter/material.dart';

import '../core/reader/reader_aloud_controller.dart';
import '../services/reader_aloud_service.dart';
import '../services/tts_service.dart';
import '../utils/reader_themes.dart';

Future<void> showReaderAloud({
  required BuildContext context,
  required ReaderAloudController controller,
  required TtsService ttsService,
  required ReaderAloudService aloudService,
  required ReaderThemePalette palette,
  required ThemeData themeData,
  String author = '',
}) async {
  await aloudService.initialize();
  if (!context.mounted) return;
  await showModalBottomSheet<void>(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: palette.controlBar,
    constraints: BoxConstraints(
      maxWidth: 620,
      maxHeight: MediaQuery.sizeOf(context).height * 0.82,
    ),
    builder: (context) => Theme(
      data: themeData,
      child: ReaderAloudPlayerPage(
        controller: controller,
        ttsService: ttsService,
        aloudService: aloudService,
        palette: palette,
        author: author,
      ),
    ),
  );
}

Future<void> showReaderAloudPlayer({
  required BuildContext context,
  required ReaderAloudController controller,
  required TtsService ttsService,
  required ReaderAloudService aloudService,
  required ReaderThemePalette palette,
  required ThemeData themeData,
  String author = '',
}) => showReaderAloud(
  context: context,
  controller: controller,
  ttsService: ttsService,
  aloudService: aloudService,
  palette: palette,
  themeData: themeData,
  author: author,
);

Future<void> showReaderAloudSettingsSheet({
  required BuildContext context,
  required ReaderAloudController controller,
  required TtsService ttsService,
  required ReaderAloudService aloudService,
  required ReaderThemePalette palette,
  required ThemeData themeData,
}) => showModalBottomSheet<void>(
  context: context,
  useSafeArea: true,
  showDragHandle: true,
  backgroundColor: palette.controlBar,
  constraints: const BoxConstraints(maxWidth: 620),
  builder: (context) => Theme(
    data: themeData,
    child: ReaderAloudPanel(
      controller: controller,
      ttsService: ttsService,
      aloudService: aloudService,
      palette: palette,
    ),
  ),
);

@Deprecated('Use showReaderAloudSettingsSheet')
Future<void> showReaderAloudPanelSheet({
  required BuildContext context,
  required ReaderAloudController controller,
  required TtsService ttsService,
  required ReaderAloudService aloudService,
  required ReaderThemePalette palette,
  required ThemeData themeData,
}) => showReaderAloudSettingsSheet(
  context: context,
  controller: controller,
  ttsService: ttsService,
  aloudService: aloudService,
  palette: palette,
  themeData: themeData,
);

class ReaderAloudPlayerPage extends StatefulWidget {
  const ReaderAloudPlayerPage({
    super.key,
    required this.controller,
    required this.ttsService,
    required this.aloudService,
    required this.palette,
    this.author = '',
    this.compactControls = false,
  });

  final ReaderAloudController controller;
  final TtsService ttsService;
  final ReaderAloudService aloudService;
  final ReaderThemePalette palette;
  final String author;
  final bool compactControls;

  @override
  State<ReaderAloudPlayerPage> createState() => _ReaderAloudPlayerPageState();
}

class _ReaderAloudPlayerPageState extends State<ReaderAloudPlayerPage> {
  @override
  void initState() {
    super.initState();
    unawaited(widget.ttsService.ensureVoicesLoaded());
    if (!widget.controller.isActive) unawaited(widget.controller.start());
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: AnimatedBuilder(
      animation: Listenable.merge([
        widget.controller,
        widget.ttsService,
        widget.aloudService,
      ]),
      builder: (context, _) {
        final chapter = widget.controller.currentChapter;
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.controller.source.bookTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (widget.author.trim().isNotEmpty)
                Text(
                  widget.author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: 12),
              Text(
                chapter?.title ?? '准备朗读',
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: chapter == null
                    ? null
                    : widget.controller.chapterProgress,
              ),
              const SizedBox(height: 16),
              _PlaybackControls(controller: widget.controller),
              const Divider(height: 32),
              ReaderAloudPanel(
                controller: widget.controller,
                ttsService: widget.ttsService,
                aloudService: widget.aloudService,
                palette: widget.palette,
              ),
            ],
          ),
        );
      },
    ),
  );
}

class _PlaybackControls extends StatelessWidget {
  const _PlaybackControls({required this.controller});

  final ReaderAloudController controller;

  @override
  Widget build(BuildContext context) {
    final playing =
        controller.state == ReaderAloudPlaybackState.playing ||
        controller.state == ReaderAloudPlaybackState.loading;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          tooltip: '上一段',
          onPressed: controller.previous,
          icon: const Icon(Icons.skip_previous_rounded),
        ),
        const SizedBox(width: 12),
        FilledButton.tonalIcon(
          onPressed: playing ? controller.pause : controller.resume,
          icon: Icon(playing ? Icons.pause_rounded : Icons.play_arrow_rounded),
          label: Text(playing ? '暂停' : '继续'),
        ),
        const SizedBox(width: 12),
        IconButton(
          tooltip: '下一段',
          onPressed: controller.next,
          icon: const Icon(Icons.skip_next_rounded),
        ),
        IconButton(
          tooltip: '停止',
          onPressed: controller.stop,
          icon: const Icon(Icons.stop_rounded),
        ),
      ],
    );
  }
}

class ReaderAloudPanel extends StatelessWidget {
  const ReaderAloudPanel({
    super.key,
    required this.controller,
    required this.ttsService,
    required this.aloudService,
    required this.palette,
  });

  final ReaderAloudController controller;
  final TtsService ttsService;
  final ReaderAloudService aloudService;
  final ReaderThemePalette palette;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SettingSlider(
          label: '语速',
          value: ttsService.speechRate,
          min: 0.1,
          max: 1,
          onChanged: ttsService.setSpeechRate,
        ),
        _SettingSlider(
          label: '音量',
          value: ttsService.speechVolume,
          min: 0,
          max: 1,
          onChanged: ttsService.setVolume,
        ),
        _SettingSlider(
          label: '音调',
          value: ttsService.speechPitch,
          min: 0.5,
          max: 2,
          onChanged: ttsService.setPitch,
        ),
        if (ttsService.availableVoices.isNotEmpty)
          DropdownButtonFormField<TtsVoiceOption>(
            initialValue: ttsService.currentVoice,
            decoration: const InputDecoration(labelText: '系统语音'),
            items: [
              for (final voice in ttsService.availableVoices)
                DropdownMenuItem(
                  value: voice,
                  child: Text(
                    voice.subtitle.isEmpty
                        ? voice.title
                        : '${voice.title} · ${voice.subtitle}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
            onChanged: (voice) {
              if (voice != null) unawaited(ttsService.setVoice(voice));
            },
          ),
        SwitchListTile.adaptive(
          contentPadding: EdgeInsets.zero,
          title: const Text('朗读时跟随页面'),
          value: aloudService.followPageTurns,
          onChanged: aloudService.setFollowPageTurns,
        ),
      ],
    );
  }
}

class _SettingSlider extends StatelessWidget {
  const _SettingSlider({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  final String label;
  final double value;
  final double min;
  final double max;
  final Future<void> Function(double) onChanged;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      SizedBox(width: 48, child: Text(label)),
      Expanded(
        child: Slider(
          value: value.clamp(min, max),
          min: min,
          max: max,
          onChanged: (next) => unawaited(onChanged(next)),
        ),
      ),
    ],
  );
}
