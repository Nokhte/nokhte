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
            end: const Color(0x6305FF00),
          ),
        )
    ..scene(
      begin: Seconds.get(60),
      end: Seconds.get(62),
    ).tween(
      'color',
      ColorTween(
        begin: const Color(0x6305FF00),
        end: const Color(0x80FAFF00),
      ),
    )
    ..scene(
      begin: Seconds.get(90),
      end: Seconds.get(92),
    ).tween(
      'color',
      ColorTween(
        begin: const Color(0x80FAFF00),
        end: const Color(0x82FF0000),
      ),
    )
    ..scene(
      begin: Seconds.get(90),
      end: Seconds.get(120),
    )
        .tween(
          'blur',
          Tween<double>(
            begin: 40,
            end: 160.0,
          ),
        )
        .tween(
          'color',
          ColorTween(
            begin: const Color(0x82FF0000),
            end: const Color(0x91FF0000),
          ),
        )
    ..scene(
      begin: Seconds.get(290),
      end: Seconds.get(300),
    )
        .tween(
          'blur',
          Tween<double>(
            begin: 160.0,
            end: 400.0,
          ),
        )
        .tween(
          'color',
          ColorTween(
            begin: const Color(0x91FF0000),
            end: const Color(0xFFFF0000),
          ),
        );
}
