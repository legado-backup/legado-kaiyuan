#include <flutter/runtime_effect.glsl>

// The engine supplies the input texture's physical dimensions and sampler.
uniform vec2 uSize;
uniform float uClearHeight;
uniform float uMaxSigma;
uniform vec2 uDirection;
uniform sampler2D uInput;
out vec4 fragColor;

void main() {
  vec2 position = FlutterFragCoord().xy;
  // The seed sampler is linear + clamp-to-edge (dart:ui setImageSampler).
  // Normalize once per fragment instead of dividing and clamping every tap.
  vec2 uv = position / uSize;
  vec2 texelDirection = uDirection / uSize;
#ifdef IMPELLER_TARGET_OPENGLES
  uv.y = 1.0 - uv.y;
  texelDirection.y = -texelDirection.y;
#endif
  float progress = clamp(position.y / max(uClearHeight, 1.0), 0.0, 1.0);
  float sigma = uMaxSigma * (1.0 - progress);
  if (sigma < 0.1) {
    fragColor = texture(uInput, uv);
    return;
  }

  // Combine adjacent discrete Gaussian taps using the linear input sampler.
  // Unlike sparse quadrature, every physical source pixel contributes; pairing
  // halves texture reads without changing the Gaussian kernel or its radius.
  vec4 total = texture(uInput, uv);
  float weightSum = 1.0;
  float coefficient = 1.0;
  float ratio = exp(-0.5 / (sigma * sigma));
  float ratioStep = ratio * ratio;
  int radius = int(ceil(3.0 * sigma));
  bool reflectTop = uDirection.y != 0.0 && position.y < float(radius);
  bool reflectSide = uDirection.x != 0.0 &&
      (position.x < float(radius) || position.x > uSize.x - float(radius));
  for (int i = 1; i <= 384; i += 2) {
    if (i > radius) break;
    coefficient *= ratio;
    ratio *= ratioStep;
    float firstWeight = coefficient;
    coefficient *= ratio;
    ratio *= ratioStep;
    float secondWeight = i + 1 <= radius ? coefficient : 0.0;
    float pairWeight = firstWeight + secondWeight;
    // At very small sigma, the finite tail may underflow to zero.
    if (pairWeight < 0.000001) break;
    float offset = float(i) + secondWeight / pairWeight;
    vec2 delta = texelDirection * offset;
    vec2 before = uv - delta;
    vec2 after = uv + delta;
    // Clamp-to-edge repeats the first pixel for every offscreen tap. While
    // scrolling, a one-pixel change at the top then controls half the kernel
    // and flashes. Reflect vertical taps into the live backdrop instead.
    if (reflectTop) {
#ifdef IMPELLER_TARGET_OPENGLES
      before.y = 1.0 - abs(1.0 - before.y);
      after.y = 1.0 - abs(1.0 - after.y);
#else
      before.y = abs(before.y);
      after.y = abs(after.y);
#endif
    }
    // The horizontal pass should not repeat a single side column for half
    // its kernel. Mirror the live content just as the vertical pass does at
    // the screen top; only edge fragments enter this branch.
    if (reflectSide) {
      before.x = abs(before.x);
      after.x = 1.0 - abs(1.0 - after.x);
    }
    total += (texture(uInput, before) + texture(uInput, after))
        * pairWeight;
    weightSum += 2.0 * pairWeight;
  }
  fragColor = total / weightSum;
}
