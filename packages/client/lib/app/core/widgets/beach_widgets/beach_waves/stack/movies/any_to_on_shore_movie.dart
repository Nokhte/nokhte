import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class AnyToShoreMovie {
  static bool get shouldPaintSand => true;
  static MovieTween getMovie(
    List<ColorAndStop> startingColors,
  ) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(3),
        )
            .tween(
              BeachWaveAnimationKeys.color1,
              ColorTween(
                begin: startingColors.first.color,
                end: WaterColorsAndStops.onShoreWater.first.color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color2,
              ColorTween(
                begin: startingColors[1].color,
                end: WaterColorsAndStops.onShoreWater[1].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color3,
              ColorTween(
                begin: startingColors[2].color,
                end: WaterColorsAndStops.onShoreWater[2].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color4,
              ColorTween(
                begin: startingColors[3].color,
                end: WaterColorsAndStops.onShoreWater[3].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color5,
              ColorTween(
                begin: startingColors[4].color,
                end: WaterColorsAndStops.onShoreWater[4].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color6,
              ColorTween(
                begin: startingColors[5].color,
                end: WaterColorsAndStops.onShoreWater[5].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color7,
              ColorTween(
                begin: startingColors[6].color,
                end: WaterColorsAndStops.onShoreWater[6].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color8,
              ColorTween(
                begin: startingColors[7].color,
                end: WaterColorsAndStops.onShoreWater[7].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop1,
              Tween<double>(
                begin: startingColors.first.stop,
                end: WaterColorsAndStops.onShoreWater.first.stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop2,
              Tween<double>(
                begin: startingColors[1].stop,
                end: WaterColorsAndStops.onShoreWater[1].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop3,
              Tween<double>(
                begin: startingColors[2].stop,
                end: WaterColorsAndStops.onShoreWater[2].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop4,
              Tween<double>(
                begin: startingColors[3].stop,
                end: WaterColorsAndStops.onShoreWater[3].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop5,
              Tween<double>(
                begin: startingColors[4].stop,
                end: WaterColorsAndStops.onShoreWater[4].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop6,
              Tween<double>(
                begin: startingColors[5].stop,
                end: WaterColorsAndStops.onShoreWater[5].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop7,
              Tween<double>(
                begin: startingColors[6].stop,
                end: WaterColorsAndStops.onShoreWater[6].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop8,
              Tween<double>(
                begin: startingColors[7].stop,
                end: WaterColorsAndStops.onShoreWater[7].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.waterMovement,
              Tween<double>(begin: 100, end: -10.0),
            );
}
