import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/color_and_stop.dart';
import 'package:simple_animations/simple_animations.dart';

class BottomUpImmersionWaters {
  static MovieTween getMovie(
    List<ColorAndStop> theGradient,
  ) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(20),
        )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: theGradient[0].color,
                end: theGradient[0].color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: theGradient[1].color,
                end: theGradient[1].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: theGradient[2].color,
                end: theGradient[2].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: theGradient[3].color,
                end: theGradient[3].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: theGradient[4].color,
                end: theGradient[4].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: theGradient[5].color,
                end: theGradient[5].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: theGradient[6].color,
                end: theGradient[6].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: theGradient[7].color,
                end: theGradient[7].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: theGradient[0].stop,
                end: theGradient[0].stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: theGradient[1].stop,
                end: theGradient[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: theGradient[2].stop,
                end: theGradient[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: theGradient[3].stop,
                end: theGradient[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: theGradient[4].stop,
                end: theGradient[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: theGradient[5].stop,
                end: theGradient[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: theGradient[6].stop,
                end: theGradient[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: theGradient[7].stop,
                end: theGradient[7].stop,
              ),
            )
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(10),
        ).tween(
          'water value',
          Tween<double>(
            begin: 1000,
            end: 0,
          ),
        )
        ..scene(
          begin: Seconds.get(10),
          end: Seconds.get(20),
        ).tween(
          'water value',
          Tween<double>(
            begin: 0,
            end: 1000,
          ),
        );
}
