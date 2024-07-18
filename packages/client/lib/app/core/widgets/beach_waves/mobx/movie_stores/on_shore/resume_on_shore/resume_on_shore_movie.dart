import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class ResumeOnShoreMovie {
  static bool get shouldPaintSand => true;
  static MovieTween getMovie(ResumeOnShoreParams params) {
    final waterColor = params.isInverted
        ? WaterColorsAndStops.invertedBeachWater
        : WaterColorsAndStops.onShoreWater;
    return BeachWaveUtils.staticColors(MovieTween(), waterColor)
      ..scene(
        begin: Seconds.get(0),
        end: calculateDuration(params),
      ).tween(
        BeachWaveAnimationKeys.waterMovement,
        Tween<double>(
          begin: params.position,
          end: params.direction == WaterDirection.up ? -10.0 : 15.0,
        ),
      );
  }

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
