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
}
