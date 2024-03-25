import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:simple_animations/simple_animations.dart';

class ImmersionBackToShore {
  static MovieTween getMovie(double startingPoint) => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(4),
    )
        .tween(
          '1st Water Gradient Color',
          ColorTween(
            begin:
                DeprecatedWaterColorsAndStops.audioImmersionWater.first.color,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater.first.color,
          ),
        )
        .tween(
          '2nd Water Gradient Color',
          ColorTween(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[1].color,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[1].color,
          ),
        )
        .tween(
          '3rd Water Gradient Color',
          ColorTween(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[2].color,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[2].color,
          ),
        )
        .tween(
          '4th Water Gradient Color',
          ColorTween(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[3].color,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[3].color,
          ),
        )
        .tween(
          '5th Water Gradient Color',
          ColorTween(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[4].color,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[4].color,
          ),
        )
        .tween(
          '6th Water Gradient Color',
          ColorTween(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[5].color,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[5].color,
          ),
        )
        .tween(
          '7th Water Gradient Color',
          ColorTween(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[6].color,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[6].color,
          ),
        )
        .tween(
          '8th Water Gradient Color',
          ColorTween(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[7].color,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[7].color,
          ),
        )
        .tween(
          '1st Water Gradient Stop',
          Tween<double>(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater.first.stop,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater.first.stop,
          ),
        )
        .tween(
          '2nd Water Gradient Stop',
          Tween<double>(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[1].stop,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[1].stop,
          ),
        )
        .tween(
          '3rd Water Gradient Stop',
          Tween<double>(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[2].stop,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[2].stop,
          ),
        )
        .tween(
          '4th Water Gradient Stop',
          Tween<double>(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[3].stop,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[3].stop,
          ),
        )
        .tween(
          '5th Water Gradient Stop',
          Tween<double>(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[4].stop,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[4].stop,
          ),
        )
        .tween(
          '6th Water Gradient Stop',
          Tween<double>(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[5].stop,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[5].stop,
          ),
        )
        .tween(
          '7th Water Gradient Stop',
          Tween<double>(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[6].stop,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[6].stop,
          ),
        )
        .tween(
          '8th Water Gradient Stop',
          Tween<double>(
            begin: DeprecatedWaterColorsAndStops.audioImmersionWater[7].stop,
            end: DeprecatedWaterColorsAndStops.audioImmersionWater[7].stop,
          ),
        )
        .tween(
          'water value',
          Tween<double>(
            begin: startingPoint,
            end: 1000,
          ),
        );
}
