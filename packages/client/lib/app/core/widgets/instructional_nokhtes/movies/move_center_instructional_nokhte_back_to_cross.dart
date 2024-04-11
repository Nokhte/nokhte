import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class MoveCenterInstructionalNokhteBackToCrossMovie {
  static MovieTween getMovie(
    Offset screenCenter, {
    required CenterNokhtePositions startingPosition,
  }) {
    StartAndEndOffsets offsets = StartAndEndOffsets.initial();
    InstructionalNokhtePositions position =
        InstructionalNokhtePositions.initial;
    switch (startingPosition) {
      case CenterNokhtePositions.top:
        position = InstructionalNokhtePositions.top;
      case CenterNokhtePositions.bottom:
        position = InstructionalNokhtePositions.bottom;
      case CenterNokhtePositions.right:
        position = InstructionalNokhtePositions.right;
      case CenterNokhtePositions.left:
        position = InstructionalNokhtePositions.left;
      default:
        break;
    }
    offsets = InstructionalNokhteUtils.getOffsets(
      screenCenter,
      position: position,
      direction: InstructionalGradientDirections.shrink,
    );
    if (startingPosition == CenterNokhtePositions.center) {
      offsets = StartAndEndOffsets(
        start: Offset(CircleOffsets.center.dx, (-screenCenter.dy) * .8),
        end: Offset(CircleOffsets.center.dx, CircleOffsets.center.dy),
      );
    }
    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(2),
      )
          .tween(
            'dx',
            Tween<double>(
              begin: offsets.start.dx,
              end: CircleOffsets.center.dx,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dy',
            Tween<double>(
              begin: offsets.start.dy,
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
