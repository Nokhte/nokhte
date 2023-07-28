import 'package:flutter/material.dart';
import 'package:primala/app/core/breathing_pentagons_stack/constants/pentagon_colors.dart';
import 'package:simple_animations/simple_animations.dart';

class AggressiveExpansion {
  static MovieTween get movie => MovieTween()
    // initial spin
    ..scene(begin: const Duration(seconds: 0), end: const Duration(seconds: 6))
        .tween(
      'angle',
      Tween<double>(
        begin: 0,
        end: 1.25,
      ),
    )
    ..scene(
      begin: const Duration(seconds: 0),
      end: const Duration(seconds: 6),
    ).tween(
      'scale',
      Tween<double>(
        begin: .6,
        end: .95,
      ),
    )
    ..scene(
      begin: const Duration(seconds: 0),
      end: const Duration(seconds: 6),
    )
        .tween(
          '1st Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '1st Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
          ),
        );
}
