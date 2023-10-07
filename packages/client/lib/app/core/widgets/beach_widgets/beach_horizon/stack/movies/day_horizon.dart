import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/beach_widgets/shared/data/water_colors_and_stops.dart';
import 'package:simple_animations/simple_animations.dart';
// 8 stop migration done

class DayHorizonWaters {
  static MovieTween get movie => MovieTween()
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
            end: WaterColorsAndStops.schedulingDayWater[0].color,
          ),
        )
        .tween(
          '2nd Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.toTheDepthsWater[1].color,
            end: WaterColorsAndStops.schedulingDayWater[1].color,
          ),
        )
        .tween(
          '3rd Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.toTheDepthsWater[2].color,
            end: WaterColorsAndStops.schedulingDayWater[2].color,
          ),
        )
        .tween(
          '4th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.toTheDepthsWater[3].color,
            end: WaterColorsAndStops.schedulingDayWater[3].color,
          ),
        )
        .tween(
          '5th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.toTheDepthsWater[4].color,
            end: WaterColorsAndStops.schedulingDayWater[4].color,
          ),
        )
        .tween(
          '6th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.toTheDepthsWater[5].color,
            end: WaterColorsAndStops.schedulingDayWater[5].color,
          ),
        )
        .tween(
          '7th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.toTheDepthsWater[6].color,
            end: WaterColorsAndStops.schedulingDayWater[6].color,
          ),
        )
        .tween(
          '8th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.toTheDepthsWater[7].color,
            end: WaterColorsAndStops.schedulingDayWater[7].color,
          ),
        )
        .tween(
          '1st Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.toTheDepthsWater[0].stop,
            end: WaterColorsAndStops.schedulingDayWater[0].stop,
          ),
        )
        .tween(
          '2nd Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.toTheDepthsWater[1].stop,
            end: WaterColorsAndStops.schedulingDayWater[1].stop,
          ),
        )
        .tween(
          '3rd Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.toTheDepthsWater[2].stop,
            end: WaterColorsAndStops.schedulingDayWater[2].stop,
          ),
        )
        .tween(
          '4th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.toTheDepthsWater[3].stop,
            end: WaterColorsAndStops.schedulingDayWater[3].stop,
          ),
        )
        .tween(
          '5th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.toTheDepthsWater[4].stop,
            end: WaterColorsAndStops.schedulingDayWater[4].stop,
          ),
        )
        .tween(
          '6th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.toTheDepthsWater[5].stop,
            end: WaterColorsAndStops.schedulingDayWater[5].stop,
          ),
        )
        .tween(
          '7th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.toTheDepthsWater[6].stop,
            end: WaterColorsAndStops.schedulingDayWater[6].stop,
          ),
        )
        .tween(
          '8th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.toTheDepthsWater[7].stop,
            end: WaterColorsAndStops.schedulingDayWater[7].stop,
          ),
        )
    ..scene(
      begin: const Duration(seconds: 2),
      end: const Duration(seconds: 4),
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
            begin: WaterColorsAndStops.schedulingDayWater[0].color,
            end: WaterColorsAndStops.schedulingDayWater[7].color,
          ),
        )
        .tween(
          '2nd Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[1].color,
            end: WaterColorsAndStops.schedulingDayWater[6].color,
          ),
        )
        .tween(
          '3rd Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[2].color,
            end: WaterColorsAndStops.schedulingDayWater[5].color,
          ),
        )
        .tween(
          '4th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[3].color,
            end: WaterColorsAndStops.schedulingDayWater[4].color,
          ),
        )
        .tween(
          '5th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[4].color,
            end: WaterColorsAndStops.schedulingDayWater[3].color,
          ),
        )
        .tween(
          '6th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[5].color,
            end: WaterColorsAndStops.schedulingDayWater[2].color,
          ),
        )
        .tween(
          '7th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[6].color,
            end: WaterColorsAndStops.schedulingDayWater[1].color,
          ),
        )
        .tween(
          '8th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[7].color,
            end: WaterColorsAndStops.schedulingDayWater[0].color,
          ),
        )
        .tween(
          '1st Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[0].stop,
            end: WaterColorsAndStops.schedulingDayWater[0].stop,
          ),
        )
        .tween(
          '2nd Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[1].stop,
            end: WaterColorsAndStops.schedulingDayWater[1].stop,
          ),
        )
        .tween(
          '3rd Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[2].stop,
            end: WaterColorsAndStops.schedulingDayWater[2].stop,
          ),
        )
        .tween(
          '4th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[3].stop,
            end: WaterColorsAndStops.schedulingDayWater[3].stop,
          ),
        )
        .tween(
          '5th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[4].stop,
            end: WaterColorsAndStops.schedulingDayWater[4].stop,
          ),
        )
        .tween(
          '6th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[5].stop,
            end: WaterColorsAndStops.schedulingDayWater[5].stop,
          ),
        )
        .tween(
          '7th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[6].stop,
            end: WaterColorsAndStops.schedulingDayWater[6].stop,
          ),
        )
        .tween(
          '8th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[7].stop,
            end: WaterColorsAndStops.schedulingDayWater[7].stop,
          ),
        )
    ..scene(
      begin: const Duration(seconds: 4),
      end: const Duration(seconds: 6),
    )
        .tween(
          'water movement',
          Tween<double>(
            begin: 0,
            end: 500,
          ),
        )
        .tween(
          '1st Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[7].color,
            end: WaterColorsAndStops.schedulingDayWater[7].color,
          ),
        )
        .tween(
          '2nd Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[6].color,
            end: WaterColorsAndStops.schedulingDayWater[6].color,
          ),
        )
        .tween(
          '3rd Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[5].color,
            end: WaterColorsAndStops.schedulingDayWater[5].color,
          ),
        )
        .tween(
          '4th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[4].color,
            end: WaterColorsAndStops.schedulingDayWater[4].color,
          ),
        )
        .tween(
          '5th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[3].color,
            end: WaterColorsAndStops.schedulingDayWater[3].color,
          ),
        )
        .tween(
          '6th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[2].color,
            end: WaterColorsAndStops.schedulingDayWater[2].color,
          ),
        )
        .tween(
          '7th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[1].color,
            end: WaterColorsAndStops.schedulingDayWater[1].color,
          ),
        )
        .tween(
          '8th Water Gradient Color',
          ColorTween(
            begin: WaterColorsAndStops.schedulingDayWater[0].color,
            end: WaterColorsAndStops.schedulingDayWater[0].color,
          ),
        )
        .tween(
          '1st Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[0].stop,
            end: WaterColorsAndStops.schedulingDayWater[0].stop,
          ),
        )
        .tween(
          '2nd Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[1].stop,
            end: WaterColorsAndStops.schedulingDayWater[1].stop,
          ),
        )
        .tween(
          '3rd Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[2].stop,
            end: WaterColorsAndStops.schedulingDayWater[2].stop,
          ),
        )
        .tween(
          '4th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[3].stop,
            end: WaterColorsAndStops.schedulingDayWater[3].stop,
          ),
        )
        .tween(
          '5th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[4].stop,
            end: WaterColorsAndStops.schedulingDayWater[4].stop,
          ),
        )
        .tween(
          '6th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[5].stop,
            end: WaterColorsAndStops.schedulingDayWater[5].stop,
          ),
        )
        .tween(
          '7th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[6].stop,
            end: WaterColorsAndStops.schedulingDayWater[6].stop,
          ),
        )
        .tween(
          '8th Water Gradient Stop',
          Tween<double>(
            begin: WaterColorsAndStops.schedulingDayWater[7].stop,
            end: WaterColorsAndStops.schedulingDayWater[7].stop,
          ),
        );
}
