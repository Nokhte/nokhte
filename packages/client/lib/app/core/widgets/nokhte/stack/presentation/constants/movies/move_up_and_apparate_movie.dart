import 'package:flutter/widgets.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class MoveUpAndApparateMovie {
  static MovieTween getMovie(
    Offset centerCoordinates,
  ) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(2),
        )
            .tween(
              'nokhteX',
              Tween<double>(
                begin: centerCoordinates.dx,
                end: centerCoordinates.dx,
              ),
            )
            .tween(
              'nokhteY',
              Tween<double>(
                begin: centerCoordinates.dy,
                end: centerCoordinates.dy - 140.0,
              ),
            )
            .tween(
              'blueX',
              Tween<double>(
                begin: centerCoordinates.dx,
                end: centerCoordinates.dx,
              ),
            )
            .tween(
              'blueY',
              Tween<double>(
                begin: centerCoordinates.dy - 140.0,
                end: centerCoordinates.dy - 140.0,
              ),
            )
            .tween(
              'circleRadii',
              Tween<double>(
                begin: 14.0,
                end: 14.0,
              ),
            )
        ..scene(
          begin: Seconds.get(2),
          end: Seconds.get(3),
        ).tween(
          'circleRadii',
          Tween<double>(
            begin: 14.0,
            end: 0.0,
          ),
        );
}

// we will also need to add circle radius as well into these so parameterize via pate