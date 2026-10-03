import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xxread/core/reader/reader_aloud_controller.dart';

void main() {
  test(
    'foreground controls keep highlight, progress, navigation, and sleep',
    () async {
      final engine = _ForegroundEngine();
      final persisted = <ReaderAloudPosition>[];
      final revealed = <ReaderAloudPosition>[];
      final controller = ReaderAloudController(
        engine: engine,
        source: CallbackReaderAloudSource(
          bookTitle: 'Local book',
          chapterCount: () => 1,
          currentPosition: () async =>
              const ReaderAloudPosition(chapterIndex: 0, offset: 0),
          loadChapter: (index) async => index == 0
              ? const ReaderAloudChapter(
                  index: 0,
                  id: 'chapter-1',
                  title: 'One',
                  text: '第一句。第二句。',
                )
              : null,
          revealPosition: (position) async => revealed.add(position),
          persistPosition: (position) async => persisted.add(position),
        ),
      );
      addTearDown(controller.dispose);

      await controller.start();
      await _waitFor(() => engine.spoken.length == 1);
      expect(controller.state, ReaderAloudPlaybackState.playing);
      expect(controller.highlight?.startOffset, 0);
      expect(controller.highlight?.endOffset, 4);
      expect(controller.chapterProgress, 0);

      engine.position = 2;
      engine.notifyProgress();
      expect(controller.currentOffset, 2);
      expect(controller.chapterProgress, closeTo(0.25, 0.001));

      await controller.pause();
      expect(controller.state, ReaderAloudPlaybackState.paused);
      await controller.resume();
      await _waitFor(() => engine.spoken.length == 2);

      await controller.next();
      await _waitFor(() => engine.spoken.length == 3);
      expect(controller.currentSegment?.text, '第二句。');
      expect(revealed.last.offset, 4);

      controller.setSleepTimer(const Duration(milliseconds: 10));
      await _waitFor(
        () => controller.state == ReaderAloudPlaybackState.stopped,
      );
      expect(controller.sleepDuration, isNull);
      expect(persisted, isNotEmpty);
    },
  );
}

Future<void> _waitFor(bool Function() condition) async {
  final deadline = DateTime.now().add(const Duration(seconds: 2));
  while (!condition()) {
    if (DateTime.now().isAfter(deadline)) {
      fail('Timed out waiting for reader aloud state');
    }
    await Future<void>.delayed(const Duration(milliseconds: 5));
  }
}

class _ForegroundEngine extends ChangeNotifier implements ReaderAloudEngine {
  final List<String> spoken = <String>[];
  Completer<void>? _activeSpeech;
  bool _playing = false;
  bool _paused = false;
  int position = 0;

  @override
  int get currentPosition => position;

  @override
  bool get isPaused => _paused;

  @override
  bool get isPlaying => _playing;

  @override
  Future<void> speak(String text) {
    _activeSpeech?.complete();
    _activeSpeech = Completer<void>();
    spoken.add(text);
    position = 0;
    _playing = true;
    _paused = false;
    notifyListeners();
    return _activeSpeech!.future;
  }

  @override
  Future<void> pause() async {
    _playing = false;
    _paused = true;
    _completeSpeech();
    notifyListeners();
  }

  @override
  Future<void> stop() async {
    _playing = false;
    _paused = false;
    _completeSpeech();
    notifyListeners();
  }

  void notifyProgress() => notifyListeners();

  void _completeSpeech() {
    final active = _activeSpeech;
    _activeSpeech = null;
    if (active?.isCompleted == false) active!.complete();
  }
}
