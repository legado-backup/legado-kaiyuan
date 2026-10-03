import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../utils/glass_config.dart';

/// Full-width, top-aligned backdrop with a Gaussian radius that decreases with y.
/// Callers paint controls above this filter so they stay sharp.
class GradientTopBackdrop extends StatefulWidget {
  const GradientTopBackdrop({
    super.key,
    required this.height,
    this.blurEnabled = true,
    this.fallbackBands = 32,
    this.maxSigma,
    this.clearTail = 16.0,
  }) : assert(height >= 0),
       assert(fallbackBands > 0),
       assert(maxSigma == null || maxSigma >= 0),
       assert(clearTail >= 0);

  final double height;
  final bool blurEnabled;

  /// Optional peak radius in logical pixels.
  final double? maxSigma;

  /// Unfiltered space at the bottom; phone bars use a shorter clear tail.
  final double clearTail;

  /// Short phone headers need fewer fallback filters than tablet backdrops.
  final int fallbackBands;

  @override
  State<GradientTopBackdrop> createState() => _GradientTopBackdropState();
}

class _GradientTopBackdropState extends State<GradientTopBackdrop> {
  static ui.FragmentProgram? _program;
  ui.Image? _samplerSeed;
  ui.FragmentShader? _vertical;
  ui.FragmentShader? _horizontal;
  bool _loadFailed = false;
  bool _shaderLoading = false;
  final _fallbackBackdrop = BackdropKey();

  @override
  void initState() {
    super.initState();
    _ensureShader();
  }

  @override
  void didUpdateWidget(covariant GradientTopBackdrop oldWidget) {
    super.didUpdateWidget(oldWidget);
    _ensureShader();
  }

  void _ensureShader() {
    if (!widget.blurEnabled ||
        !ui.ImageFilter.isShaderFilterSupported ||
        _shaderLoading ||
        _loadFailed ||
        _vertical != null) {
      return;
    }
    _shaderLoading = true;
    _loadShader();
  }

  Future<void> _loadShader() async {
    try {
      final program =
          _program ??
          await ui.FragmentProgram.fromAsset(
            'shaders/top_variable_gaussian.frag',
          );
      _program = program;
      if (!mounted) return;
      // Configure the input sampler's filtering. ImageFilter.shader replaces
      // sampler 0's texture with the live backdrop, retaining this descriptor.
      // Linear sampling combines adjacent Gaussian taps in one GPU lookup.
      final recorder = ui.PictureRecorder();
      Canvas(recorder).drawColor(Colors.transparent, BlendMode.src);
      final picture = recorder.endRecording();
      final ui.Image seed;
      try {
        seed = await picture.toImage(1, 1);
      } finally {
        picture.dispose();
      }
      if (!mounted) {
        seed.dispose();
        return;
      }
      setState(() {
        _samplerSeed = seed;
        _vertical = program.fragmentShader();
        _horizontal = program.fragmentShader();
        _vertical!.setImageSampler(0, seed, filterQuality: FilterQuality.low);
        _horizontal!.setImageSampler(0, seed, filterQuality: FilterQuality.low);
      });
    } catch (error, stack) {
      debugPrint('Gradient top backdrop shader could not load: $error');
      debugPrintStack(stackTrace: stack);
      if (mounted) setState(() => _loadFailed = true);
    } finally {
      _shaderLoading = false;
    }
  }

  @override
  void dispose() {
    _vertical?.dispose();
    _horizontal?.dispose();
    _samplerSeed?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clearHeight = math.max(0.0, widget.height - widget.clearTail);
    // Keep every downward sample inside the top region: radius is 3 sigma.
    final sigma = math.min(
      widget.maxSigma ?? GlassEffectConfig.appBarBlur * 2,
      clearHeight / 3,
    );
    final enabled =
        widget.blurEnabled && !GlassEffectConfig.shouldDisableBlur && sigma > 0;
    Widget? filter;
    if (enabled && !_loadFailed && _vertical != null && _horizontal != null) {
      final pixelRatio = MediaQuery.devicePixelRatioOf(context);
      for (final shader in [_vertical!, _horizontal!]) {
        // 0/1 (input texture size) and sampler 0 are supplied by the engine.
        shader.setFloat(2, clearHeight * pixelRatio);
        // Bound the kernel on exceptionally dense displays (3 sigma <= 384px).
        shader.setFloat(3, math.min(sigma * pixelRatio, 128));
      }
      _vertical!.setFloat(4, 0);
      _vertical!.setFloat(5, 1);
      _horizontal!.setFloat(4, 1);
      _horizontal!.setFloat(5, 0);
      filter = ClipRect(
        child: BackdropFilter(
          key: const ValueKey('gradient-top-backdrop-filter'),
          // Vertical must run FIRST: horizontal sampling then stays on the
          // same y and uses the same sigma for both axes at each output pixel.
          filter: ui.ImageFilter.compose(
            outer: ui.ImageFilter.shader(_horizontal!),
            inner: ui.ImageFilter.shader(_vertical!),
          ),
          child: const SizedBox.expand(),
        ),
      );
    } else if (enabled &&
        (!ui.ImageFilter.isShaderFilterSupported || _loadFailed)) {
      // Older Skia backends cannot run ImageFilter.shader. Approximate the
      // radius curve with narrow native Gaussian bands, never an opacity fade.
      // Draw bottom to top to limit cross-band sampling of stronger blur.
      final bands = widget.fallbackBands;
      filter = Stack(
        children: [
          for (var i = bands - 1; i >= 0; i--)
            Positioned(
              top: clearHeight * i / bands,
              height: clearHeight / bands,
              left: 0,
              right: 0,
              child: ClipRect(
                child: BackdropFilter(
                  backdropGroupKey: _fallbackBackdrop,
                  filter: ui.ImageFilter.blur(
                    sigmaX: sigma * (1 - (i + 0.5) / bands),
                    sigmaY: sigma * (1 - (i + 0.5) / bands),
                    // Repeating the first row flashes when content scrolls.
                    tileMode: TileMode.mirror,
                  ),
                  child: const SizedBox.expand(),
                ),
              ),
            ),
        ],
      );
    }
    return IgnorePointer(
      child: SizedBox(
        width: double.infinity,
        height: widget.height,
        child: filter,
      ),
    );
  }
}
