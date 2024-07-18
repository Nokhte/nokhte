import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class EmptyOceanToInvertedDeepSeaMovie {
  static bool get shouldPaintSand => true;
  static MovieTween getMovie() => BeachWaveUtils.staticColors(
      MovieTween(), WaterColorsAndStops.invertedDeepSeaWater)
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(3),
    ).tween(
      BeachWaveAnimationKeys.waterMovement,
      Tween<double>(
        begin: -225,
        end: 100,
      ),
      curve: Curves.easeInOutCubic,
    );
}
