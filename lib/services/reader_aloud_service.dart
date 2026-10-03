import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/reader/reader_aloud_controller.dart';

enum ReaderAloudPresentation { player, controls }

/// App-facing read-aloud engine backed exclusively by the platform TTS engine.
class ReaderAloudService extends ChangeNotifier
    implements
        ReaderAloudEngine,
        ReaderAloudContinuousEngine,
        ReaderAloudQueuedEngine {
  ReaderAloudService({required this.systemEngine}) {
    systemEngine.addListener(_relayChange);
    unawaited(initialize());
  }

  final ReaderAloudAdjustableEngine systemEngine;
  bool _initialized = false;
  bool _disposed = false;
  bool _followPageTurns = false;
  ReaderAloudPresentation _presentation = ReaderAloudPresentation.player;

  bool get followPageTurns => _followPageTurns;
  ReaderAloudPresentation get presentation => _presentation;

  Future<void> initialize() async {
    if (_initialized || _disposed) return;
    final prefs = await SharedPreferences.getInstance();
    if (_disposed) return;
    _followPageTurns = prefs.getBool('reader_aloud_follow_page_turns') ?? false;
    _presentation = prefs.getString('reader_aloud_presentation') == 'controls'
        ? ReaderAloudPresentation.controls
        : ReaderAloudPresentation.player;
    _initialized = true;
    notifyListeners();
  }

  Future<void> setFollowPageTurns(bool value) async {
    await initialize();
    if (_followPageTurns == value) return;
    final prefs = await SharedPreferences.getInstance();
    if (!await prefs.setBool('reader_aloud_follow_page_turns', value)) {
      throw StateError('Could not save listening page following');
    }
    _followPageTurns = value;
    _notifySafe();
  }

  Future<void> setPresentation(ReaderAloudPresentation value) async {
    await initialize();
    if (_presentation == value) return;
    final prefs = await SharedPreferences.getInstance();
    if (!await prefs.setString('reader_aloud_presentation', value.name)) {
      throw StateError('Could not save listening mode');
    }
    _presentation = value;
    _notifySafe();
  }

  @override
  bool get isPlaying => systemEngine.isPlaying;

  @override
  bool get isPaused => systemEngine.isPaused;

  @override
  int get currentPosition => systemEngine.currentPosition;

  @override
  bool get supportsContinuousText =>
      systemEngine is ReaderAloudContinuousEngine &&
      (systemEngine as ReaderAloudContinuousEngine).supportsContinuousText;

  @override
  bool get supportsQueuedText =>
      systemEngine is ReaderAloudQueuedEngine &&
      (systemEngine as ReaderAloudQueuedEngine).supportsQueuedText;

  @override
  Future<void> speak(String text) => systemEngine.speak(text);

  @override
  Future<void> speakQueued(
    List<String> texts, {
    required ValueChanged<int> onTextStarted,
  }) {
    final engine = systemEngine;
    if (engine is! ReaderAloudQueuedEngine) {
      throw UnsupportedError('queued_tts_unavailable');
    }
    final queuedEngine = engine as ReaderAloudQueuedEngine;
    if (!queuedEngine.supportsQueuedText) {
      throw UnsupportedError('queued_tts_unavailable');
    }
    return queuedEngine.speakQueued(texts, onTextStarted: onTextStarted);
  }

  @override
  Future<void> pause() => systemEngine.pause();

  @override
  Future<void> stop() => systemEngine.stop();

  void _relayChange() => _notifySafe();

  void _notifySafe() {
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    if (_disposed) return;
    _disposed = true;
    systemEngine.removeListener(_relayChange);
    super.dispose();
  }
}
