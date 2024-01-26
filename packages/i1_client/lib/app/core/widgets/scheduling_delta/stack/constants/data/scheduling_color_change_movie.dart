import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class SchedulingDeltaColorChange {
  static MovieTween getMovie(Color startingColor, Color endingColor) =>
      MovieTween()
        ..scene(begin: Seconds.get(0), end: Seconds.get(3)).tween(
          'color',
          ColorTween(
            begin: startingColor,
            end: endingColor,
          ),
        );
}
