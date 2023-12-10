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
                begin: centerCoordinates.dy,
                end: centerCoordinates.dy - 140.0,
              ),
            );
}
