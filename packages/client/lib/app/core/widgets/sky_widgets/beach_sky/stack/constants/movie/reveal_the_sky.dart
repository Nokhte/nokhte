import 'package:flutter/material.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class RevealTheSky {
  static MovieTween getMovie(List<Color> skyColors) => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(2),
    ).tween(
      'sky value',
      Tween<double>(
        begin: 0.0,
        end: 0.0,
      ),
    )
    ..scene(
      begin: Seconds.get(2),
      end: Seconds.get(6),
    ).tween(
      'sky value',
      Tween<double>(
        begin: 0.0,
        end: 510.0,
      ),
    )
    ..scene(
      begin: Seconds.get(6),
      end: Seconds.get(6, milli: 800),
    ).tween(
      'sky value',
      Tween<double>(
        begin: 510.0,
        end: 500.0,
      ),
    )
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(9),
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
