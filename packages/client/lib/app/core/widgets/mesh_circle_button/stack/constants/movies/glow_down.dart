import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class GlowDown {
  static MovieTween getMovie(Color currentGlowColor) => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
            'color',
            ColorTween(
              begin: currentGlowColor,
              end: currentGlowColor,
            ))
        .tween(
            'opacity',
            Tween<double>(
              begin: 1,
              end: 0,
            ));
}
