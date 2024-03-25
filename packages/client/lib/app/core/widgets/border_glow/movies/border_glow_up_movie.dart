import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class BorderGlowUpMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(2),
    )
        .tween(
          'width',
          Tween<double>(
            begin: 0,
            end: 1.0,
          ),
        )
        .tween(
          'blur',
          Tween<double>(
            begin: 0,
            end: 40.0,
          ),
        )
        .tween(
          'color',
          ColorTween(
            begin: Colors.transparent,
            end: const Color(0xFF04FF00),
          ),
        )
    ..scene(
      // begin: Seconds.get(60),
      // end: Seconds.get(62),
      begin: Seconds.get(2),
      end: Seconds.get(4),
    ).tween(
      'color',
      ColorTween(
        begin: const Color(0xFF04FF00),
        end: const Color(0xFFFBFF00),
      ),
    )
    ..scene(
      // begin: Seconds.get(90),
      // end: Seconds.get(92),
      begin: Seconds.get(4),
      end: Seconds.get(6),
    ).tween(
      'color',
      ColorTween(
        begin: const Color(0xFFFBFF00),
        end: const Color(0xFFCB3B44),
      ),
    )
    ..scene(
      begin: Seconds.get(6),
      end: Seconds.get(12),
      // begin: Seconds.get(90),
      // end: Seconds.get(120),
    ).tween(
      'width',
      Tween<double>(
        begin: 1,
        end: 200.0,
      ),
    );
}
