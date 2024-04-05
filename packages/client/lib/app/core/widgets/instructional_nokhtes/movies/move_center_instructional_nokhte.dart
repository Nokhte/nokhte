import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class MoveCenterInstructionalNokhte {
  static MovieTween getMovie(
    Offset screenCenter, {
    required GradientNokhtePositions position,
  }) {
    double dxEnd = -1;
    double dyEnd = -1;

    final dxStart = CircleOffsets.top.dx;
    final dyStart = (-screenCenter.dy) * .8;
    switch (position) {
      case GradientNokhtePositions.left:
        break;
      case GradientNokhtePositions.right:
        break;
      case GradientNokhtePositions.top:
        dxEnd = CircleOffsets.top.dx;
        dyEnd = (-screenCenter.dy) * 1.1;
      case GradientNokhtePositions.bottom:
        dxEnd = CircleOffsets.top.dx;
        dyEnd = (-screenCenter.dy) * .4;
    }
    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(2),
      )
          .tween(
              'dx',
              Tween<double>(
                begin: dxStart,
                end: dxEnd,
              ))
          .tween(
            'dy',
            Tween<double>(
              begin: dyStart,
              end: dyEnd,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'radii',
            Tween<double>(
              begin: 25,
              end: 25,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          );
  }
}
