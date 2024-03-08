import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';

class ResumeOnShoreMovie {
  static bool get shouldPaintSand => true;
  static MovieTween getMovie(ResumeOnShoreParams params) => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: calculateDuration(params),
    )
        .tween(
          BeachWaveAnimationKeys.waterMovement,
          Tween<double>(
            begin: params.position,
            end: params.direction == WaterDirection.up ? -10.0 : 15.0,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color1,
          ColorTween(
            begin: WaterColorsAndStops.onShoreWater.first.color,
            end: WaterColorsAndStops.onShoreWater.first.color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color2,
          ColorTween(
            begin: WaterColorsAndStops.onShoreWater[1].color,
            end: WaterColorsAndStops.onShoreWater[1].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color3,
          ColorTween(
            begin: WaterColorsAndStops.onShoreWater[2].color,
            end: WaterColorsAndStops.onShoreWater[2].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color4,
          ColorTween(
            begin: WaterColorsAndStops.onShoreWater[3].color,
            end: WaterColorsAndStops.onShoreWater[3].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color5,
          ColorTween(
            begin: WaterColorsAndStops.onShoreWater[4].color,
            end: WaterColorsAndStops.onShoreWater[4].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color6,
          ColorTween(
            begin: WaterColorsAndStops.onShoreWater[5].color,
            end: WaterColorsAndStops.onShoreWater[5].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color7,
          ColorTween(
            begin: WaterColorsAndStops.onShoreWater[6].color,
            end: WaterColorsAndStops.onShoreWater[6].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color8,
          ColorTween(
            begin: WaterColorsAndStops.onShoreWater[7].color,
            end: WaterColorsAndStops.onShoreWater[7].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop1,
          Tween<double>(
            begin: WaterColorsAndStops.onShoreWater.first.stop,
            end: WaterColorsAndStops.onShoreWater.first.stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop2,
          Tween<double>(
            begin: WaterColorsAndStops.onShoreWater[1].stop,
            end: WaterColorsAndStops.onShoreWater[1].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop3,
          Tween<double>(
            begin: WaterColorsAndStops.onShoreWater[2].stop,
            end: WaterColorsAndStops.onShoreWater[2].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop4,
          Tween<double>(
            begin: WaterColorsAndStops.onShoreWater[3].stop,
            end: WaterColorsAndStops.onShoreWater[3].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop5,
          Tween<double>(
            begin: WaterColorsAndStops.onShoreWater[4].stop,
            end: WaterColorsAndStops.onShoreWater[4].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop6,
          Tween<double>(
            begin: WaterColorsAndStops.onShoreWater[5].stop,
            end: WaterColorsAndStops.onShoreWater[5].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop7,
          Tween<double>(
            begin: WaterColorsAndStops.onShoreWater[6].stop,
            end: WaterColorsAndStops.onShoreWater[6].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop8,
          Tween<double>(
            begin: WaterColorsAndStops.onShoreWater[7].stop,
            end: WaterColorsAndStops.onShoreWater[7].stop,
          ),
        );

  static Duration calculateDuration(ResumeOnShoreParams params) {
    double minValue = -10.0;
    double maxValue = 15.0;

    double totalDistance = maxValue - minValue;

    double timeInSeconds = 2001 / 1000.0;

    double speed = totalDistance / timeInSeconds;

    double distanceFromStart;
    if (params.direction == WaterDirection.up) {
      distanceFromStart = params.position - minValue;
    } else {
      distanceFromStart = maxValue - params.position;
    }

    double durationInSeconds = distanceFromStart / speed;

    int durationMillis = (durationInSeconds * 1000).round();

    return Duration(milliseconds: durationMillis);
  }
}
