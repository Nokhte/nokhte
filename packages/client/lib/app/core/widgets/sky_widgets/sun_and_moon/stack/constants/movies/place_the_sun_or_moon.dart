import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class PlaceTheSunOrMoon {
  static MovieTween movie() => MovieTween()
    ..scene(begin: const Duration(seconds: 0), end: const Duration(seconds: 4))
        .tween(
      'vertical constant',
      Tween<double>(
        begin: -1100,
        end: -1100,
      ),
    )
    ..scene(
      begin: const Duration(
        seconds: 4,
      ),
      end: const Duration(
        seconds: 6,
      ),
    ).tween(
      'vertical constant',
      Tween<double>(
        begin: -1100,
        end: -490,
      ),
    );
}
