import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class VibrantBlueGradientToTimesUpMovie {
  static bool get shouldPaintSand => true;
  static MovieTween get movie => MovieTween()
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
            begin: WaterColorsAndStops.vibrantBlueGrad.first.color,
            end: WaterColorsAndStops.vibrantBlueGrad.first.color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color2,
          ColorTween(
            begin: WaterColorsAndStops.vibrantBlueGrad[1].color,
            end: WaterColorsAndStops.vibrantBlueGrad[1].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color3,
          ColorTween(
            begin: WaterColorsAndStops.vibrantBlueGrad[2].color,
            end: WaterColorsAndStops.vibrantBlueGrad[2].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color4,
          ColorTween(
            begin: WaterColorsAndStops.vibrantBlueGrad[3].color,
            end: WaterColorsAndStops.vibrantBlueGrad[3].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color5,
          ColorTween(
            begin: WaterColorsAndStops.vibrantBlueGrad[4].color,
            end: WaterColorsAndStops.vibrantBlueGrad[4].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color6,
          ColorTween(
            begin: WaterColorsAndStops.vibrantBlueGrad[5].color,
            end: WaterColorsAndStops.vibrantBlueGrad[5].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color7,
          ColorTween(
            begin: WaterColorsAndStops.vibrantBlueGrad[6].color,
            end: WaterColorsAndStops.vibrantBlueGrad[6].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.color8,
          ColorTween(
            begin: WaterColorsAndStops.vibrantBlueGrad[7].color,
            end: WaterColorsAndStops.vibrantBlueGrad[7].color,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop1,
          Tween<double>(
            begin: WaterColorsAndStops.vibrantBlueGrad.first.stop,
            end: WaterColorsAndStops.vibrantBlueGrad.first.stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop2,
          Tween<double>(
            begin: WaterColorsAndStops.vibrantBlueGrad[1].stop,
            end: WaterColorsAndStops.vibrantBlueGrad[1].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop3,
          Tween<double>(
            begin: WaterColorsAndStops.vibrantBlueGrad[2].stop,
            end: WaterColorsAndStops.vibrantBlueGrad[2].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop4,
          Tween<double>(
            begin: WaterColorsAndStops.vibrantBlueGrad[3].stop,
            end: WaterColorsAndStops.vibrantBlueGrad[3].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop5,
          Tween<double>(
            begin: WaterColorsAndStops.vibrantBlueGrad[4].stop,
            end: WaterColorsAndStops.vibrantBlueGrad[4].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop6,
          Tween<double>(
            begin: WaterColorsAndStops.vibrantBlueGrad[5].stop,
            end: WaterColorsAndStops.vibrantBlueGrad[5].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop7,
          Tween<double>(
            begin: WaterColorsAndStops.vibrantBlueGrad[6].stop,
            end: WaterColorsAndStops.vibrantBlueGrad[6].stop,
          ),
        )
        .tween(
          BeachWaveAnimationKeys.stop8,
          Tween<double>(
            begin: WaterColorsAndStops.vibrantBlueGrad[7].stop,
            end: WaterColorsAndStops.vibrantBlueGrad[7].stop,
          ),
        );
}
