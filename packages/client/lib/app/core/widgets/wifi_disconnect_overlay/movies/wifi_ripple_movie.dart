import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class WifiRippleMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(0, milli: 500),
    )
        .tween(
          CircleMovieProps.circleRadius,
          Tween<double>(
            begin: 4.0,
            end: 4.0,
          ),
        )
        .tween(
          CircleMovieProps.circle1Radius,
          Tween<double>(
            begin: 0,
            end: 15.0,
          ),
        )
        .tween(
          CircleMovieProps.circle2Radius,
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          CircleMovieProps.circle3Radius,
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          CircleMovieProps.blur,
          Tween<double>(
            begin: 10.0,
            end: 10.0,
          ),
        )
        .tween(
          CircleMovieProps.arc1Radius,
          Tween<double>(
            begin: 0.0,
            end: 15.0,
          ),
        )
        .tween(
          CircleMovieProps.arc1Opacity,
          Tween<double>(
            begin: 0.0,
            end: 1.0,
          ),
        )
        .tween(
          CircleMovieProps.circle1Opacity,
          Tween<double>(
            begin: 0.0,
            end: 1.0,
          ),
        )
    ..scene(
      begin: Seconds.get(0, milli: 500),
      end: Seconds.get(1),
    )
        .tween(
          CircleMovieProps.circleOpacity,
          Tween<double>(
            begin: 1.0,
            end: 0.25,
          ),
        )
        .tween(
          CircleMovieProps.arc1Radius,
          Tween<double>(
            begin: 15.0,
            end: 30.0,
          ),
        )
        .tween(
          CircleMovieProps.arc2Radius,
          Tween<double>(
            begin: 0.0,
            end: 15.0,
          ),
        )
        .tween(
          CircleMovieProps.arc2Opacity,
          Tween<double>(
            begin: 1.0,
            end: 1.0,
          ),
        )
        .tween(
          CircleMovieProps.circle2Opacity,
          Tween<double>(
            begin: 1.0,
            end: 1.0,
          ),
        )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(1, milli: 500),
    )
        .tween(
          CircleMovieProps.circleOpacity,
          Tween<double>(
            begin: 0.25,
            end: 0.0,
          ),
        )
        .tween(
          CircleMovieProps.arc1Radius,
          Tween<double>(
            begin: 30.0,
            end: 45.0,
          ),
        )
        .tween(
          CircleMovieProps.arc2Radius,
          Tween<double>(
            begin: 15.0,
            end: 30.0,
          ),
        )
        .tween(
          CircleMovieProps.arc3Radius,
          Tween<double>(
            begin: 0,
            end: 15.0,
          ),
        )
        .tween(
          CircleMovieProps.arc3Opacity,
          Tween<double>(
            begin: 0.0,
            end: 1.0,
          ),
        )
        .tween(
          CircleMovieProps.circle3Opacity,
          Tween<double>(
            begin: 0.0,
            end: 1.0,
          ),
        )
    ..scene(
      begin: Seconds.get(0, milli: 500),
      end: Seconds.get(3),
    )
        .tween(
          CircleMovieProps.circle1Radius,
          Tween<double>(
            begin: 15.0,
            end: 120.0,
          ),
        )
        .tween(
          CircleMovieProps.circle1Opacity,
          Tween<double>(
            begin: 1.0,
            end: 0.0,
          ),
        )
        .tween(
          CircleMovieProps.arc1Opacity,
          Tween<double>(
            begin: 1.0,
            end: 0.0,
          ),
        )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(3, milli: 500),
    )
        .tween(
          CircleMovieProps.circle2Radius,
          Tween<double>(
            begin: 15.0,
            end: 120.0,
          ),
        )
        .tween(
          CircleMovieProps.circle2Opacity,
          Tween<double>(
            begin: 1.0,
            end: 0.0,
          ),
        )
        .tween(
          CircleMovieProps.arc2Opacity,
          Tween<double>(
            begin: 1.0,
            end: 0.0,
          ),
        )
    ..scene(
      begin: Seconds.get(1, milli: 500),
      end: Seconds.get(4),
    )
        .tween(
          CircleMovieProps.circle3Radius,
          Tween<double>(
            begin: 15.0,
            end: 120.0,
          ),
        )
        .tween(
          CircleMovieProps.circle3Opacity,
          Tween<double>(
            begin: 1.0,
            end: 0.0,
          ),
        )
        .tween(
          CircleMovieProps.arc3Opacity,
          Tween<double>(
            begin: 1.0,
            end: 0.0,
          ),
        );
}
