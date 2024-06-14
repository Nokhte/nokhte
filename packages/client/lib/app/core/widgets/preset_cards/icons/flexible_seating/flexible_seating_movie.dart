import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class FlexibleSeatingMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(0, milli: 500),
    ).tween(
      'o1',
      Tween<double>(
        begin: .25,
        end: 1,
      ),
    )
    ..scene(
      begin: Seconds.get(0, milli: 250),
      end: Seconds.get(0, milli: 750),
    ).tween(
      'o2',
      Tween<double>(
        begin: .25,
        end: 1,
      ),
    )
    ..scene(
      begin: Seconds.get(0, milli: 500),
      end: Seconds.get(1),
    ).tween(
      'o1',
      Tween<double>(
        begin: 1,
        end: .25,
      ),
    )
    ..scene(
      begin: Seconds.get(0, milli: 500),
      end: Seconds.get(1),
    ).tween(
      'o3',
      Tween<double>(
        begin: .25,
        end: 1,
      ),
    )
    ..scene(
      begin: Seconds.get(0, milli: 750),
      end: Seconds.get(1, milli: 250),
    ).tween(
      'o2',
      Tween<double>(
        begin: 1,
        end: .25,
      ),
    )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(1, milli: 500),
    ).tween(
      'o3',
      Tween<double>(
        begin: 1,
        end: .25,
      ),
    );
}
