import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class AdjustSessionExitStatusIndicatorMovie {
  static MovieTween getMovie({
    required double startingPercent,
    required double endingPercent,
  }) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(1),
        )
            .tween(
              'stroke',
              Tween<double>(
                begin: 10,
                end: 10,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
            .tween(
              'radius',
              Tween<double>(
                begin: 50,
                end: 50,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
            .tween(
              'percentage',
              Tween<double>(
                begin: startingPercent,
                end: endingPercent,
              ),
              curve: Curves.easeInOutCubicEmphasized,
            )
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(0, milli: 500),
        ).tween(
          'opacity',
          Tween<double>(
            begin: 1,
            end: 0,
          ),
        )
        ..scene(
          begin: Seconds.get(0, milli: 500),
          end: Seconds.get(1),
        ).tween(
          'opacity',
          Tween<double>(
            begin: 0,
            end: 1,
          ),
        );
}
