import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class BorderGlowDownMovie {
  static MovieTween getMovie({
    required Color lastColor,
    required double lastWidth,
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
                end: lastColor,
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
