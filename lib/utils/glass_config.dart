// 文件说明：毛玻璃效果配置文件，统一管理玻璃态 UI 的参数。
// 技术要点：工具方法、Flutter。

// 毛玻璃效果配置管理器
// 集中管理所有界面的毛玻璃效果和透明度设置

import 'package:flutter/material.dart';

class GlassEffectConfig {
  // ============ 模糊强度配置 (sigmaX/sigmaY) ============
  // 悬浮 chrome（顶栏、悬浮导航栏、阅读页控制栏）共用同一组参数，
  // 保证全应用玻璃观感一致；调整这里即可全局生效。
  static const double _chromeBlurBase = 15.0;
  static const double _lightCardBlurBase = 8.0; // 轻量级容器（图标背景等）
  static const double _modalBlurBase = 25.0; // 底部弹出菜单

  // 全局模糊缩放（性能优化：降低 GPU 压力）
  static double _blurScale = 0.85;
  static bool _reduceEffects = false;
  static bool _disableAllGlassEffects = false;

  static void applyPerformanceMode({required bool reduceEffects}) {
    _reduceEffects = reduceEffects;
    _syncBlurScale();
  }

  static void setDisableAllGlassEffects(bool disabled) {
    _disableAllGlassEffects = disabled;
    _syncBlurScale();
  }

  static void _syncBlurScale() {
    if (_disableAllGlassEffects) {
      _blurScale = 0.0;
      return;
    }
    _blurScale = _reduceEffects ? 0.65 : 0.85;
  }

  static double _scaled(double value) => value * _blurScale;

  // 顶部应用栏 (AppBar)
  static double get appBarBlur => _scaled(_chromeBlurBase);

  // 导航栏
  static double get navigationBarBlur => _scaled(_chromeBlurBase);

  // 阅读页面控制栏（与顶栏/导航栏保持一致）
  static double get readingTopBarBlur => appBarBlur;
  static double get readingBottomBarBlur => navigationBarBlur;

  // 卡片和容器
  static double get lightCardBlur => _scaled(_lightCardBlurBase);
  static double get modalBlur => _scaled(_modalBlurBase);

  // ============ 透明度配置 (alpha值: 0.0-1.0) ============

  // 悬浮 chrome 共用透明度（顶栏、悬浮导航栏、阅读页控制栏）
  static const double _chromeOpacityBase = 0.3;
  static const double _lightChromeOpacityBase = 0.60;

  /// 根据明暗主题返回统一的悬浮 chrome 透明度。
  static double chromeOpacityFor(Brightness brightness) {
    return effectiveOpacity(
      brightness == Brightness.light
          ? _lightChromeOpacityBase
          : _chromeOpacityBase,
    );
  }

  /// 返回统一的悬浮 chrome 实色基底，便于渐变组件复用同一套提亮规则。
  static Color chromeBaseColor(
    Color source,
    Brightness brightness, {
    double lightBlend = 0,
  }) {
    if (brightness == Brightness.light) {
      return Color.lerp(source, Colors.white, lightBlend.clamp(0.0, 1.0))!;
    }
    return source;
  }

  /// 浮动导航和其他玻璃控件共用的主题底色。
  ///
  /// 默认使用 surface 与 primary 生成轻主题染色，而不是把玻璃写死成白色；
  /// 因此切换应用主题或自定义强调色时，这些控件会同步变化。
  static Color chromeSurfaceColor(
    BuildContext context, {
    Color? source,
    Brightness? brightness,
    double? opacity,
  }) {
    final scheme = Theme.of(context).colorScheme;
    final resolvedBrightness = brightness ?? scheme.brightness;
    final themedSource =
        source ??
        Color.lerp(
          scheme.surface,
          scheme.primary,
          resolvedBrightness == Brightness.light ? 0.08 : 0.06,
        )!;
    final base = chromeBaseColor(themedSource, resolvedBrightness);
    return base.withValues(
      alpha: effectiveOpacity(opacity ?? chromeOpacityFor(resolvedBrightness)),
    );
  }

  /// 浅色 chrome 使用调用方提供的主题色轻影，避免黑影污染内部。
  static Color chromeShadowColor({
    required Color source,
    required Brightness brightness,
    required double darkOpacity,
  }) {
    if (brightness == Brightness.light) {
      return source.withValues(alpha: 0.045);
    }
    return source.withValues(alpha: darkOpacity);
  }

  static bool get shouldDisableBlur => _disableAllGlassEffects;

  static double effectiveOpacity(double opacity) {
    if (_disableAllGlassEffects) return 1.0;
    return opacity.clamp(0.0, 1.0);
  }

  static Color surfaceColor(BuildContext context, {double opacity = 1.0}) {
    return Theme.of(
      context,
    ).colorScheme.surface.withValues(alpha: effectiveOpacity(opacity));
  }
}
