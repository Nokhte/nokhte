import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_waves/beach_waves.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class OnShoreMovie {
  static bool get shouldPaintSand => true;
  static MovieTween getMovie({
    required bool shouldInvert,
    required WaterDirection startingDirection,
  }) {
    final color = shouldInvert
        ? WaterColorsAndStops.invertedBeachWater
        : WaterColorsAndStops.onShoreWater;
    return BeachWaveUtils.staticColors(MovieTween(), color)
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(2),
      ).tween(
        BeachWaveAnimationKeys.waterMovement,
        Tween<double>(
          begin: startingDirection == WaterDirection.down ? -10 : 15,
          end: startingDirection == WaterDirection.down ? 15 : -10,
        ),
      );
  }
}
