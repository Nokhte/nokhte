import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class CenterInstructionalNokhteTransformationMovie {
  static MovieTween getMovie(Size screenSize, {bool reverse = false}) {
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
}
