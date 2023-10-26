import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:simple_animations/simple_animations.dart';

class HorizonWatersToShore {
  static MovieTween getMovie(List<ColorAndStop> startingGradient) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(2),
        )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: startingGradient[0].color,
                end: WaterColorsAndStops.onShoreWater[0].color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: startingGradient[1].color,
                end: WaterColorsAndStops.onShoreWater[1].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: startingGradient[2].color,
                end: WaterColorsAndStops.onShoreWater[2].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: startingGradient[3].color,
                end: WaterColorsAndStops.onShoreWater[3].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: startingGradient[4].color,
                end: WaterColorsAndStops.onShoreWater[4].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: startingGradient[5].color,
                end: WaterColorsAndStops.onShoreWater[5].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: startingGradient[6].color,
                end: WaterColorsAndStops.onShoreWater[6].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: startingGradient[7].color,
                end: WaterColorsAndStops.onShoreWater[7].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[0].stop,
                end: WaterColorsAndStops.onShoreWater[0].stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[1].stop,
                end: WaterColorsAndStops.onShoreWater[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[2].stop,
                end: WaterColorsAndStops.onShoreWater[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[3].stop,
                end: WaterColorsAndStops.onShoreWater[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[4].stop,
                end: WaterColorsAndStops.onShoreWater[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[5].stop,
                end: WaterColorsAndStops.onShoreWater[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[6].stop,
                end: WaterColorsAndStops.onShoreWater[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[7].stop,
                end: WaterColorsAndStops.onShoreWater[7].stop,
              ),
            )
            .tween(
              'water value',
              Tween<double>(
                begin: 500.0,
                end: 0.0,
              ),
            );
}
