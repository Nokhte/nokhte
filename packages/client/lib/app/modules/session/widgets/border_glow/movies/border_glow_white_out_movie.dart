import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class BorderGlowWhiteOutMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(3),
    )
        .tween(
          'width',
          Tween<double>(
            begin: 1,
            end: 200.0,
          ),
        )
        .tween(
          'blur',
          Tween<double>(
            begin: 40.0,
            end: 40.0,
          ),
        )
        .tween(
          'color',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
        );
}
