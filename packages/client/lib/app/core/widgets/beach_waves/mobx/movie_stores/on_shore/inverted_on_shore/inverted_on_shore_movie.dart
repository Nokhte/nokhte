import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class InvertedOnShoreMovie {
  static bool get shouldPaintSand => true;
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(2, milli: 1),
    )
        .tween(
          BeachWaveAnimationKeys.waterMovement,
          Tween<double>(
            begin: -10,
            end: 15,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color1,
          ColorTween(
            begin: WaterColorsAndStops.invertedBeachWater.first.color,
            end: WaterColorsAndStops.invertedBeachWater.first.color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color2,
          ColorTween(
            begin: WaterColorsAndStops.invertedBeachWater[1].color,
            end: WaterColorsAndStops.invertedBeachWater[1].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color3,
          ColorTween(
            begin: WaterColorsAndStops.invertedBeachWater[2].color,
            end: WaterColorsAndStops.invertedBeachWater[2].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color4,
          ColorTween(
            begin: WaterColorsAndStops.invertedBeachWater[3].color,
            end: WaterColorsAndStops.invertedBeachWater[3].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color5,
          ColorTween(
            begin: WaterColorsAndStops.invertedBeachWater[4].color,
            end: WaterColorsAndStops.invertedBeachWater[4].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color6,
          ColorTween(
            begin: WaterColorsAndStops.invertedBeachWater[5].color,
            end: WaterColorsAndStops.invertedBeachWater[5].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color7,
          ColorTween(
            begin: WaterColorsAndStops.invertedBeachWater[6].color,
            end: WaterColorsAndStops.invertedBeachWater[6].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color8,
          ColorTween(
            begin: WaterColorsAndStops.invertedBeachWater[7].color,
            end: WaterColorsAndStops.invertedBeachWater[7].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop1,
          Tween<double>(
            begin: WaterColorsAndStops.invertedBeachWater.first.stop,
            end: WaterColorsAndStops.invertedBeachWater.first.stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop2,
          Tween<double>(
            begin: WaterColorsAndStops.invertedBeachWater[1].stop,
            end: WaterColorsAndStops.invertedBeachWater[1].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop3,
          Tween<double>(
            begin: WaterColorsAndStops.invertedBeachWater[2].stop,
            end: WaterColorsAndStops.invertedBeachWater[2].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop4,
          Tween<double>(
            begin: WaterColorsAndStops.invertedBeachWater[3].stop,
            end: WaterColorsAndStops.invertedBeachWater[3].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop5,
          Tween<double>(
            begin: WaterColorsAndStops.invertedBeachWater[4].stop,
            end: WaterColorsAndStops.invertedBeachWater[4].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop6,
          Tween<double>(
            begin: WaterColorsAndStops.invertedBeachWater[5].stop,
            end: WaterColorsAndStops.invertedBeachWater[5].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop7,
          Tween<double>(
            begin: WaterColorsAndStops.invertedBeachWater[6].stop,
            end: WaterColorsAndStops.invertedBeachWater[6].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop8,
          Tween<double>(
            begin: WaterColorsAndStops.invertedBeachWater[7].stop,
            end: WaterColorsAndStops.invertedBeachWater[7].stop,
          ),
        );
}