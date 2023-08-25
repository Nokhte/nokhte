import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/constants/water_colors.dart';
import 'package:simple_animations/simple_animations.dart';

class BackToShore extends Equatable {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: const Duration(seconds: 0),
      end: const Duration(
        seconds: 2,
      ),
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
            begin: WaterColors.oceanDiveWaterGradient[0],
            end: WaterColors.onShoreWaterGradient[0],
          ),
        )
        .tween(
          '2nd Water Gradient Color',
          ColorTween(
            begin: WaterColors.oceanDiveWaterGradient[1],
            end: WaterColors.onShoreWaterGradient[1],
          ),
        )
        .tween(
          '3rd Water Gradient Color',
          ColorTween(
            begin: WaterColors.oceanDiveWaterGradient[2],
            end: WaterColors.onShoreWaterGradient[2],
          ),
        )
        .tween(
          '4th Water Gradient Color',
          ColorTween(
            begin: WaterColors.oceanDiveWaterGradient[3],
            end: WaterColors.onShoreWaterGradient[3],
          ),
        )
        .tween(
          '5th Water Gradient Color',
          ColorTween(
            begin: WaterColors.oceanDiveWaterGradient[4],
            end: WaterColors.onShoreWaterGradient[4],
          ),
        )
    ..scene(
      begin: const Duration(seconds: 2),
      end: const Duration(
        seconds: 5,
      ),
    )
        .tween(
          'water movement',
          Tween<double>(begin: 100, end: -10.0),
        )
        .tween(
          '1st Water Gradient Color',
          ColorTween(
            begin: WaterColors.onShoreWaterGradient[0],
            end: WaterColors.onShoreWaterGradient[0],
          ),
        )
        .tween(
          '2nd Water Gradient Color',
          ColorTween(
            begin: WaterColors.onShoreWaterGradient[1],
            end: WaterColors.onShoreWaterGradient[1],
          ),
        )
        .tween(
          '3rd Water Gradient Color',
          ColorTween(
            begin: WaterColors.onShoreWaterGradient[2],
            end: WaterColors.onShoreWaterGradient[2],
          ),
        )
        .tween(
          '4th Water Gradient Color',
          ColorTween(
            begin: WaterColors.onShoreWaterGradient[3],
            end: WaterColors.onShoreWaterGradient[3],
          ),
        )
        .tween(
          '5th Water Gradient Color',
          ColorTween(
            begin: WaterColors.onShoreWaterGradient[4],
            end: WaterColors.onShoreWaterGradient[4],
          ),
        );

  @override
  List<Object> get props => [];
}
