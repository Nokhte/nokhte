import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:simple_animations/simple_animations.dart';

class BlackOutMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'water movement',
          Tween<double>(
            begin: 100,
            end: 100,
          ),
        )
        .tween(
          '1st Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.blackOut.first.color,
            end: WaterColorsAndStops.blackOut.first.color,
          ),
        )
        .tween(
          '2nd Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.blackOut[1].color,
            end: WaterColorsAndStops.blackOut[1].color,
          ),
        )
        .tween(
          '3rd Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.blackOut[2].color,
            end: WaterColorsAndStops.blackOut[2].color,
          ),
        )
        .tween(
          '4th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.blackOut[3].color,
            end: WaterColorsAndStops.blackOut[3].color,
          ),
        )
        .tween(
          '5th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.blackOut[4].color,
            end: WaterColorsAndStops.blackOut[4].color,
          ),
        )
        .tween(
          '6th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.blackOut[5].color,
            end: WaterColorsAndStops.blackOut[5].color,
          ),
        )
        .tween(
          '7th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.blackOut[6].color,
            end: WaterColorsAndStops.blackOut[6].color,
          ),
        )
        .tween(
          '8th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.blackOut[7].color,
            end: WaterColorsAndStops.blackOut[7].color,
          ),
        )
        .tween(
          '1st Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.blackOut.first.stop,
            end: WaterColorsAndStops.blackOut.first.stop,
          ),
        )
        .tween(
          '2nd Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.blackOut[1].stop,
            end: WaterColorsAndStops.blackOut[1].stop,
          ),
        )
        .tween(
          '3rd Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.blackOut[2].stop,
            end: WaterColorsAndStops.blackOut[2].stop,
          ),
        )
        .tween(
          '4th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.blackOut[3].stop,
            end: WaterColorsAndStops.blackOut[3].stop,
          ),
        )
        .tween(
          '5th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.blackOut[4].stop,
            end: WaterColorsAndStops.blackOut[4].stop,
          ),
        )
        .tween(
          '6th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.blackOut[5].stop,
            end: WaterColorsAndStops.blackOut[5].stop,
          ),
        )
        .tween(
          '7th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.blackOut[6].stop,
            end: WaterColorsAndStops.blackOut[6].stop,
          ),
        )
        .tween(
          '8th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.blackOut[7].stop,
            end: WaterColorsAndStops.blackOut[7].stop,
          ),
        );
}
