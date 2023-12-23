import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class SetUpTheClockfaceMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    ).tween(
        'hourMarkLength',
        Tween<double>(
          begin: 0,
          end: 20.0,
        ));
}
