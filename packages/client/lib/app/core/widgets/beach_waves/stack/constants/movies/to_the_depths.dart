import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/constants/water_colors.dart';
import 'package:simple_animations/simple_animations.dart';

class ToTheDepths extends Equatable {
  static MovieTween get movie => MovieTween()
    ..scene(begin: const Duration(seconds: 0), end: const Duration(seconds: 3))
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
            begin: WaterColors.oceanDiveWaterGradient[0],
            end: WaterColors.toTheDepthsWaterGradient[0],
          ),
        )
        .tween(
          '2nd Water Gradient Color',
          ColorTween(
            begin: WaterColors.oceanDiveWaterGradient[1],
            end: WaterColors.toTheDepthsWaterGradient[1],
          ),
        )
        .tween(
          '3rd Water Gradient Color',
          ColorTween(
            begin: WaterColors.oceanDiveWaterGradient[2],
            end: WaterColors.toTheDepthsWaterGradient[2],
          ),
        )
        .tween(
          '4th Water Gradient Color',
          ColorTween(
            begin: WaterColors.oceanDiveWaterGradient[3],
            end: WaterColors.toTheDepthsWaterGradient[3],
          ),
        )
        .tween(
          '5th Water Gradient Color',
          ColorTween(
            begin: WaterColors.oceanDiveWaterGradient[4],
            end: WaterColors.toTheDepthsWaterGradient[4],
          ),
        );

  @override
  List<Object> get props => [];
}
