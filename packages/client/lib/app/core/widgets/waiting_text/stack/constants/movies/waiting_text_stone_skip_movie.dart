import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class WaitingTextStoneSkipMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(2),
    ).tween(
      'topLengthScalar',
      Tween<double>(
        begin: -.09,
        end: -.94,
      ),
    )
    ..scene(
      begin: Seconds.get(2),
      end: Seconds.get(2, milli: 500),
    ).tween(
      'roundness',
      Tween<double>(
        begin: .0,
        end: 2.0,
      ),
    )
    ..scene(
      begin: Seconds.get(2, milli: 500),
      end: Seconds.get(2, milli: 501),
    )
        .tween(
          'rectOpacity',
          Tween<double>(
            begin: 1.0,
            end: 0.0,
          ),
        )
        .tween(
          'circleOpacity',
          Tween<double>(
            begin: 0,
            end: 1.0,
          ),
        )
    ..scene(
      begin: Seconds.get(2, milli: 501),
      end: Seconds.get(3, milli: 500),
    ).tween(
      'circleRadius',
      Tween<double>(
        begin: 2.2,
        end: 4.0,
      ),
    )
    ..scene(
      begin: Seconds.get(3, milli: 500),
      end: Seconds.get(4, milli: 500),
    )
        .tween(
          'circleXOffset',
          Tween<double>(
            begin: 0,
            end: -10.0,
          ),
        )
        .tween(
          'circleYOffset',
          Tween<double>(
            begin: 0,
            end: 50.0,
          ),
        )
        .tween(
          'circleRadius',
          Tween<double>(
            begin: 4.0,
            end: 2.2,
          ),
        )
    ..scene(
      begin: Seconds.get(4, milli: 500),
      end: Seconds.get(5, milli: 500),
    )
        .tween(
          'circleXOffset',
          Tween<double>(
            begin: -10.0,
            end: -20.0,
          ),
        )
        .tween(
          'circleYOffset',
          Tween<double>(
            begin: 50,
            end: 100.0,
          ),
        )
        .tween(
          'circleRadius',
          Tween<double>(
            begin: 2.2,
            end: 4,
          ),
        )
    ..scene(
      begin: Seconds.get(4, milli: 499),
      end: Seconds.get(4, milli: 500),
    ).tween(
      'ripple1Arc1Opacity',
      Tween<double>(
        begin: 0,
        end: 1,
      ),
    )
    ..scene(
      begin: Seconds.get(4, milli: 500),
      end: Seconds.get(7, milli: 500),
    )
        .tween(
          'ripple1Arc1Opacity',
          Tween<double>(
            begin: 1.0,
            end: 0.0,
          ),
        )
        .tween(
          'ripple1Arc1Radius',
          Tween<double>(
            begin: 2.2,
            end: 40.0,
          ),
        )
    ..scene(
      begin: Seconds.get(5, milli: 500),
      end: Seconds.get(6, milli: 500),
    )
        .tween(
          'circleXOffset',
          Tween<double>(
            begin: -20.0,
            end: -30.0,
          ),
        )
        .tween(
          'circleYOffset',
          Tween<double>(
            begin: 100,
            end: 150.0,
          ),
        )
        .tween(
          'circleRadius',
          Tween<double>(
            begin: 4.0,
            end: 2.2,
          ),
        )
    ..scene(
      begin: Seconds.get(6, milli: 500),
      end: Seconds.get(7, milli: 500),
    )
        .tween(
          'circleXOffset',
          Tween<double>(
            begin: -30.0,
            end: -40.0,
          ),
        )
        .tween(
          'circleYOffset',
          Tween<double>(
            begin: 150,
            end: 200.0,
          ),
        )
        .tween(
          'circleRadius',
          Tween<double>(
            begin: 2.2,
            end: 0,
          ),
        )
    ..scene(
      begin: Seconds.get(6, milli: 499),
      end: Seconds.get(6, milli: 500),
    ).tween(
      'ripple1Arc2Opacity',
      Tween<double>(
        begin: 0,
        end: 1,
      ),
    )
    ..scene(
      begin: Seconds.get(6, milli: 500),
      end: Seconds.get(9, milli: 500),
    )
        .tween(
          'ripple1Arc2Opacity',
          Tween<double>(
            begin: 1.0,
            end: 0.0,
          ),
        )
        .tween(
          'ripple1Arc2Radius',
          Tween<double>(
            begin: 2.2,
            end: 40.0,
          ),
        )
    ..scene(
      begin: Seconds.get(8, milli: 999),
      end: Seconds.get(9),
    )
        .tween(
          'topLengthScalar',
          Tween<double>(
            begin: -1,
            end: -1,
          ),
        )
        .tween(
          'roundness',
          Tween<double>(
            begin: .0,
            end: 0,
          ),
        )
        .tween(
          'topLengthScalar',
          Tween<double>(
            begin: -1,
            end: -1,
          ),
        )
        .tween(
          'rectOpacity',
          Tween<double>(
            begin: 0.0,
            end: 1.0,
          ),
        )
    ..scene(
      begin: Seconds.get(9),
      end: Seconds.get(11),
    ).tween(
      'topLengthScalar',
      Tween<double>(
        begin: -1,
        end: -.09,
      ),
    );
}
