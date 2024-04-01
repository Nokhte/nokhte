import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class WaterWakeMovie with TouchRippleMovieProps {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(2),
    )
        .tween(
          TouchRippleMovieProps.circle1Radius,
          Tween<double>(
            begin: 0.0,
            end: 60.0,
          ),
        )
        .tween(
          TouchRippleMovieProps.circle1Opacity,
          Tween<double>(
            begin: 1.0,
            end: 0.0,
          ),
        )
        .tween(
          TouchRippleMovieProps.circle2Radius,
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        )
        .tween(
          TouchRippleMovieProps.circle2Opacity,
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        )
        .tween(
          TouchRippleMovieProps.circle3Radius,
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        )
        .tween(
          TouchRippleMovieProps.circle3Opacity,
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
        );
}
