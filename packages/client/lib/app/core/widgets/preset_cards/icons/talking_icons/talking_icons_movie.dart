import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class TalkingIconsMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    ).tween(
      'color',
      ColorTween(
        begin: Colors.transparent,
        end: const Color(0xFF04FF00),
      ),
    )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(2),
    ).tween(
      'color',
      ColorTween(
        begin: const Color(0xFF04FF00),
        end: const Color(0xFFFBFF00),
      ),
    )
    ..scene(
      begin: Seconds.get(2),
      end: Seconds.get(3),
    ).tween(
      'color',
      ColorTween(
        begin: const Color(0xFFFBFF00),
        end: const Color(0xFFCB3B44),
      ),
    )
    ..scene(
      begin: Seconds.get(3),
      end: Seconds.get(4),
    ).tween(
      'color',
      ColorTween(
        begin: const Color(0xFFCB3B44),
        end: Colors.transparent,
      ),
    );
}
