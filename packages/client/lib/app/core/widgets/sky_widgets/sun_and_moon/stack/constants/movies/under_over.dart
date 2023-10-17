import 'package:flutter/material.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class UnderOver {
  //
  static MovieTween getMovie({
    required double startingPosition,
    required double endingPosition,
    required List<Color> startingGradient,
    required List<Color> endingGradient,
  }) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: const Duration(milliseconds: 250),
        )
            .tween(
              'vertical constant',
              Tween<double>(
                begin: startingPosition,
                end: 300,
              ),
            )
            .tween(
              'first grad color',
              ColorTween(
                begin: startingGradient[0],
                end: startingGradient[0],
              ),
            )
            .tween(
              'second grad color',
              ColorTween(
                begin: startingGradient[1],
                end: startingGradient[1],
              ),
            )
        ..scene(
          begin: const Duration(
            milliseconds: 251,
          ),
          end: const Duration(
            milliseconds: 252,
          ),
        )
            .tween(
              'vertical constant',
              Tween<double>(
                begin: 300,
                end: 300,
              ),
            )
            .tween(
              'first grad color',
              ColorTween(
                begin: startingGradient[0],
                end: endingGradient[0],
              ),
            )
            .tween(
              'second grad color',
              ColorTween(
                begin: startingGradient[1],
                end: endingGradient[1],
              ),
            )
        ..scene(
          begin: const Duration(
            milliseconds: 252,
          ),
          end: Seconds.get(500),
        )
            .tween(
              'vertical constant',
              Tween<double>(
                begin: 300,
                end: endingPosition,
              ),
            )
            .tween(
              'first grad color',
              ColorTween(
                begin: endingGradient[0],
                end: endingGradient[0],
              ),
            )
            .tween(
              'second grad color',
              ColorTween(
                begin: endingGradient[1],
                end: endingGradient[1],
              ),
            );
}
