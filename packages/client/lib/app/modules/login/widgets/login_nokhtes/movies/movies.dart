import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class LoginNokhteMovies {
  //
  static MovieTween moveBackToCenter(
    Offset centerCoordinates,
  ) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(1),
        ).tween(
          'circleRadii',
          Tween<double>(
            end: 14.0,
            begin: 0.0,
          ),
        )
        ..scene(
          begin: Seconds.get(1),
          end: Seconds.get(2),
        )
            .tween(
              'nokhteX',
              Tween<double>(
                begin: centerCoordinates.dx,
                end: centerCoordinates.dx,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
            .tween(
              'nokhteY',
              Tween<double>(
                end: centerCoordinates.dy,
                begin: centerCoordinates.dy - 140.0,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
            .tween(
              'blueX',
              Tween<double>(
                end: centerCoordinates.dx,
                begin: centerCoordinates.dx,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
            .tween(
              'blueY',
              Tween<double>(
                end: centerCoordinates.dy - 140.0,
                begin: centerCoordinates.dy - 140.0,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            );

  static MovieTween moveUpAndDisappear(
    Offset centerCoordinates,
  ) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(1),
        )
            .tween(
              'nokhteX',
              Tween<double>(
                begin: centerCoordinates.dx,
                end: centerCoordinates.dx,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
            .tween(
              'nokhteY',
              Tween<double>(
                begin: centerCoordinates.dy,
                end: centerCoordinates.dy - 140.0,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
            .tween(
              'blueX',
              Tween<double>(
                begin: centerCoordinates.dx,
                end: centerCoordinates.dx,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
            .tween(
              'blueY',
              Tween<double>(
                begin: centerCoordinates.dy - 140.0,
                end: centerCoordinates.dy - 140.0,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
        ..scene(
          begin: Seconds.get(1),
          end: Seconds.get(2),
        ).tween(
          'circleRadii',
          Tween<double>(
            begin: 14.0,
            end: 0.0,
          ),
        );

  static MovieTween setCenterPosition(
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
