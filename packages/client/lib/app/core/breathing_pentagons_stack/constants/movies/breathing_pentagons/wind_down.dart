import 'package:flutter/material.dart';
import 'package:primala/app/core/breathing_pentagons_stack/constants/pentagon_colors.dart';
import 'package:primala/app/core/breathing_pentagons_stack/utils/find_closest_increment.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class WindDown {
  static MovieTween getWindDownMovie({
    required double startingAngle,
    required double startingScale,
    required Color startingFirstPentagonFirstGradient,
    required Color startingFirstPentagonSecondGradient,
    required Color startingSecondPentagonFirstGradient,
    required Color startingSecondPentagonSecondGradient,
    required Color startingThirdPentagonFirstGradient,
    required Color startingThirdPentagonSecondGradient,
  }) {
    return MovieTween()
      ..scene(
        begin: const Duration(seconds: 0),
        end: const Duration(seconds: 1, milliseconds: 900),
      ).tween(
        'angle',
        Tween<double>(
          begin: startingAngle,
          end: FindClosestIncrement.call(startingAngle),
        ),
      )
      ..scene(
        begin: const Duration(seconds: 1, milliseconds: 900),
        end: const Duration(seconds: 1, milliseconds: 900),
      ).tween(
        'angle',
        Tween<double>(
          begin: 0,
          end: 0,
        ),
      )
      ..scene(
              begin: const Duration(seconds: 0),
              end: const Duration(seconds: 1, milliseconds: 900))
          .tween(
        'scale',
        Tween<double>(
          begin: startingScale,
          end: .6,
        ),
      )
      ..scene(
        begin: const Duration(seconds: 0),
        end: const Duration(seconds: 1, milliseconds: 900),
      )
          .tween(
            '1st Pentagon > 1st Gradient Color',
            // turn to colors later
            ColorTween(
              begin: startingFirstPentagonFirstGradient,
              end: PentagonColors
                      .firstPentagonGradients[PentagonColors.firstInterval]
                  [PentagonColors.firstGradientColor],
            ),
          )
          .tween(
            '1st Pentagon > 2nd Gradient Color',
            ColorTween(
              begin: startingFirstPentagonSecondGradient,
              end: PentagonColors
                      .firstPentagonGradients[PentagonColors.firstInterval]
                  [PentagonColors.secondGradientColor],
            ),
          )
          .tween(
            '2nd Pentagon > 1st Gradient Color',
            // turn to colors later
            ColorTween(
              begin: startingSecondPentagonFirstGradient,
              end: PentagonColors
                      .secondPentagonGradients[PentagonColors.firstInterval]
                  [PentagonColors.firstGradientColor],
            ),
          )
          .tween(
            '2nd Pentagon > 2nd Gradient Color',
            ColorTween(
              begin: startingSecondPentagonSecondGradient,
              end: PentagonColors
                      .secondPentagonGradients[PentagonColors.firstInterval]
                  [PentagonColors.secondGradientColor],
            ),
          )
          .tween(
            '3rd Pentagon > 1st Gradient Color',
            // turn to colors later
            ColorTween(
              begin: startingThirdPentagonFirstGradient,
              end: PentagonColors
                      .thirdPentagonGradients[PentagonColors.firstInterval]
                  [PentagonColors.firstGradientColor],
            ),
          )
          .tween(
            '3rd Pentagon > 2nd Gradient Color',
            ColorTween(
              begin: startingThirdPentagonSecondGradient,
              end: PentagonColors
                      .thirdPentagonGradients[PentagonColors.firstInterval]
                  [PentagonColors.secondGradientColor],
            ),
          );
  }
}
