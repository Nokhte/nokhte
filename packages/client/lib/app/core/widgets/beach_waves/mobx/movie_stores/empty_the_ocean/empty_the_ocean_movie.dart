import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class EmptyTheOceanMovie {
  static bool get shouldPaintSand => true;
  static MovieTween getMovie({
    required double startingWaterMovement,
    required List<ColorAndStop> waterColor,
  }) =>
      BeachWaveUtils.staticColors(MovieTween(), waterColor)
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(3),
        ).tween(
          BeachWaveAnimationKeys.waterMovement,
          Tween<double>(
            begin: startingWaterMovement,
            end: -225,
          ),
          curve: Curves.easeInOutCubic,
        );
}
