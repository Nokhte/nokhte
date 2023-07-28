import 'package:flutter/material.dart';
import 'package:primala/app/core/breathing_pentagons_stack/constants/pentagon_colors.dart';
import 'package:simple_animations/simple_animations.dart';

class ColorChanges {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: const Duration(seconds: 0),
      // 6 seconds 1.25
      end: const Duration(seconds: 30),
    )
        .tween(
          'angle',
          Tween<double>(
            begin: 0,
            end: 6.25,
          ),
        )
        .tween(
          'scale',
          Tween<double>(
            begin: .95,
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
        )
    ..scene(
      begin: const Duration(seconds: 6),
      end: const Duration(seconds: 12),
    )
        .tween(
          '1st Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.secondInterval]
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
                    .firstPentagonGradients[PentagonColors.secondInterval]
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
                    .secondPentagonGradients[PentagonColors.secondInterval]
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
                    .secondPentagonGradients[PentagonColors.secondInterval]
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
                    .thirdPentagonGradients[PentagonColors.secondInterval]
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
                    .thirdPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
    ..scene(
      begin: const Duration(seconds: 12),
      end: const Duration(seconds: 18),
    )
        .tween(
          '1st Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '1st Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
    ..scene(
      begin: const Duration(seconds: 18),
      end: const Duration(seconds: 24),
    )
        .tween(
          '1st Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '1st Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
    ..scene(
      begin: const Duration(seconds: 24),
      end: const Duration(seconds: 30),
    )
        .tween(
          '1st Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.fifthInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '1st Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.fifthInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.fifthInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.fifthInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.fifthInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.fifthInterval]
                [PentagonColors.secondGradientColor],
          ),
        );
}
