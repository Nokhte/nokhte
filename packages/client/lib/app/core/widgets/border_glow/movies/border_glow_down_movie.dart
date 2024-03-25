import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class BorderGlowDownMovie {
  static MovieTween getMovie({
    Color lastColor = Colors.transparent,
    double lastWidth = 0.0,
  }) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(2),
        )
            .tween(
              'color',
              ColorTween(
                begin: lastColor,
                end: Colors.transparent,
              ),
            )
            .tween(
              'width',
              Tween<double>(
                begin: lastWidth,
                end: 0,
              ),
            );
}
