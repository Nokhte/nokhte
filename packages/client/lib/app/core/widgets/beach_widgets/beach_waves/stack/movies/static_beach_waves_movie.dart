import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class StaticBeachWavesMovie {
  static bool get shouldPaintSand => true;
  static MovieTween getMovie(
    List<ColorAndStop> colors,
  ) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(1),
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
                begin: colors.first.color,
                end: colors.first.color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color2,
              ColorTween(
                begin: colors[1].color,
                end: colors[1].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color3,
              ColorTween(
                begin: colors[2].color,
                end: colors[2].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color4,
              ColorTween(
                begin: colors[3].color,
                end: colors[3].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color5,
              ColorTween(
                begin: colors[4].color,
                end: colors[4].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color6,
              ColorTween(
                begin: colors[5].color,
                end: colors[5].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color7,
              ColorTween(
                begin: colors[6].color,
                end: colors[6].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color8,
              ColorTween(
                begin: colors[7].color,
                end: colors[7].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop1,
              Tween<double>(
                begin: colors.first.stop,
                end: colors.first.stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop2,
              Tween<double>(
                begin: colors[1].stop,
                end: colors[1].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop3,
              Tween<double>(
                begin: colors[2].stop,
                end: colors[2].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop4,
              Tween<double>(
                begin: colors[3].stop,
                end: colors[3].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop5,
              Tween<double>(
                begin: colors[4].stop,
                end: colors[4].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop6,
              Tween<double>(
                begin: colors[5].stop,
                end: colors[5].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop7,
              Tween<double>(
                begin: colors[6].stop,
                end: colors[6].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop8,
              Tween<double>(
                begin: colors[7].stop,
                end: colors[7].stop,
              ),
            );
}
