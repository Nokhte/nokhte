import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class ExitStatusIndicatorMovies {
  static MovieTween adjust({
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

  static MovieTween complete({required double startingPercent}) => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'percentage',
          Tween<double>(
            begin: startingPercent,
            end: 100,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'opacity',
          Tween<double>(
            begin: 1,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(2),
    )
        .tween(
          'stroke',
          Tween<double>(
            begin: 10,
            end: 90,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'radius',
          Tween<double>(
            begin: 50,
            end: 10,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
    ..scene(
      begin: Seconds.get(2),
      end: Seconds.get(3),
    )
        .tween(
          'stroke',
          Tween<double>(
            begin: 90,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'radius',
          Tween<double>(
            begin: 10,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        );

  static MovieTween hide({required double startingPercent}) => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'percentage',
          Tween<double>(
            begin: startingPercent,
            end: 100,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'opacity',
          Tween<double>(
            begin: 1,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(2),
    )
        .tween(
          'stroke',
          Tween<double>(
            begin: 10,
            end: 90,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'radius',
          Tween<double>(
            begin: 50,
            end: 10,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
    ..scene(
      begin: Seconds.get(2),
      end: Seconds.get(3),
    )
        .tween(
          'radius',
          Tween<double>(
            begin: 10,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'stroke',
          Tween<double>(
            begin: 90,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        );

  static MovieTween show({required double startingPercent}) => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'radius',
          Tween<double>(
            begin: 0,
            end: 10,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'stroke',
          Tween<double>(
            begin: 0,
            end: 90,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(2),
    )
        .tween(
          'stroke',
          Tween<double>(
            begin: 90,
            end: 10,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'radius',
          Tween<double>(
            begin: 10,
            end: 50,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
    ..scene(
      begin: Seconds.get(2),
      end: Seconds.get(3),
    )
        .tween(
          'percentage',
          Tween<double>(
            begin: 100,
            end: startingPercent,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'opacity',
          Tween<double>(
            begin: 0,
            end: 1,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        );
}
