import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeInAndOutMovie {
  static MovieTween get movie => MovieTween()
    ..scene(begin: Seconds.get(0), end: Seconds.get(0, milli: 500))
        .tween<double>('opacity', Tween<double>(begin: 0, end: 1));
}
