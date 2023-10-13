import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/beach_widgets/shared/data/water_colors_and_stops.dart';
import 'package:primala/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class DepthsToHorizonWaters {
  static MovieTween getMovie(List<ColorAndStop> gradientColorsAndStops) =>
      MovieTween()
        ..scene(
          begin: const Duration(seconds: 0),
          end: const Duration(seconds: 2),
        )
            .tween(
              'water movement',
              Tween<double>(
                begin: 0,
                end: 0,
              ),
            )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[0].color,
                end: gradientColorsAndStops[0].color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[1].color,
                end: gradientColorsAndStops[1].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[2].color,
                end: gradientColorsAndStops[2].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[3].color,
                end: gradientColorsAndStops[3].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[4].color,
                end: gradientColorsAndStops[4].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[5].color,
                end: gradientColorsAndStops[5].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[6].color,
                end: gradientColorsAndStops[6].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[7].color,
                end: gradientColorsAndStops[7].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[0].stop,
                end: gradientColorsAndStops[0].stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[1].stop,
                end: gradientColorsAndStops[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[2].stop,
                end: gradientColorsAndStops[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[3].stop,
                end: gradientColorsAndStops[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[4].stop,
                end: gradientColorsAndStops[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[5].stop,
                end: gradientColorsAndStops[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[6].stop,
                end: gradientColorsAndStops[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[7].stop,
                end: gradientColorsAndStops[7].stop,
              ),
            )
        ..scene(
          begin: const Duration(seconds: 2),
          end: const Duration(seconds: 4),
        )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[0].color,
                end: gradientColorsAndStops[7].color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[1].color,
                end: gradientColorsAndStops[6].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[2].color,
                end: gradientColorsAndStops[5].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[3].color,
                end: gradientColorsAndStops[4].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[4].color,
                end: gradientColorsAndStops[3].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[5].color,
                end: gradientColorsAndStops[2].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[6].color,
                end: gradientColorsAndStops[1].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[7].color,
                end: gradientColorsAndStops[0].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[0].stop,
                end: gradientColorsAndStops[0].stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[1].stop,
                end: gradientColorsAndStops[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[2].stop,
                end: gradientColorsAndStops[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[3].stop,
                end: gradientColorsAndStops[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[4].stop,
                end: gradientColorsAndStops[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[5].stop,
                end: gradientColorsAndStops[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[6].stop,
                end: gradientColorsAndStops[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[7].stop,
                end: gradientColorsAndStops[7].stop,
              ),
            )
        ..scene(
          begin: const Duration(seconds: 4),
          end: const Duration(seconds: 6),
        )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[7].color,
                end: gradientColorsAndStops[7].color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[6].color,
                end: gradientColorsAndStops[6].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[5].color,
                end: gradientColorsAndStops[5].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[4].color,
                end: gradientColorsAndStops[4].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[3].color,
                end: gradientColorsAndStops[3].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[2].color,
                end: gradientColorsAndStops[2].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[1].color,
                end: gradientColorsAndStops[1].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: gradientColorsAndStops[0].color,
                end: gradientColorsAndStops[0].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[0].stop,
                end: gradientColorsAndStops[0].stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[1].stop,
                end: gradientColorsAndStops[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[2].stop,
                end: gradientColorsAndStops[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[3].stop,
                end: gradientColorsAndStops[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[4].stop,
                end: gradientColorsAndStops[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[5].stop,
                end: gradientColorsAndStops[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[6].stop,
                end: gradientColorsAndStops[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: gradientColorsAndStops[7].stop,
                end: gradientColorsAndStops[7].stop,
              ),
            )
        ..scene(
                begin: const Duration(seconds: 4),
                end: const Duration(seconds: 8))
            .tween(
          'water movement',
          Tween<double>(
            begin: 0,
            end: 510,
          ),
        )
        ..scene(
          begin: const Duration(seconds: 8),
          end: const Duration(
            seconds: 8,
            milliseconds: 800,
            // seconds: 9,
            // milliseconds: 500,
          ),
        ).tween(
          'water movement',
          Tween<double>(
            begin: 510,
            end: 500,
          ),
        );
}
