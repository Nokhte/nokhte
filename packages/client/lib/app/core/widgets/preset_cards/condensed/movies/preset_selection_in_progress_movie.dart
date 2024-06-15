import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class PresetSelectionInProgressMovie {
  static const vibrantGreen = Color(0xFF62FF2E);
  static const yellowGreen = Color.fromARGB(255, 182, 255, 136);

  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(0, milli: 333),
    ).tween(
      'c1',
      ColorTween(
        begin: Colors.white,
        end: yellowGreen,
      ),
    )
    ..scene(
      begin: Seconds.get(0, milli: 333),
      end: Seconds.get(0, milli: 666),
    ).tween(
      'c2',
      ColorTween(
        begin: Colors.white,
        end: yellowGreen,
      ),
    )
    ..scene(
      begin: Seconds.get(0, milli: 666),
      end: Seconds.get(1),
    )
        .tween(
          'c3',
          ColorTween(
            begin: Colors.white,
            end: yellowGreen,
          ),
        )
        .tween(
          'blur',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        );
}
