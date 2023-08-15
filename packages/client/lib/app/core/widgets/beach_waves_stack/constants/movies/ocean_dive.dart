import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/constants/water_colors.dart';
import 'package:simple_animations/simple_animations.dart';

class OceanDive extends Equatable {
  static MovieTween getOceanDiveMovie(
          {required double startingWaterMovement}) =>
      MovieTween()
        ..scene(
          begin: const Duration(seconds: 0),
          end: const Duration(seconds: 3),
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
                begin: WaterColors.firstWaterGradient[0],
                end: WaterColors.firstWaterGradient[0],
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: WaterColors.firstWaterGradient[1],
                end: WaterColors.firstWaterGradient[1],
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: WaterColors.firstWaterGradient[2],
                end: WaterColors.firstWaterGradient[2],
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: WaterColors.firstWaterGradient[3],
                end: WaterColors.firstWaterGradient[3],
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: WaterColors.firstWaterGradient[4],
                end: WaterColors.firstWaterGradient[4],
              ),
            )
        ..scene(
          begin: const Duration(seconds: 3),
          end: const Duration(seconds: 5),
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
                begin: WaterColors.firstWaterGradient[0],
                end: WaterColors.secondWaterGradient[0],
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: WaterColors.firstWaterGradient[1],
                end: WaterColors.secondWaterGradient[1],
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: WaterColors.firstWaterGradient[2],
                end: WaterColors.secondWaterGradient[2],
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: WaterColors.firstWaterGradient[3],
                end: WaterColors.secondWaterGradient[3],
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: WaterColors.firstWaterGradient[4],
                end: WaterColors.secondWaterGradient[4],
              ),
            );

  @override
  List<Object> get props => [];
}
