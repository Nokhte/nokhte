import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class DemoPhoneMovies {
  static MovieTween get collaborativeNotes =>
      TwoSecondBeachTransitionMovie.getMovie(
        TwoSecondBeachTransitionMovie.getMovie(
          MovieTween(),
          WaterColorsAndStops.sky,
          WaterColorsAndStops.halfWaterAndSand,
          start: Seconds.get(8),
          end: Seconds.get(10),
        ),
        WaterColorsAndStops.halfWaterAndSand,
        WaterColorsAndStops.sky,
        start: Seconds.get(2),
        end: Seconds.get(4),
      )
        ..scene(
          begin: Seconds.get(2),
          end: Seconds.get(3),
        ).tween(
          'p1Text',
          Tween<double>(
            begin: 1,
            end: 0,
          ),
        )
        ..scene(
          begin: Seconds.get(4),
          end: Seconds.get(5),
        ).tween(
          'p2AboveTextProgress',
          Tween<double>(
            begin: 0,
            end: 1,
          ),
        )
        ..scene(
          begin: Seconds.get(5),
          end: Seconds.get(6),
        ).tween(
          'p2BelowText',
          Tween<double>(
            begin: 0,
            end: 1,
          ),
        )
        ..scene(
          begin: Seconds.get(8),
          end: Seconds.get(9),
        )
            .tween(
              'p2BelowText',
              Tween<double>(
                begin: 1,
                end: 0,
              ),
            )
            .tween(
              'p2AboveTextOpacity',
              Tween<double>(
                begin: 1,
                end: 0,
              ),
            )
        ..scene(
          begin: Seconds.get(10),
          end: Seconds.get(11),
        ).tween(
          'p1Text',
          Tween<double>(
            begin: 0,
            end: 1,
          ),
        );
  static MovieTween get collaborativeSpeaking =>
      TwoSecondBeachTransitionMovie.getMovie(
        TwoSecondBeachTransitionMovie.getMovie(
          TwoSecondBeachTransitionMovie.getMovie(
            MovieTween(),
            WaterColorsAndStops.condensedDrySand,
            WaterColorsAndStops.halfWaterAndSand,
            start: Seconds.get(8),
            end: Seconds.get(10),
            prefix: 'l',
          ),
          prefix: 'l',
          WaterColorsAndStops.halfWaterAndSand,
          WaterColorsAndStops.condensedDrySand,
          start: Seconds.get(2),
          end: Seconds.get(4),
        ),
        prefix: 'r',
        WaterColorsAndStops.halfWaterAndSand,
        WaterColorsAndStops.halfWaterAndSand,
      )
        ..scene(
          begin: Seconds.get(2),
          end: Seconds.get(3),
        )
            .tween(
              'p1Text',
              Tween<double>(
                begin: 1,
                end: 0,
              ),
            )
            .tween(
              'p2Text',
              Tween<double>(
                begin: 0,
                end: 1,
              ),
            )
        ..scene(
          begin: Seconds.get(4),
          end: Seconds.get(5),
        )
            .tween(
              'glowStroke',
              Tween<double>(
                begin: 0,
                end: 5,
              ),
            )
            .tween(
              'glowColor',
              ColorTween(
                begin: const Color(0x0004FF00),
                end: const Color(0xFF04FF00),
              ),
            )
        ..scene(
          begin: Seconds.get(9),
          end: Seconds.get(10),
        )
            .tween(
              'glowStroke',
              Tween<double>(
                begin: 5,
                end: 0,
              ),
            )
            .tween(
              'glowColor',
              ColorTween(
                begin: const Color(0xFF04FF00),
                end: const Color(0x0004FF00),
              ),
            )
            .tween(
              'p2Text',
              Tween<double>(
                begin: 1,
                end: 0,
              ),
            )
        ..scene(
          begin: Seconds.get(10),
          end: Seconds.get(11),
        ).tween(
          'p1Text',
          Tween<double>(
            begin: 0,
            end: 1,
          ),
        );
}
