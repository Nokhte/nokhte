import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';
import '../../../shared/data/water_colors_and_stops.dart';

class OceanDive extends Equatable {
  static MovieTween getOceanDiveMovie(
          {required double startingWaterMovement}) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(3),
        )
            .tween(
              'water movement',
              Tween<double>(
                begin: startingWaterMovement,
                end: 100,
              ),
            )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[0].color,
                end: WaterColorsAndStops.onShoreWater[0].color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[1].color,
                end: WaterColorsAndStops.onShoreWater[1].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[2].color,
                end: WaterColorsAndStops.onShoreWater[2].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[3].color,
                end: WaterColorsAndStops.onShoreWater[3].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[4].color,
                end: WaterColorsAndStops.onShoreWater[4].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[5].color,
                end: WaterColorsAndStops.onShoreWater[5].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[6].color,
                end: WaterColorsAndStops.onShoreWater[6].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[7].color,
                end: WaterColorsAndStops.onShoreWater[7].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[0].stop,
                end: WaterColorsAndStops.onShoreWater[0].stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[1].stop,
                end: WaterColorsAndStops.onShoreWater[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[2].stop,
                end: WaterColorsAndStops.onShoreWater[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[3].stop,
                end: WaterColorsAndStops.onShoreWater[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[4].stop,
                end: WaterColorsAndStops.onShoreWater[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[5].stop,
                end: WaterColorsAndStops.onShoreWater[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[6].stop,
                end: WaterColorsAndStops.onShoreWater[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[7].stop,
                end: WaterColorsAndStops.onShoreWater[7].stop,
              ),
            )
        ..scene(
          begin: Seconds.get(3),
          end: Seconds.get(5),
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
                begin: WaterColorsAndStops.onShoreWater[0].color,
                end: WaterColorsAndStops.oceanDiveWater[0].color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[1].color,
                end: WaterColorsAndStops.oceanDiveWater[1].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[2].color,
                end: WaterColorsAndStops.oceanDiveWater[2].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[3].color,
                end: WaterColorsAndStops.oceanDiveWater[3].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[4].color,
                end: WaterColorsAndStops.oceanDiveWater[4].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[5].color,
                end: WaterColorsAndStops.oceanDiveWater[5].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[6].color,
                end: WaterColorsAndStops.oceanDiveWater[6].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: WaterColorsAndStops.onShoreWater[7].color,
                end: WaterColorsAndStops.oceanDiveWater[7].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[0].stop,
                end: WaterColorsAndStops.oceanDiveWater[0].stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[1].stop,
                end: WaterColorsAndStops.oceanDiveWater[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[2].stop,
                end: WaterColorsAndStops.oceanDiveWater[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[3].stop,
                end: WaterColorsAndStops.oceanDiveWater[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[4].stop,
                end: WaterColorsAndStops.oceanDiveWater[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[5].stop,
                end: WaterColorsAndStops.oceanDiveWater[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[6].stop,
                end: WaterColorsAndStops.oceanDiveWater[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: WaterColorsAndStops.onShoreWater[7].stop,
                end: WaterColorsAndStops.oceanDiveWater[7].stop,
              ),
            );

  @override
  List<Object> get props => [];
}
