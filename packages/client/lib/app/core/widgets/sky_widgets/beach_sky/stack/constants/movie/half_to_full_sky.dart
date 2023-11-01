import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class HalfToFullSky {
  static MovieTween getMovie(List<Color> skyColors) => MovieTween()
    ..scene(begin: Seconds.get(0), end: Seconds.get(3))
        .tween(
          'sky value',
          Tween<double>(
            begin: 510.0,
            end: 900.0,
          ),
        )
        .tween(
          'first color',
          ColorTween(
            begin: skyColors[0],
            end: skyColors[0],
          ),
        )
        .tween(
          'second color',
          ColorTween(
            begin: skyColors[1],
            end: skyColors[1],
          ),
        )
        .tween(
          'third color',
          ColorTween(
            begin: skyColors[2],
            end: skyColors[2],
          ),
        )
        .tween(
          'fourth color',
          ColorTween(
            begin: skyColors[3],
            end: skyColors[3],
          ),
        );
}
