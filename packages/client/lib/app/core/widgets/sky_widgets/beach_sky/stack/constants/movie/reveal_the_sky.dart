import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class RevealTheSky {
  static MovieTween getMovie(List<Color> skyColors) => MovieTween()
    ..scene(
      begin: const Duration(seconds: 0),
      end: const Duration(seconds: 4),
    ).tween(
      'sky value',
      Tween<double>(
        begin: 0.0,
        end: 0.0,
      ),
    )
    ..scene(
      begin: const Duration(seconds: 4),
      end: const Duration(seconds: 8),
    ).tween(
      'sky value',
      Tween<double>(
        begin: 0.0,
        end: 520.0,
      ),
    )
    ..scene(
      begin: const Duration(seconds: 8),
      end: const Duration(
        seconds: 9,
      ),
    ).tween(
      'sky value',
      Tween<double>(
        begin: 520.0,
        end: 500.0,
      ),
    )
    ..scene(
      begin: const Duration(seconds: 0),
      end: const Duration(seconds: 9),
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
