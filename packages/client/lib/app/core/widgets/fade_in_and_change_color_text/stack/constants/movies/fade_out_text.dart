import 'package:flutter/material.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeOutText {
  static MovieTween getMovie({required Color currentTextColor}) => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'text opacity',
          Tween<double>(begin: 1, end: 0),
        )
        .tween(
          'text color',
          ColorTween(
            begin: currentTextColor,
            end: currentTextColor,
          ),
        );
}
