import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeInText {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'text opacity',
          Tween<double>(begin: 0, end: 0),
        )
        .tween(
          'text color',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
        )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(2),
    )
        .tween(
          'text opacity',
          Tween<double>(begin: 0, end: 1),
        )
        .tween(
          'text color',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
        );
}
