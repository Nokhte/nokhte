import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class RemoveTheCircleMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'circleOpacity',
          Tween<double>(
            begin: 0.0,
            end: -1,
          ),
        )
        .tween(
          'arc1Radius',
          Tween<double>(
            begin: 45.0,
            end: -1,
          ),
        )
        .tween(
          'arc2Radius',
          Tween<double>(
            begin: 30.0,
            end: -1,
          ),
        )
        .tween(
          'arc3Radius',
          Tween<double>(
            begin: 15.0,
            end: -1,
          ),
        )
        .tween(
          'arc3Opacity',
          Tween<double>(
            begin: 1.0,
            end: -1,
          ),
        );
}
