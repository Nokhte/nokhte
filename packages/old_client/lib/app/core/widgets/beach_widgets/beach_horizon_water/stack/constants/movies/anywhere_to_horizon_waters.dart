import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class AnywhereToHorizonWaters {
  static MovieTween getMovie(
    List<ColorAndStop> startingGradient,
    List<ColorAndStop> fullScreenGradientColorsAndStops,
    List<ColorAndStop> halfScreenGradientColorsAndStops,
  ) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(2),
        )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: startingGradient.first.color,
                end: fullScreenGradientColorsAndStops.first.color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: startingGradient[1].color,
                end: fullScreenGradientColorsAndStops[1].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: startingGradient[2].color,
                end: fullScreenGradientColorsAndStops[2].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: startingGradient[3].color,
                end: fullScreenGradientColorsAndStops[3].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: startingGradient[4].color,
                end: fullScreenGradientColorsAndStops[4].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: startingGradient[5].color,
                end: fullScreenGradientColorsAndStops[5].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: startingGradient[6].color,
                end: fullScreenGradientColorsAndStops[6].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: startingGradient[7].color,
                end: fullScreenGradientColorsAndStops[7].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: startingGradient.first.stop,
                end: fullScreenGradientColorsAndStops.first.stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[1].stop,
                end: fullScreenGradientColorsAndStops[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[2].stop,
                end: fullScreenGradientColorsAndStops[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[3].stop,
                end: fullScreenGradientColorsAndStops[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[4].stop,
                end: fullScreenGradientColorsAndStops[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[5].stop,
                end: fullScreenGradientColorsAndStops[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[6].stop,
                end: fullScreenGradientColorsAndStops[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[7].stop,
                end: fullScreenGradientColorsAndStops[7].stop,
              ),
            )
        ..scene(
          begin: Seconds.get(2),
          end: Seconds.get(4),
        )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops.first.color,
                end: halfScreenGradientColorsAndStops.first.color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[1].color,
                end: halfScreenGradientColorsAndStops[1].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[2].color,
                end: halfScreenGradientColorsAndStops[2].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[3].color,
                end: halfScreenGradientColorsAndStops[3].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[4].color,
                end: halfScreenGradientColorsAndStops[4].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[5].color,
                end: halfScreenGradientColorsAndStops[5].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[6].color,
                end: halfScreenGradientColorsAndStops[6].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: fullScreenGradientColorsAndStops[7].color,
                end: halfScreenGradientColorsAndStops[7].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops.first.stop,
                end: fullScreenGradientColorsAndStops.first.stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[1].stop,
                end: fullScreenGradientColorsAndStops[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[2].stop,
                end: fullScreenGradientColorsAndStops[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[3].stop,
                end: fullScreenGradientColorsAndStops[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[4].stop,
                end: fullScreenGradientColorsAndStops[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[5].stop,
                end: fullScreenGradientColorsAndStops[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[6].stop,
                end: fullScreenGradientColorsAndStops[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[7].stop,
                end: fullScreenGradientColorsAndStops[7].stop,
              ),
            )
        ..scene(
          begin: Seconds.get(4),
          end: Seconds.get(6),
        )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: halfScreenGradientColorsAndStops.first.color,
                end: halfScreenGradientColorsAndStops.first.color,
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
                begin: fullScreenGradientColorsAndStops.first.stop,
                end: halfScreenGradientColorsAndStops.first.stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[1].stop,
                end: halfScreenGradientColorsAndStops[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[2].stop,
                end: halfScreenGradientColorsAndStops[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[3].stop,
                end: halfScreenGradientColorsAndStops[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[4].stop,
                end: halfScreenGradientColorsAndStops[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[5].stop,
                end: halfScreenGradientColorsAndStops[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[6].stop,
                end: halfScreenGradientColorsAndStops[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: fullScreenGradientColorsAndStops[7].stop,
                end: halfScreenGradientColorsAndStops[7].stop,
              ),
            )
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(2),
        ).tween(
          'water value',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        ..scene(
          begin: Seconds.get(2),
          end: Seconds.get(6),
        ).tween(
          'water value',
          Tween<double>(
            begin: 0,
            end: 510,
          ),
        )
        ..scene(
          begin: Seconds.get(6),
          end: Seconds.get(6, milli: 800),
        ).tween(
          'water value',
          Tween<double>(
            begin: 510,
            end: 500,
          ),
        );
}
