import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class RestingCenterCrossMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(2),
    )
        .tween(
            'dx1',
            Tween<double>(
              begin: CircleOffsets.center.dx,
              end: CircleOffsets.center.dx,
            ))
        .tween(
            'dy1',
            Tween<double>(
              begin: CircleOffsets.center.dy,
              end: CircleOffsets.center.dy,
            ))
        .tween(
          'radii1',
          Tween<double>(
            begin: 4.5,
            end: 4.5,
          ),
        )
        .tween(
            'dx2',
            Tween<double>(
              begin: CircleOffsets.center.dx,
              end: CircleOffsets.center.dx,
            ))
        .tween(
            'dy2',
            Tween<double>(
              begin: CircleOffsets.center.dy,
              end: CircleOffsets.center.dy,
            ))
        .tween(
          'radii2',
          Tween<double>(
            begin: 4.5,
            end: 4.5,
          ),
        );
}
