import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class CalloutMovie {
  static const pink = Color(0xFFFC8BFE);
  static const purple = Color(0xFF6C49FA);
  static const turquoise = Color(0xFF00FFFF);
  static const yellowGreen = Color(0xFFCCFF8A);
  static const yellow = Color(0xFFFFFF6F);
  static const orange = Color(0xFFFFC997);
  static const grapefruit = Color(0xFFFF9FAB);
  static const pastelPink = Color(0xFFF9A2F9);
  static const List<Color> colors = [
    pink,
    purple,
    turquoise,
    yellowGreen,
    yellow,
    orange,
    grapefruit,
    pastelPink
  ];

  static MovieTween get movie {
    final MovieTween tween = MovieTween();
    const int totalDuration = 2000; // 2 seconds in milliseconds
    final int stepDuration = totalDuration ~/ colors.length;

    for (int i = 0; i < colors.length; i++) {
      final startTime = Duration(milliseconds: i * stepDuration);
      final endTime = Duration(milliseconds: (i + 1) * stepDuration);
      final startColors = _getColorSet(i);
      final endColors = _getColorSet(i + 1);

      _colorTransition(startColors, endColors, tween,
          start: startTime, end: endTime);
    }

    return tween;
  }

  static List<Color> _getColorSet(int startIndex) {
    return List.generate(
        8, (index) => colors[(startIndex + index) % colors.length]);
  }

  static MovieTween _colorTransition(
    List<Color> startingColors,
    List<Color> endingColors,
    MovieTween movie, {
    Duration start = const Duration(milliseconds: 0),
    Duration end = const Duration(milliseconds: 250),
  }) {
    final scene = movie.scene(begin: start, end: end);

    for (int i = 0; i < 8; i++) {
      scene.tween(
        'color${i + 1}',
        ColorTween(
          begin: startingColors[i],
          end: endingColors[i],
        ),
      );
    }

    return movie;
  }
}
