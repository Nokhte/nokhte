import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class WifiSymbolRippleMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1, milli: 500),
    )
        .tween(
          'blur',
          Tween(
            begin: 0.0,
            end: 10.0,
          ),
        )
        .tween(
          'circleOpacity',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        )
        .tween(
          'circleRadius',
          Tween<double>(
            begin: 15.0,
            end: 15.0,
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
        )
    ..scene(
      begin: Seconds.get(1, milli: 500),
      end: Seconds.get(2),
    )
        .tween(
          'circleRadius',
          Tween<double>(
            begin: 15.0,
            end: 2.0,
          ),
        )
        .tween(
          'circleOpacity',
          Tween<double>(
            begin: 0.0,
            end: 1.0,
          ),
        )
    ..scene(
      begin: Seconds.get(2),
      end: Seconds.get(2, milli: 250),
    )
        .tween(
          'circleOpacity',
          Tween<double>(
            begin: 1.0,
            end: .75,
          ),
        )
        .tween(
          'arc1Opacity',
          Tween<double>(
            begin: 0,
            end: 1,
          ),
        )
    ..scene(
      begin: Seconds.get(2, milli: 250),
      end: Seconds.get(2, milli: 500),
    )
        .tween(
          'circleOpacity',
          Tween<double>(
            begin: .75,
            end: .5,
          ),
        )
        .tween(
          'arc1Opacity',
          Tween<double>(
            begin: 1,
            end: .75,
          ),
        )
        .tween(
          'arc2Opacity',
          Tween<double>(
            begin: 0,
            end: 1,
          ),
        )
    ..scene(
      begin: Seconds.get(2, milli: 500),
      end: Seconds.get(2, milli: 750),
    )
        .tween(
          'circleOpacity',
          Tween<double>(
            begin: .25,
            end: .5,
          ),
        )
        .tween(
          'arc1Opacity',
          Tween<double>(
            begin: .75,
            end: .25,
          ),
        )
        .tween(
          'arc2Opacity',
          Tween<double>(
            begin: 1,
            end: .75,
          ),
        )
        .tween(
          'arc3Opacity',
          Tween<double>(
            begin: 0,
            end: 1,
          ),
        );
}
/// ! The Progression
///// ~ 1. dot @1.00 
///// ~ 2. dot @.75 & arc1 @1
///// ~ 3. dot @.25 & arc1 @.75 & arc2 @1
///// ~ 4. no dot, arc1 @.25, arc2 @.75 & arc3 @1
/// ~ 5. and then repeat
