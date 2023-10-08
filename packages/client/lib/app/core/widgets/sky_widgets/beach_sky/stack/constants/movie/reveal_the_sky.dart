import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class RevealTheSky {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: const Duration(seconds: 0),
      end: const Duration(seconds: 4),
    ).tween(
      'sky value',
      Tween<double>(
        begin: 500.0,
        end: 500.0,
      ),
    )
    ..scene(
      begin: const Duration(seconds: 4),
      end: const Duration(seconds: 6),
    ).tween(
      'sky value',
      Tween<double>(
        begin: 500.0,
        end: 500.0,
      ),
    );
}
