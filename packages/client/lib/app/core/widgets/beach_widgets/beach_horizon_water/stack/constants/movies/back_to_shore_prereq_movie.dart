import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/color_and_stop.dart';
import 'package:simple_animations/simple_animations.dart';

class BackToShorePreReqMovie {
  static MovieTween getMovie(
    List<ColorAndStop> halfScreenGradientColorsAndStops,
  ) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(3),
        )
            .tween(
              'water value',
              Tween<double>(
                begin: 1000,
                end: 500,
              ),
            )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[0].color,
                end: halfScreenGradientColorsAndStops[0].color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[1].color,
                end: halfScreenGradientColorsAndStops[1].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[2].color,
                end: halfScreenGradientColorsAndStops[2].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[3].color,
                end: halfScreenGradientColorsAndStops[3].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[4].color,
                end: halfScreenGradientColorsAndStops[4].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[5].color,
                end: halfScreenGradientColorsAndStops[5].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[6].color,
                end: halfScreenGradientColorsAndStops[6].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops[7].color,
                end: halfScreenGradientColorsAndStops[7].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: halfScreenGradientColorsAndStops[0].stop,
                end: halfScreenGradientColorsAndStops[0].stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: halfScreenGradientColorsAndStops[1].stop,
                end: halfScreenGradientColorsAndStops[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: halfScreenGradientColorsAndStops[2].stop,
                end: halfScreenGradientColorsAndStops[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: halfScreenGradientColorsAndStops[3].stop,
                end: halfScreenGradientColorsAndStops[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: halfScreenGradientColorsAndStops[4].stop,
                end: halfScreenGradientColorsAndStops[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: halfScreenGradientColorsAndStops[5].stop,
                end: halfScreenGradientColorsAndStops[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: halfScreenGradientColorsAndStops[6].stop,
                end: halfScreenGradientColorsAndStops[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: halfScreenGradientColorsAndStops[7].stop,
                end: halfScreenGradientColorsAndStops[7].stop,
              ),
            );
}
