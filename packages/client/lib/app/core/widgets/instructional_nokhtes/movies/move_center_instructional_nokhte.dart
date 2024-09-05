import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class MoveCenterInstructionalNokhte {
  static MovieTween getMovie(
    Size screenSize, {
    required InstructionalNokhtePositions position,
  }) {
    final screenCenter = Offset(
      screenSize.width / 2,
      screenSize.height / 2,
    );
    Offset start = Offset.zero;
    Offset end = Offset.zero;
    start = Offset(CircleOffsets.center.dx, (-screenCenter.dy) * .8);
    switch (position) {
      case InstructionalNokhtePositions.left:
        end = Offset((-screenCenter.dy) * .25, (-screenCenter.dy) * .8);
      case InstructionalNokhtePositions.right:
        end = Offset((screenCenter.dx) * .9, (-screenCenter.dy) * .8);
      case InstructionalNokhtePositions.top:
        end = Offset(CircleOffsets.center.dx, (-screenCenter.dy) * 1.2);
      case InstructionalNokhtePositions.bottom:
        end = Offset(CircleOffsets.center.dx, (-screenCenter.dy) * .4);
      default:
        break;
    }
    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(2),
      )
          .tween(
            'dx',
            Tween<double>(
              begin: start.dx,
              end: end.dx,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dy',
            Tween<double>(
              begin: start.dy,
              end: end.dy,
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
