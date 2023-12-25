import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class SetUpTheClockfaceMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          ClockFaceMovieProperties.hourMarkLength,
          Tween<double>(
            begin: 0,
            end: 20.0,
          ),
        )
        .tween(
          ClockFaceMovieProperties.threeLineOneLength,
          Tween<double>(
            begin: 0,
            end: 30,
          ),
        )
        .tween(
          ClockFaceMovieProperties.threeLineTwoLength,
          Tween<double>(
            begin: 0,
            end: 30,
          ),
        )
        .tween(
          ClockFaceMovieProperties.threeLineThreeLength,
          Tween<double>(
            begin: 0,
            end: 30,
          ),
        )
        .tween(
          ClockFaceMovieProperties.sixLineOneLength,
          Tween<double>(
            begin: 0,
            end: 30,
          ),
        )
        .tween(
          ClockFaceMovieProperties.sixLineTwoLength,
          Tween<double>(
            begin: 0,
            end: 30,
          ),
        )
        .tween(
          ClockFaceMovieProperties.sixLineThreeLength,
          Tween<double>(
            begin: 0,
            end: 30,
          ),
        )
        .tween(
          ClockFaceMovieProperties.nineLineOneLength,
          Tween<double>(
            begin: 0,
            end: 30,
          ),
        )
        .tween(
          ClockFaceMovieProperties.nineLineTwoLength,
          Tween<double>(
            begin: 0,
            end: 30,
          ),
        )
        .tween(
          ClockFaceMovieProperties.nineLineThreeLength,
          Tween<double>(
            begin: 0,
            end: 30,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineOneLength,
          Tween<double>(
            begin: 0,
            end: 30,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineTwoLength,
          Tween<double>(
            begin: 0,
            end: 30,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineThreeLength,
          Tween<double>(
            begin: 0,
            end: 30,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineFourLength,
          Tween<double>(
            begin: 0,
            end: 30,
          ),
        )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(2),
    )
        .tween(
          ClockFaceMovieProperties.threeLineOneRotation,
          Tween<double>(
            begin: 0,
            end: 1.55,
          ),
        )
        .tween(
          ClockFaceMovieProperties.threeLineTwoRotation,
          Tween<double>(
            begin: 0,
            end: 1.55,
          ),
        )
        .tween(
          ClockFaceMovieProperties.threeLineThreeRotation,
          Tween<double>(
            begin: 0,
            end: 1.55,
          ),
        )
        .tween(
          ClockFaceMovieProperties.sixLineOneTranslation,
          Tween<double>(
            begin: 0,
            end: -4,
          ),
        )
        .tween(
          ClockFaceMovieProperties.sixLineTwoTranslation,
          Tween<double>(
            begin: 0,
            end: -12,
          ),
        )
        .tween(
          ClockFaceMovieProperties.sixLineThreeTranslation,
          Tween<double>(
            begin: 0,
            end: 9,
          ),
        )
        .tween(
          ClockFaceMovieProperties.nineLineOneRotation,
          Tween<double>(
            begin: 0,
            end: 1.55,
          ),
        )
        .tween(
          ClockFaceMovieProperties.nineLineTwoRotation,
          Tween<double>(
            begin: 0,
            end: 1.55,
          ),
        )
        .tween(
          ClockFaceMovieProperties.nineLineThreeRotation,
          Tween<double>(
            begin: 0,
            end: 1.55,
          ),
        )
        .tween(
          ClockFaceMovieProperties.nineLineOneTranslation,
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          ClockFaceMovieProperties.nineLineTwoTranslation,
          Tween<double>(
            begin: 0,
            end: 15,
          ),
        )
        .tween(
          ClockFaceMovieProperties.nineLineThreeTranslation,
          Tween<double>(
            begin: 0,
            end: 15,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineOneTranslation,
          Tween<double>(
            begin: 0,
            end: -15,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineTwoTranslation,
          Tween<double>(
            begin: 0,
            end: -15,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineThreeTranslation,
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineFourTranslation,
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
    ..scene(
      begin: Seconds.get(2),
      end: Seconds.get(3),
    )
        .tween(
          ClockFaceMovieProperties.threeLineOneTranslation,
          Tween<double>(
            begin: 0,
            end: -10,
          ),
        )
        .tween(
          ClockFaceMovieProperties.threeLineTwoTranslation,
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          ClockFaceMovieProperties.threeLineThreeTranslation,
          Tween<double>(
            begin: 0,
            end: 10,
          ),
        )
        .tween(
          ClockFaceMovieProperties.sixLineOneRotation,
          Tween<double>(
            begin: 0,
            end: .25,
          ),
        )
        .tween(
          ClockFaceMovieProperties.sixLineTwoRotation,
          Tween<double>(
            begin: 0,
            end: -.25,
          ),
        )
        .tween(
          ClockFaceMovieProperties.sixLineThreeRotation,
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          ClockFaceMovieProperties.nineLineTwoRotation,
          Tween<double>(
            begin: 1.5,
            end: 1.1,
          ),
        )
        .tween(
          ClockFaceMovieProperties.nineLineThreeRotation,
          Tween<double>(
            begin: 1.5,
            end: 1.9,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineOneRotation,
          Tween<double>(
            begin: 0,
            end: -.4,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineTwoRotation,
          Tween<double>(
            begin: 0,
            end: .4,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineThreeRotation,
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineFourRotation,
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineFourTranslation,
          Tween<double>(
            begin: 0,
            end: 8,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineOneLength,
          Tween<double>(
            begin: 30,
            end: 33,
          ),
        )
        .tween(
          ClockFaceMovieProperties.twelveLineTwoLength,
          Tween<double>(
            begin: 30,
            end: 33,
          ),
        )
        .tween(
          ClockFaceMovieProperties.nineLineTwoLength,
          Tween<double>(
            begin: 30,
            end: 33,
          ),
        )
        .tween(
          ClockFaceMovieProperties.nineLineThreeLength,
          Tween<double>(
            begin: 30,
            end: 33,
          ),
        );
}
