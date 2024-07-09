import 'package:flutter/widgets.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class MoveBackToCenterMovie {
  static MovieTween getMovie(
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
}
