import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/constants/data/water_colors_and_stops.dart';
import 'package:simple_animations/simple_animations.dart';

class BackToTheDepths {
  static MovieTween getMovie({
    required Color startingFirstGradient,
    required Color startingSecondGradient,
    required Color startingThirdGradient,
    required Color startingFourthGradient,
    required Color startingFifthGradient,
    required Color startingSixthGradient,
    required Color startingSeventhGradient,
    required Color startingEighthGradient,
  }) {
    return MovieTween()
      ..scene(
        begin: const Duration(seconds: 0),
        end: const Duration(seconds: 3),
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
              begin: startingFirstGradient,
              end: WaterColorsAndStops.toTheDepthsWater[0].color,
            ),
          )
          .tween(
            '2nd Water Gradient Color',
            ColorTween(
              begin: startingSecondGradient,
              end: WaterColorsAndStops.toTheDepthsWater[1].color,
            ),
          )
          .tween(
            '3rd Water Gradient Color',
            ColorTween(
              begin: startingThirdGradient,
              end: WaterColorsAndStops.toTheDepthsWater[2].color,
            ),
          )
          .tween(
            '4th Water Gradient Color',
            ColorTween(
              begin: startingFourthGradient,
              end: WaterColorsAndStops.toTheDepthsWater[3].color,
            ),
          )
          .tween(
            '5th Water Gradient Color',
            ColorTween(
              begin: startingFifthGradient,
              end: WaterColorsAndStops.toTheDepthsWater[4].color,
            ),
          )
          .tween(
            '6th Water Gradient Color',
            ColorTween(
              begin: startingSixthGradient,
              end: WaterColorsAndStops.toTheDepthsWater[5].color,
            ),
          )
          .tween(
            '7th Water Gradient Color',
            ColorTween(
              begin: startingSeventhGradient,
              end: WaterColorsAndStops.toTheDepthsWater[6].color,
            ),
          )
          .tween(
            '8th Water Gradient Color',
            ColorTween(
              begin: startingEighthGradient,
              end: WaterColorsAndStops.toTheDepthsWater[7].color,
            ),
          )
          .tween(
            '1st Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase8[0].stop,
              end: WaterColorsAndStops.toTheDepthsWater[0].stop,
            ),
          )
          .tween(
            '2nd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase8[1].stop,
              end: WaterColorsAndStops.toTheDepthsWater[1].stop,
            ),
          )
          .tween(
            '3rd Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase8[2].stop,
              end: WaterColorsAndStops.toTheDepthsWater[2].stop,
            ),
          )
          .tween(
            '4th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase8[3].stop,
              end: WaterColorsAndStops.toTheDepthsWater[3].stop,
            ),
          )
          .tween(
            '5th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase8[4].stop,
              end: WaterColorsAndStops.toTheDepthsWater[4].stop,
            ),
          )
          .tween(
            '6th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase8[5].stop,
              end: WaterColorsAndStops.toTheDepthsWater[5].stop,
            ),
          )
          .tween(
            '7th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase8[6].stop,
              end: WaterColorsAndStops.toTheDepthsWater[6].stop,
            ),
          )
          .tween(
            '8th Water Gradient Stop',
            Tween<double>(
              begin: WaterColorsAndStops.timesUpPhase8[7].stop,
              end: WaterColorsAndStops.toTheDepthsWater[7].stop,
            ),
          );
  }
}
