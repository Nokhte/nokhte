import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class MoveAndRegengerateMovie {
  static MovieTween getMovie(Offset endDirection) => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
            'dx1',
            Tween<double>(
              begin: CircleOffsets.center.dx,
              end: endDirection.dx,
            ))
        .tween(
            'dy1',
            Tween<double>(
              begin: CircleOffsets.center.dy,
              end: endDirection.dy,
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
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(2),
    ).tween(
      'radii2',
      Tween<double>(
        begin: 0,
        end: 4.5,
      ),
    )
    ..scene(
      begin: Seconds.get(2),
      end: Seconds.get(2, milli: 1),
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
            ));
}
