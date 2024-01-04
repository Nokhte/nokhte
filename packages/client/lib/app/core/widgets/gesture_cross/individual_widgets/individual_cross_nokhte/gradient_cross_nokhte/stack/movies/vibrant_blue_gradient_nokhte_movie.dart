import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class VibrantBlueGradientNokhteMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(2),
    )
        .tween(
          'circle1color1',
          ColorTween(
            begin: const Color(0xFF47D5F9),
            end: const Color(0xFF47D5F9),
          ),
        )
        .tween(
          'circle1stop1',
          Tween<double>(
            begin: .3,
            end: .3,
          ),
        )
        .tween(
          'circle1color2',
          ColorTween(
            begin: const Color(0xFF68E9BA),
            end: const Color(0xFF68E9BA),
          ),
        )
        .tween(
          'circle1stop2',
          Tween<double>(
            begin: 1.0,
            end: 1.0,
          ),
        );
}
