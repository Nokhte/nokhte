import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class WaterGradientNokhteMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(2),
    )
        .tween(
          'circle1color1',
          ColorTween(
            begin: const Color(0xFF407F74),
            end: const Color(0xFF407F74),
          ),
        )
        .tween(
          'circle1stop1',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          'circle1color2',
          ColorTween(
            begin: const Color(0xFF53A28F),
            end: const Color(0xFF53A28F),
          ),
        )
        .tween(
          'circle1stop2',
          Tween<double>(
            begin: 0.35,
            end: 0.6,
          ),
          curve: Curves.easeOut,
        )
        .tween(
          'circle1color3',
          ColorTween(
            begin: const Color(0xFF866243),
            end: const Color(0xFF866243),
          ),
        )
        .tween(
          'circle1stop3',
          Tween<double>(
            begin: 0.36,
            end: 0.61,
          ),
          curve: Curves.easeOut,
        )
        .tween(
          'circle1color4',
          ColorTween(
            begin: const Color(0xFFCBB28E),
            end: const Color(0xFFCBB28E),
          ),
        )
        .tween(
          'circle1stop4',
          Tween<double>(
            begin: 1,
            end: 1,
          ),
        );
}
