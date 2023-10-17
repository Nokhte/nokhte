import 'package:flutter/material.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class SmoothLerpTransition {
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
          end: const Duration(milliseconds: 500),
        )
            .tween(
              'vertical constant',
              Tween<double>(
                begin: startingPosition,
                end: endingPosition,
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
            );
}
