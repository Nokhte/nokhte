import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class SetNokhtePositionMovie {
  static MovieTween getMovie(
    Offset startingPoint,
    Offset centerCoordinates,
  ) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(2),
        )
            .tween(
              'x',
              Tween<double>(
                begin: startingPoint.dx,
                end: centerCoordinates.dx,
              ),
            )
            .tween(
              'y',
              Tween<double>(
                begin: startingPoint.dy,
                end: centerCoordinates.dy,
              ),
            );
}
