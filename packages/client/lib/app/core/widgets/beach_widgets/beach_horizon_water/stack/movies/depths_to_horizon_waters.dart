import 'package:flutter/material.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/beach_widgets/shared/data/water_colors_and_stops.dart';
import 'package:primala/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class DepthsToHorizonWaters {
  static MovieTween getMovie(
    List<ColorAndStop> fullScreenGradientColorsAndStops,
    List<ColorAndStop> halfScreenGradientColorsAndStops,
  ) =>
      MovieTween()
        ..scene(
          begin: const Duration(seconds: 0),
          end: const Duration(seconds: 2),
        )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[0].color,
                end: fullScreenGradientColorsAndStops[0].color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[1].color,
                end: fullScreenGradientColorsAndStops[1].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[2].color,
                end: fullScreenGradientColorsAndStops[2].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[3].color,
                end: fullScreenGradientColorsAndStops[3].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[4].color,
                end: fullScreenGradientColorsAndStops[4].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[5].color,
                end: fullScreenGradientColorsAndStops[5].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[6].color,
                end: fullScreenGradientColorsAndStops[6].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.toTheDepthsWater[7].color,
                end: fullScreenGradientColorsAndStops[7].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[0].stop,
                end: fullScreenGradientColorsAndStops[0].stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[1].stop,
                end: fullScreenGradientColorsAndStops[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[2].stop,
                end: fullScreenGradientColorsAndStops[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[3].stop,
                end: fullScreenGradientColorsAndStops[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[4].stop,
                end: fullScreenGradientColorsAndStops[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[5].stop,
                end: fullScreenGradientColorsAndStops[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[6].stop,
                end: fullScreenGradientColorsAndStops[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.toTheDepthsWater[7].stop,
                end: fullScreenGradientColorsAndStops[7].stop,
              ),
            )
        ..scene(
          begin: const Duration(seconds: 2),
          end: const Duration(seconds: 4),
        )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[0].color,
                end: halfScreenGradientColorsAndStops[0].color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[1].color,
                end: halfScreenGradientColorsAndStops[1].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[2].color,
                end: halfScreenGradientColorsAndStops[2].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[3].color,
                end: halfScreenGradientColorsAndStops[3].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[4].color,
                end: halfScreenGradientColorsAndStops[4].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[5].color,
                end: halfScreenGradientColorsAndStops[5].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[6].color,
                end: halfScreenGradientColorsAndStops[6].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[7].color,
                end: halfScreenGradientColorsAndStops[7].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[0].stop,
                end: fullScreenGradientColorsAndStops[0].stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[1].stop,
                end: fullScreenGradientColorsAndStops[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[2].stop,
                end: fullScreenGradientColorsAndStops[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[3].stop,
                end: fullScreenGradientColorsAndStops[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[4].stop,
                end: fullScreenGradientColorsAndStops[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[5].stop,
                end: fullScreenGradientColorsAndStops[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[6].stop,
                end: fullScreenGradientColorsAndStops[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[7].stop,
                end: fullScreenGradientColorsAndStops[7].stop,
              ),
            )
        ..scene(
          begin: const Duration(seconds: 4),
          end: const Duration(seconds: 6),
        )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[0].color,
                end: halfScreenGradientColorsAndStops[0].color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[1].color,
                end: halfScreenGradientColorsAndStops[1].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[2].color,
                end: halfScreenGradientColorsAndStops[2].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[3].color,
                end: halfScreenGradientColorsAndStops[3].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[4].color,
                end: halfScreenGradientColorsAndStops[4].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[5].color,
                end: halfScreenGradientColorsAndStops[5].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[6].color,
                end: halfScreenGradientColorsAndStops[6].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[7].color,
                end: halfScreenGradientColorsAndStops[7].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[0].stop,
                end: halfScreenGradientColorsAndStops[0].stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[1].stop,
                end: halfScreenGradientColorsAndStops[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[2].stop,
                end: halfScreenGradientColorsAndStops[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[3].stop,
                end: halfScreenGradientColorsAndStops[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[4].stop,
                end: halfScreenGradientColorsAndStops[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[5].stop,
                end: halfScreenGradientColorsAndStops[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[6].stop,
                end: halfScreenGradientColorsAndStops[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[7].stop,
                end: halfScreenGradientColorsAndStops[7].stop,
              ),
            )
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(2),
        ).tween(
          'water value',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        ..scene(
          begin: Seconds.get(2),
          end: Seconds.get(6),
        ).tween(
          'water value',
          Tween<double>(
            begin: 0,
            end: 490,
          ),
        )
        ..scene(
          begin: const Duration(seconds: 6),
          end: const Duration(
            seconds: 6,
            milliseconds: 800,
          ),
        ).tween(
          'sky value',
          Tween<double>(
            begin: 490.0,
            end: 500.0,
          ),
        );
}
