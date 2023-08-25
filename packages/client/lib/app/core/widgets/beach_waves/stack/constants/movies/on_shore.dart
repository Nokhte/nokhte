import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/constants/data/water_colors_and_stops.dart';
import 'package:simple_animations/simple_animations.dart';
// 8 stop migration done

class OnShore extends Equatable {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: const Duration(seconds: 0),
      end: const Duration(seconds: 2),
    )
        .tween(
          'water movement',
          Tween<double>(
            begin: -10,
            end: 15,
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
        );
  @override
  List<Object> get props => [];
}
