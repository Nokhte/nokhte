import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class DynamicToTimesUpStart extends BaseBeachWaveMovie {
  static MovieTween getMovie({
    required List<ColorAndStop> startingColors,
  }) {
    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(2),
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
              begin: startingColors.first.color,
              end: WaterColorsAndStops.toTheDepthsWater.first.color,
            ),
          )
          .tween(
            '2nd Water Gradient Color',
            ColorTween(
              begin: startingColors[1].color,
              end: WaterColorsAndStops.toTheDepthsWater[1].color,
            ),
          )
          .tween(
            '3rd Water Gradient Color',
            ColorTween(
              begin: startingColors[2].color,
              end: WaterColorsAndStops.toTheDepthsWater[2].color,
            ),
          )
          .tween(
            '4th Water Gradient Color',
            ColorTween(
              begin: startingColors[3].color,
              end: WaterColorsAndStops.toTheDepthsWater[3].color,
            ),
          )
          .tween(
            '5th Water Gradient Color',
            ColorTween(
              begin: startingColors[4].color,
              end: WaterColorsAndStops.toTheDepthsWater[4].color,
            ),
          )
          .tween(
            '6th Water Gradient Color',
            ColorTween(
              begin: startingColors[5].color,
              end: WaterColorsAndStops.toTheDepthsWater[5].color,
            ),
          )
          .tween(
            '7th Water Gradient Color',
            ColorTween(
              begin: startingColors[6].color,
              end: WaterColorsAndStops.toTheDepthsWater[6].color,
            ),
          )
          .tween(
            '8th Water Gradient Color',
            ColorTween(
              begin: startingColors[7].color,
              end: WaterColorsAndStops.toTheDepthsWater[7].color,
            ),
          )
          .tween(
            '1st Water Gradient Stop',
            Tween<double>(
              begin: startingColors.first.stop,
              end: WaterColorsAndStops.toTheDepthsWater.first.stop,
            ),
          )
          .tween(
            '2nd Water Gradient Stop',
            Tween<double>(
              begin: startingColors[1].stop,
              end: WaterColorsAndStops.toTheDepthsWater[1].stop,
            ),
          )
          .tween(
            '3rd Water Gradient Stop',
            Tween<double>(
              begin: startingColors[2].stop,
              end: WaterColorsAndStops.toTheDepthsWater[2].stop,
            ),
          )
          .tween(
            '4th Water Gradient Stop',
            Tween<double>(
              begin: startingColors[3].stop,
              end: WaterColorsAndStops.toTheDepthsWater[3].stop,
            ),
          )
          .tween(
            '5th Water Gradient Stop',
            Tween<double>(
              begin: startingColors[4].stop,
              end: WaterColorsAndStops.toTheDepthsWater[4].stop,
            ),
          )
          .tween(
            '6th Water Gradient Stop',
            Tween<double>(
              begin: startingColors[5].stop,
              end: WaterColorsAndStops.toTheDepthsWater[5].stop,
            ),
          )
          .tween(
            '7th Water Gradient Stop',
            Tween<double>(
              begin: startingColors[6].stop,
              end: WaterColorsAndStops.toTheDepthsWater[6].stop,
            ),
          )
          .tween(
            '8th Water Gradient Stop',
            Tween<double>(
              begin: startingColors[7].stop,
              end: WaterColorsAndStops.toTheDepthsWater[7].stop,
            ),
          );
  }

  @override
  List<Object> get props => [];
}
