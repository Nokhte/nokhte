import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class ArcToCircleMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(4),
    ).tween(
      'sweep',
      Tween<double>(
        begin: 0,
        end: pi * 2,
      ),
    );
}
