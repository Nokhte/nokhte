import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class BlurMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(2),
    ).tween(
      'blur',
      Tween<double>(
        begin: 0.0,
        end: 10.0,
      ),
    );
}
