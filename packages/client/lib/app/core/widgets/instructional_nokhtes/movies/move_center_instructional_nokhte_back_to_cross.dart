import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class MoveCenterInstructionalNokhteBackToCrossMovie {
  static MovieTween getMovie(
    Offset screenCenter, {
    required CenterNokhtePositions startingPosition,
  }) {
    double startDx = 0;
    double startDy = 0;
    switch (startingPosition) {
      case CenterNokhtePositions.top:
        startDx = CircleOffsets.top.dx;
        startDy = (-screenCenter.dy) * 1.1;
      case CenterNokhtePositions.bottom:
        startDx = CircleOffsets.bottom.dx;
        startDy = (-screenCenter.dy) * .4;
      case CenterNokhtePositions.center:
        startDx = CircleOffsets.center.dx;
        startDy = (-screenCenter.dy) * .8;
      case CenterNokhtePositions.left:
        startDx = CircleOffsets.center.dx;
        startDy = CircleOffsets.center.dy;
      case CenterNokhtePositions.right:
        startDx = CircleOffsets.center.dx;
        startDy = CircleOffsets.center.dy;
    }
    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(2),
      )
          .tween(
              'dx',
              Tween<double>(
                begin: startDx,
                end: CircleOffsets.center.dx,
              ))
          .tween(
            'dy',
            Tween<double>(
              begin: startDy,
              end: CircleOffsets.center.dy,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'radii',
            Tween<double>(
              begin: 25,
              end: 4.5,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          );
  }
}
