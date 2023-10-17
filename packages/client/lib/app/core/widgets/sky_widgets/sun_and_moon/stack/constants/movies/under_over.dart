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
          end: const Duration(seconds: 1, milliseconds: 500),
        ).tween(
          'vertical constant',
          Tween<double>(
            begin: startingPosition,
            end: -280,
          ),
        )
        ..scene(
          begin: const Duration(seconds: 1, milliseconds: 500),
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
          end: const Duration(seconds: 1, milliseconds: 500),
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
          begin: const Duration(seconds: 1, milliseconds: 500),
          end: const Duration(seconds: 1, milliseconds: 501),
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
          begin: const Duration(seconds: 1, milliseconds: 501),
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
  // ..scene(
  //   begin: const Duration(

  //     milliseconds: 250,
  //   ),
  //   end: const Duration(
  //     milliseconds: 251,
  //   ),
  // )
  //     .tween(
  //       'vertical constant',
  //       Tween<double>(
  //         begin: 300,
  //         end: 300,
  //       ),
  //     )
  //     .tween(
  //       'first grad color',
  //       ColorTween(
  //         begin: startingGradient[0],
  //         end: endingGradient[0],
  //       ),
  //     )
  //     .tween(
  //       'second grad color',
  //       ColorTween(
  //         begin: startingGradient[1],
  //         end: endingGradient[1],
  //       ),
  //     )
}
