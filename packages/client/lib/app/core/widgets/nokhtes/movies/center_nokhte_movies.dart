import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class CenterNokhteMovies {
  static MovieTween scale(Size screenSize, {bool reverse = false}) {
    final screenCenter = Offset(screenSize.width / 2, screenSize.height / 2);

    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(2),
      )
          .tween(
              'dx',
              Tween<double>(
                begin: CircleOffsets.center.dx,
                end: CircleOffsets.center.dx,
              ))
          .tween(
            'dy',
            Tween<double>(
              begin:
                  reverse ? (-screenCenter.dy) * .8 : CircleOffsets.center.dy,
              end: reverse ? CircleOffsets.center.dy : (-screenCenter.dy) * .8,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'radii',
            Tween<double>(
              begin: reverse ? 25 : 4.5,
              end: reverse ? 4.5 : 25,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          );
  }

  static MovieTween moveBackToCross(
    Size screenSize, {
    required CenterNokhtePositions startingPosition,
  }) {
    final screenCenter = Offset(
      screenSize.width / 2,
      screenSize.height / 2,
    );
    StartAndEndOffsets offsets = StartAndEndOffsets.initial();
    AuxiliaryNokhtePositions position = AuxiliaryNokhtePositions.initial;
    switch (startingPosition) {
      case CenterNokhtePositions.top:
        position = AuxiliaryNokhtePositions.top;
      case CenterNokhtePositions.bottom:
        position = AuxiliaryNokhtePositions.bottom;
      case CenterNokhtePositions.right:
        position = AuxiliaryNokhtePositions.right;
      case CenterNokhtePositions.left:
        position = AuxiliaryNokhtePositions.left;
      default:
        break;
    }
    offsets = AuxiliaryNokhteUtils.getOffsets(
      screenSize,
      position: position,
      direction: NokhteScaleState.shrink,
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

  static MovieTween moveAround(
    Size screenSize, {
    required AuxiliaryNokhtePositions position,
  }) {
    final screenCenter = Offset(
      screenSize.width / 2,
      screenSize.height / 2,
    );
    Offset start = Offset(CircleOffsets.center.dx, (-screenCenter.dy) * .8);

    Offset end = AuxiliaryNokhteUtils.getOffsets(
      screenSize,
      position: position,
      direction: NokhteScaleState.enlarge,
    ).end;
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
