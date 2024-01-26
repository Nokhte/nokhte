import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class GlowDown {
  static MovieTween getMovie({
    required Color currentGlowColor,
    required double newXTranslate,
    required double newYTranslate,
    required double newXScale,
    required double newYScale,
  }) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(1),
        )
            .tween(
              'color',
              ColorTween(
                begin: currentGlowColor,
                end: currentGlowColor,
              ),
            )
            .tween(
                'opacity',
                Tween<double>(
                  begin: 1,
                  end: 0,
                ))
            .tween(
              'Xscale',
              Tween<double>(
                begin: newXScale,
                end: 1,
              ),
            )
            .tween(
              'Yscale',
              Tween<double>(
                begin: newYScale,
                end: 1,
              ),
            )
            .tween(
              'Xtranslate',
              Tween<double>(
                begin: newXTranslate,
                end: 0,
              ),
            )
            .tween(
              'Ytranslate',
              Tween<double>(
                begin: newYTranslate,
                end: 0,
              ),
            );
}
