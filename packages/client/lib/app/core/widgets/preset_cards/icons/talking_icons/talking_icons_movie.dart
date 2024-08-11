import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class TalkingIconsMovie {
  static MovieTween get active => MovieTween()
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
      begin: Seconds.get(30),
      end: Seconds.get(31),
    ).tween(
      'color',
      ColorTween(
        begin: const Color(0xFF04FF00),
        end: const Color(0xFFFBFF00),
      ),
    )
    ..scene(
      begin: Seconds.get(60),
      end: Seconds.get(90),
    ).tween(
      'color',
      ColorTween(
        begin: const Color(0xFFFBFF00),
        end: const Color(0xFFCB3B44),
      ),
    )
    ..scene(
      begin: Seconds.get(90),
      end: Seconds.get(91),
    ).tween(
      'color',
      ColorTween(
        begin: const Color(0xFFCB3B44),
        end: Colors.transparent,
      ),
    );
  static MovieTween get static => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    ).tween(
      'color',
      ColorTween(
        begin: Colors.transparent,
        end: Colors.transparent,
      ),
    );
}
