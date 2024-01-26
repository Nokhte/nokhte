import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class AudioClipPlatformColorAndVertOffsetChange {
  static MovieTween getMovie({
    required List<Color> startingCircleColors,
    required List<Color> endingCircleColors,
    required List<double> startingVertOffsets,
    required List<double> endingVertOffsets,
  }) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(1),
        )
            .tween(
              'leftCircleColor',
              ColorTween(
                begin: startingCircleColors.first,
                end: endingCircleColors.first,
              ),
            )
            .tween(
              'centerCircleColor',
              ColorTween(
                begin: startingCircleColors[1],
                end: endingCircleColors[1],
              ),
            )
            .tween(
              'rightCircleColor',
              ColorTween(
                begin: startingCircleColors[2],
                end: endingCircleColors[2],
              ),
            )
            .tween(
              'leftCircleVertOffset',
              Tween<double>(
                begin: startingVertOffsets.first,
                end: endingVertOffsets.first,
              ),
            )
            .tween(
              'centerCircleVertOffset',
              Tween<double>(
                begin: startingVertOffsets[1],
                end: endingVertOffsets[1],
              ),
            )
            .tween(
              'rightCircleVertOffset',
              Tween<double>(
                begin: startingVertOffsets[2],
                end: endingVertOffsets[2],
              ),
            );
}
