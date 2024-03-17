import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class CrossExpansionAndContractionMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'stop',
          Tween<double>(
            begin: .5,
            end: 1.0,
          ),
        )
        .tween(
          'outlineOpacity',
          Tween<double>(
            begin: 1.0,
            end: 1.0,
          ),
        )
        .tween(
          'outlineBlur',
          Tween<double>(
            begin: 6.0,
            end: 6.0,
          ),
        );
}
