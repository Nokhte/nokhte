import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class MoveCenterInstructionalNokhteBackToCrossMovie {
  static MovieTween getMovie(Offset screenCenter) => MovieTween()
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
            begin: (-screenCenter.dy) * 1.1,
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
