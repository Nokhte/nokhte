import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class PlaceTheSunOrMoon {
  static MovieTween movie() => MovieTween()
    ..scene(
        begin: const Duration(
          seconds: 0,
        ),
        end: const Duration(
          seconds: 3,
        )).tween(
      'vertical constant',
      Tween<double>(
        begin: -1100,
        end: -1100,
      ),
    )
    ..scene(
      begin: const Duration(
        seconds: 3,
      ),
      end: const Duration(
        seconds: 8,
      ),
    ).tween(
      'vertical constant',
      Tween<double>(
        begin: -1100,
        // end: -490,
        end: -470,
      ),
    )
    ..scene(
      begin: const Duration(
        seconds: 8,
      ),
      end: const Duration(
        seconds: 9,
      ),
    ).tween(
      'vertical constant',
      Tween<double>(
        begin: -470,
        end: -490,
      ),
    );
}
