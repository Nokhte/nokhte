import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

mixin BeachWaveUtils {
  static MovieTween staticColors(
          MovieTween movie, List<ColorAndStop> colorway) =>
      movie
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(0, milli: 1),
        )
            .tween(
              BeachWaveAnimationKeys.color1,
              ColorTween(
                begin: colorway.first.color,
                end: colorway.first.color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color2,
              ColorTween(
                begin: colorway[1].color,
                end: colorway[1].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color3,
              ColorTween(
                begin: colorway[2].color,
                end: colorway[2].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color4,
              ColorTween(
                begin: colorway[3].color,
                end: colorway[3].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color5,
              ColorTween(
                begin: colorway[4].color,
                end: colorway[4].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color6,
              ColorTween(
                begin: colorway[5].color,
                end: colorway[5].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color7,
              ColorTween(
                begin: colorway[6].color,
                end: colorway[6].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.color8,
              ColorTween(
                begin: colorway[7].color,
                end: colorway[7].color,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop1,
              Tween<double>(
                begin: colorway.first.stop,
                end: colorway.first.stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop2,
              Tween<double>(
                begin: colorway[1].stop,
                end: colorway[1].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop3,
              Tween<double>(
                begin: colorway[2].stop,
                end: colorway[2].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop4,
              Tween<double>(
                begin: colorway[3].stop,
                end: colorway[3].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop5,
              Tween<double>(
                begin: colorway[4].stop,
                end: colorway[4].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop6,
              Tween<double>(
                begin: colorway[5].stop,
                end: colorway[5].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop7,
              Tween<double>(
                begin: colorway[6].stop,
                end: colorway[6].stop,
              ),
            )
            .tween(
              BeachWaveAnimationKeys.stop8,
              Tween<double>(
                begin: colorway[7].stop,
                end: colorway[7].stop,
              ),
            );
}
