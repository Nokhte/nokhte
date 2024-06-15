import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeOutPresetCardMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'c1',
          ColorTween(
            begin: Colors.white,
            end: Colors.white.withOpacity(0),
          ),
        )
        .tween(
          'c2',
          ColorTween(
            begin: Colors.white,
            end: Colors.white.withOpacity(0),
          ),
        )
        .tween(
          'c3',
          ColorTween(
            begin: Colors.white,
            end: Colors.white.withOpacity(0),
          ),
        )
        .tween(
          'blur',
          Tween<double>(
            begin: 0,
            end: 10,
          ),
        );
}
