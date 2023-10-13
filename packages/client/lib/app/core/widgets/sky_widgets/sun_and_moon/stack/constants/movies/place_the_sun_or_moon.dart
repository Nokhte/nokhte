import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class PlaceTheSunOrMoon {
  static MovieTween getMovie(List<Color> theGradient) => MovieTween()
    ..scene(
        begin: const Duration(
          seconds: 0,
        ),
        end: const Duration(
          seconds: 3,
        )).tween(
      'vertical constant',
      Tween<double>(
        begin: -1100,
        end: -1100,
      ),
    )
    ..scene(
      begin: const Duration(
        seconds: 3,
      ),
      end: const Duration(
        seconds: 8,
      ),
    ).tween(
      'vertical constant',
      Tween<double>(
        begin: -1100,
        end: -480,
      ),
    )
    ..scene(
      begin: const Duration(
        seconds: 8,
      ),
      end: const Duration(
        seconds: 8,
        milliseconds: 800,
        // seconds: 9,
      ),
    ).tween(
      'vertical constant',
      Tween<double>(
        begin: -480,
        end: -490,
      ),
    )
    ..scene(
      begin: const Duration(
        seconds: 0,
      ),
      end: const Duration(
        seconds: 9,
      ),
    )
        .tween(
          'first grad color',
          ColorTween(
            begin: theGradient[0],
            end: theGradient[0],
          ),
        )
        .tween(
          'second grad color',
          ColorTween(
            begin: theGradient[1],
            end: theGradient[1],
          ),
        );
}
