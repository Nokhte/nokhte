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
              'nokhteX',
              Tween<double>(
                begin: startingPoint.dx,
                end: centerCoordinates.dx,
              ),
            )
            .tween(
              'nokhteY',
              Tween<double>(
                begin: startingPoint.dy,
                end: centerCoordinates.dy,
              ),
            )
            .tween(
              'blueX',
              Tween<double>(
                begin: startingPoint.dx,
                end: centerCoordinates.dx,
              ),
            )
            .tween(
              'blueY',
              Tween<double>(
                begin: startingPoint.dy,
                end: centerCoordinates.dy,
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
          end: Seconds.get(4),
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
                end: centerCoordinates.dy,
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
            )
            .tween(
              'circleRadii',
              Tween<double>(
                begin: 14.0,
                end: 14.0,
              ),
            );
}
