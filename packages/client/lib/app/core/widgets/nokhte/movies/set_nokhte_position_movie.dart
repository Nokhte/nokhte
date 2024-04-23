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
              curve: Curves.easeInOutCubicEmphasized,
            )
            .tween(
              'nokhteY',
              Tween<double>(
                begin: startingPoint.dy,
                end: centerCoordinates.dy,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
            .tween(
              'blueX',
              Tween<double>(
                begin: startingPoint.dx,
                end: centerCoordinates.dx,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
            .tween(
              'blueY',
              Tween<double>(
                begin: startingPoint.dy,
                end: centerCoordinates.dy - 140.0,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
            .tween(
              'circleRadii',
              Tween<double>(
                begin: 14.0,
                end: 14.0,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            );
}
