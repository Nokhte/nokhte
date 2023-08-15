/// wind_down.dart
///
/// Proofreading Information:
/// - Proofreader: Sonny Vesali
/// - Date: July 30th, 2023
///
/// Author: Sonny Vesali
///
/// The WindDown class provides a static method called getWindDownMovie that
/// generates a [MovieTween] representing the wind-down animation for the
/// BreathingPentagonsButton widget.
///
/// This animation gradually reduces the rotation angle and scaling of the
/// pentagons from their last animated values in either the InfiniteSpinner or
/// AggressiveExpansion animations to rest at a specific state, creating the
/// wind-down effect. The animation has a duration of 1.9 seconds.
///
/// Parameters:
/// - startingAngle: The last animated rotation angle of the pentagons.
/// - startingScale: The last animated scaling factor of the pentagons.
/// - startingFirstPentagonFirstGradient: The last animated first gradient color
/// of the first pentagon in the radial gradient.
/// - startingFirstPentagonSecondGradient: The last animated second gradient color
/// of the first pentagon in the radial gradient.
/// - startingSecondPentagonFirstGradient: The last animated first gradient color
/// of the second pentagon in the radial gradient.
/// - startingSecondPentagonSecondGradient: The last animated second gradient color
/// of the second pentagon in the radial gradient.
/// - startingThirdPentagonFirstGradient: The last animated first gradient color
/// of the third pentagon in the radial gradient.
/// - startingThirdPentagonSecondGradient: The last animated second gradient color
/// of the third pentagon in the radial gradient.

import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/breathing_pentagons_stack/constants/pentagon_colors.dart';
import 'package:primala/app/core/widgets/breathing_pentagons_stack/utils/find_closest_increment.dart';
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
