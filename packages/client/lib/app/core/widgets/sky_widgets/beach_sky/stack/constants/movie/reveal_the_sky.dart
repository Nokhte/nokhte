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
        begin: 0.0,
        end: 0.0,
      ),
    )
    ..scene(
      begin: const Duration(seconds: 4),
      end: const Duration(seconds: 8),
    ).tween(
      'sky value',
      Tween<double>(
        begin: 0.0,
        end: 520.0,
      ),
    )
    ..scene(
      begin: const Duration(seconds: 8),
      end: const Duration(
        seconds: 9,
        // milliseconds: 500,
      ),
    ).tween(
      'sky value',
      Tween<double>(
        begin: 520.0,
        end: 500.0,
      ),
    );
}
