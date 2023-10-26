import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
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
          end: Seconds.get(1, milli: 500),
        ).tween(
          'vertical constant',
          Tween<double>(
            begin: startingPosition,
            end: -280,
          ),
        )
        ..scene(
          begin: Seconds.get(1, milli: 500),
          end: Seconds.get(3),
        ).tween(
          'vertical constant',
          Tween<double>(
            begin: -280,
            end: endingPosition,
          ),
        )
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(1, milli: 500),
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
          begin: Seconds.get(1, milli: 500),
          end: Seconds.get(1, milli: 501),
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
          begin: Seconds.get(1, milli: 501),
          end: Seconds.get(3),
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
