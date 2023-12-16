import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class PlaceTheCircleMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'blur',
          Tween<double>(
            begin: 0.0,
            end: 10.0,
          ),
        )
        .tween(
          'circleOpacity',
          Tween<double>(
            begin: 0.0,
            end: 1.0,
          ),
        )
        .tween(
          'circleRadius',
          Tween<double>(
            begin: 15.0,
            end: 15.0,
          ),
        )
        .tween(
          'arc1Radius',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        )
        .tween(
          'arc1Opacity',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        )
        .tween(
          'arc2Radius',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        )
        .tween(
          'arc2Opacity',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        )
        .tween(
          'arc3Radius',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        )
        .tween(
          'arc3Opacity',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(2),
    ).tween(
      'circleRadius',
      Tween<double>(
        begin: 15.0,
        end: 4.0,
      ),
    );
}
