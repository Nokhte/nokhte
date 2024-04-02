import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class StaticSmartTextColorMovie {
  static MovieTween getMovie(Color color) {
    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(1),
      ).tween(
        'color',
        ColorTween(
          begin: color,
          end: color,
        ),
      );
  }
}
