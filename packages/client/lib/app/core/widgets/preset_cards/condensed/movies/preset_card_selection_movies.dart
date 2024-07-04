import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class PresetCardSelectionMovies {
  static const vibrantGreen = Color(0xFF62FF2E);
  static const yellowGreen = Color.fromARGB(255, 182, 255, 136);

  static MovieTween get active => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(0, milli: 250),
    ).tween(
      'c1',
      ColorTween(
        begin: yellowGreen,
        end: vibrantGreen,
      ),
    )
    ..scene(
      begin: Seconds.get(0, milli: 250),
      end: Seconds.get(0, milli: 500),
    )
        .tween(
          'c1',
          ColorTween(
            begin: vibrantGreen,
            end: yellowGreen,
          ),
        )
        .tween(
          'c2',
          ColorTween(
            begin: yellowGreen,
            end: vibrantGreen,
          ),
        )
    ..scene(
      begin: Seconds.get(0, milli: 500),
      end: Seconds.get(0, milli: 750),
    )
        .tween(
          'c2',
          ColorTween(
            begin: vibrantGreen,
            end: yellowGreen,
          ),
        )
        .tween(
          'c3',
          ColorTween(
            begin: yellowGreen,
            end: vibrantGreen,
          ),
        )
    ..scene(
      begin: Seconds.get(0, milli: 750),
      end: Seconds.get(1),
    )
        .tween(
          'c3',
          ColorTween(
            begin: vibrantGreen,
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

  static MovieTween get inProgress => MovieTween()
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

  static MovieTween getWindDown(List<Color> startingColors) => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'c1',
          ColorTween(
            begin: startingColors[0],
            end: Colors.white,
          ),
        )
        .tween(
          'c2',
          ColorTween(
            begin: startingColors[1],
            end: Colors.white,
          ),
        )
        .tween(
          'c3',
          ColorTween(
            begin: startingColors[2],
            end: Colors.white,
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
