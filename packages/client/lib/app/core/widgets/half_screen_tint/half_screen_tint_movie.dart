import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class HalfScreenTintMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween<double>(
          'opacity1',
          Tween<double>(
            begin: 0,
            end: 1,
          ),
        )
        .tween<double>(
          'opacity2',
          Tween<double>(
            begin: 0,
            end: .5,
          ),
        );
}
