import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class InstructionHighlightPresetCardMovie {
  static const lighterOrange = Color(0xFFF6FFC0);
  static const vibrantOrange = Color(0xFFFFC060);

  static MovieTween get transition => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'c1',
          ColorTween(
            begin: Colors.white,
            end: vibrantOrange,
          ),
        )
        .tween(
          'c2',
          ColorTween(
            begin: Colors.white,
            end: vibrantOrange,
          ),
        )
        .tween(
          'c3',
          ColorTween(
            begin: Colors.white,
            end: vibrantOrange,
          ),
        )
        .tween(
          'blur',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        );

  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(0, milli: 250),
    ).tween(
      'c1',
      ColorTween(
        begin: vibrantOrange,
        end: lighterOrange,
      ),
    )
    ..scene(
      begin: Seconds.get(0, milli: 250),
      end: Seconds.get(0, milli: 500),
    )
        .tween(
          'c1',
          ColorTween(
            begin: lighterOrange,
            end: vibrantOrange,
          ),
        )
        .tween(
          'c2',
          ColorTween(
            begin: vibrantOrange,
            end: lighterOrange,
          ),
        )
    ..scene(
      begin: Seconds.get(0, milli: 500),
      end: Seconds.get(0, milli: 750),
    )
        .tween(
          'c2',
          ColorTween(
            begin: lighterOrange,
            end: vibrantOrange,
          ),
        )
        .tween(
          'c3',
          ColorTween(
            begin: vibrantOrange,
            end: lighterOrange,
          ),
        )
    ..scene(
      begin: Seconds.get(0, milli: 750),
      end: Seconds.get(1),
    )
        .tween(
          'c3',
          ColorTween(
            begin: lighterOrange,
            end: vibrantOrange,
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
