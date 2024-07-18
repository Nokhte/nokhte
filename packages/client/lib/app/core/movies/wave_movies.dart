import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

mixin WaveMovies {
  static MovieTween generateMovie(int startNumber) {
    var movie = MovieTween();

    for (int i = 0; i <= startNumber; i++) {
      final beginTime = Seconds.get(0, milli: (i * 250));
      final endTime = Seconds.get(1, milli: ((i + 1) * 250));

      movie.scene(begin: beginTime, end: endTime).tween(
            'o${startNumber - i}',
            Tween<double>(
              begin: .25,
              end: 1,
            ),
          );

      movie
          .scene(
              begin: endTime, end: Seconds.get(1, milli: ((i + 1) * 250 + 500)))
          .tween(
            'o${startNumber - i}',
            Tween<double>(
              begin: 1,
              end: .25,
            ),
          );
    }
    return movie;
  }
}
