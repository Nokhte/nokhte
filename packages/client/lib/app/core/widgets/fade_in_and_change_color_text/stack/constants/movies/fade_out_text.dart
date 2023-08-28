import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeOutText {
  static MovieTween getMovie({required Color currentTextColor}) => MovieTween()
    ..scene(
      begin: const Duration(seconds: 0),
      end: const Duration(seconds: 1),
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
