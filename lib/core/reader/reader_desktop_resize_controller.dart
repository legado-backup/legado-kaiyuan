import 'dart:async';

import 'package:flutter/widgets.dart';

/// Keeps the expensive reader pagination geometry stable while a desktop
/// window is being dragged. The live window still follows the pointer; text is
/// repaginated once after the resize gesture pauses.
class ReaderDesktopResizeController {
  ReaderDesktopResizeController({
    this.settleDelay = const Duration(milliseconds: 140),
  });

  final Duration settleDelay;

  Size? _settledSize;
  Size? _pendingSize;
  Timer? _settleTimer;

  Size resolve(
    Size viewport, {
    required bool enabled,
    required VoidCallback onSettled,
  }) {
    if (!enabled) {
      _settleTimer?.cancel();
      _settledSize = viewport;
      _pendingSize = viewport;
      return viewport;
    }

    _settledSize ??= viewport;
    if (_pendingSize == viewport) return _settledSize!;

    _pendingSize = viewport;
    _settleTimer?.cancel();
    _settleTimer = Timer(settleDelay, () {
      final pending = _pendingSize;
      if (pending == null || pending == _settledSize) return;
      _settledSize = pending;
      onSettled();
    });
    return _settledSize!;
  }

  void dispose() => _settleTimer?.cancel();
}
