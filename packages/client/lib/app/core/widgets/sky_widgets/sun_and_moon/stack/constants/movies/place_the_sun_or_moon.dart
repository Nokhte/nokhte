import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/sky_widgets/sun_and_moon/stack/constants/types/position_and_duration.dart';
import 'package:simple_animations/simple_animations.dart';

class PlaceTheSunOrMoon {
  static MovieTween getMovie(
    List<Color> theGradient,
    PositionAndDuration posAndDur,
  ) =>
      MovieTween()
        ..scene(
          begin: const Duration(
            seconds: 0,
          ),
          end: posAndDur.bigMovementStartTime,
        ).tween(
          'vertical constant',
          Tween<double>(
            begin: -1100,
            end: -1100,
          ),
        )
        ..scene(
          begin: posAndDur.bigMovementStartTime,
          end: posAndDur.bigMovementEndTime,
        ).tween(
          'vertical constant',
          Tween<double>(
            begin: -1100,
            end: posAndDur.endingPostion,
          ),
        )
        ..scene(
          begin: posAndDur.bigMovementEndTime,
          end: const Duration(
            seconds: 8,
            milliseconds: 800,
            // seconds: 9,
          ),
        ).tween(
          'vertical constant',
          Tween<double>(
            begin: posAndDur.endingPostion,
            end: posAndDur.endingPostion - 10,
          ),
        )
        ..scene(
          begin: const Duration(
            seconds: 0,
          ),
          end: const Duration(
            seconds: 9,
          ),
        )
            .tween(
              'first grad color',
              ColorTween(
                begin: theGradient[0],
                end: theGradient[0],
              ),
            )
            .tween(
              'second grad color',
              ColorTween(
                begin: theGradient[1],
                end: theGradient[1],
              ),
            );
}
