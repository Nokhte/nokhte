import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class WifiRippleMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(0, milli: 500),
    )
        .tween(
          'blur',
          Tween(
            begin: 10.0,
            end: 10.0,
          ),
        )
        .tween(
          'circleOpacity',
          Tween<double>(
            begin: 1.0,
            end: 1.0,
          ),
        )
        .tween(
          'circleRadius',
          Tween<double>(
            begin: 3.0,
            end: 3.0,
          ),
        )
        .tween(
          'arc1Opacity',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        )
        .tween(
          'arc2Opacity',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        )
        .tween(
          'arc3Opacity',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        );
}
