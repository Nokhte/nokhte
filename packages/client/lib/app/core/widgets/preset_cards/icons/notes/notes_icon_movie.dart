import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class NotesIconMovie {
  static MovieTween get active => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    ).tween(
      'angle',
      Tween<double>(
        begin: 0,
        end: .1,
      ),
    )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(2),
    ).tween(
      'angle',
      Tween<double>(
        begin: .1,
        end: 0,
      ),
    );
  static MovieTween get static => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    ).tween(
      'angle',
      Tween<double>(
        begin: 0,
        end: 0,
      ),
    );
}
