import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class BottomCircleGoesUp {
  static MovieTween getMovie({
    required List<Color> firstGradientColors,
    required List<Color> secondGradientColors,
  }) {
    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(0, milli: 400),
      )
          .tween(
            'first gradient color',
            ColorTween(
              begin: const Color(0xFF0A98FF),
              end: const Color(0xFF0A98FF),
              // end: const Color(0xFFFFFFFF),
            ),
          )
          .tween(
            'second gradient color',
            ColorTween(
              begin: const Color(0x00FFFFFF),
              end: const Color(0x00FFFFFF),
              // end: const Color(0xFFFFFFFF),
            ),
          )
          .tween(
            'center circle constant',
            Tween<double>(
              begin: 0.0,
              end: 29.0,
            ),
          )
      ..scene(
        begin: Seconds.get(0, milli: 400),
        end: Seconds.get(0, milli: 550),
      )
          .tween(
            'first gradient color',
            ColorTween(
              begin: const Color(0xFF0A98FF),
              end: const Color(0xFF0A98FF),
              // end: const Color(0xFFFFFFFF),
            ),
          )
          .tween(
            'second gradient color',
            ColorTween(
              begin: const Color(0x00FFFFFF),
              end: const Color(0x00FFFFFF),
              // end: const Color(0xFFFFFFFF),
            ),
          )
          .tween(
            'center circle constant',
            Tween<double>(
              begin: 29.0,
              end: 27.0,
            ),
          )
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(2),
      )
          .tween(
            'center circle opacity',
            Tween<double>(
              begin: 1,
              end: 1,
            ),
          )
          .tween(
            'top circle color 1',
            ColorTween(
              begin: firstGradientColors[0],
              end: secondGradientColors[0],
            ),
          )
          .tween(
            'top circle color 2',
            ColorTween(
              begin: firstGradientColors[1],
              end: secondGradientColors[1],
            ),
          );
  }
}
