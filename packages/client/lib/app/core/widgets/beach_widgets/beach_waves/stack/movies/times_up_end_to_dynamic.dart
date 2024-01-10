import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class TimesUpEndToDynamic {
  static bool get shouldPaintSand => true;
  static MovieTween getMovie(List<ColorAndStop> endingColors) => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(2),
    )
        .tween(
          BeachWaveAnimationKeys.waterMovement,
          Tween<double>(
            begin: 100,
            end: 100,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color1,
          ColorTween(
            begin: WaterColorsAndStops.timesUpPhase9.first.color,
            end: endingColors.first.color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color2,
          ColorTween(
            begin: WaterColorsAndStops.timesUpPhase9[1].color,
            end: endingColors[1].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color3,
          ColorTween(
            begin: WaterColorsAndStops.timesUpPhase9[2].color,
            end: endingColors[2].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color4,
          ColorTween(
            begin: WaterColorsAndStops.timesUpPhase9[3].color,
            end: endingColors[3].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color5,
          ColorTween(
            begin: WaterColorsAndStops.timesUpPhase9[4].color,
            end: endingColors[4].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color6,
          ColorTween(
            begin: WaterColorsAndStops.timesUpPhase9[5].color,
            end: endingColors[5].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color7,
          ColorTween(
            begin: WaterColorsAndStops.timesUpPhase9[6].color,
            end: endingColors[6].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color8,
          ColorTween(
            begin: WaterColorsAndStops.timesUpPhase9[7].color,
            end: endingColors[7].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop1,
          Tween<double>(
            begin: WaterColorsAndStops.timesUpPhase9.first.stop,
            end: endingColors.first.stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop2,
          Tween<double>(
            begin: WaterColorsAndStops.timesUpPhase9[1].stop,
            end: endingColors[1].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop3,
          Tween<double>(
            begin: WaterColorsAndStops.timesUpPhase9[2].stop,
            end: endingColors[2].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop4,
          Tween<double>(
            begin: WaterColorsAndStops.timesUpPhase9[3].stop,
            end: endingColors[3].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop5,
          Tween<double>(
            begin: WaterColorsAndStops.timesUpPhase9[4].stop,
            end: endingColors[4].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop6,
          Tween<double>(
            begin: WaterColorsAndStops.timesUpPhase9[5].stop,
            end: endingColors[5].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop7,
          Tween<double>(
            begin: WaterColorsAndStops.timesUpPhase9[6].stop,
            end: endingColors[6].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop8,
          Tween<double>(
            begin: WaterColorsAndStops.timesUpPhase9[7].stop,
            end: endingColors[7].stop,
          ),
        );
}
