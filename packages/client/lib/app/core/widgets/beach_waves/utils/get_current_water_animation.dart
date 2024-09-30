import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class GetCurrentWaterAnimation {
  static List<Color> colors(
    Movie value, {
    String prefix = '',
  }) {
    final firstWaterGradient =
        value.get(prefix + BeachWaveAnimationKeys.color1);
    final secondWaterGradient =
        value.get(prefix + BeachWaveAnimationKeys.color2);
    final thirdWaterGradient =
        value.get(prefix + BeachWaveAnimationKeys.color3);
    final fourthWaterGradient =
        value.get(prefix + BeachWaveAnimationKeys.color4);
    final fifthWaterGradient =
        value.get(prefix + BeachWaveAnimationKeys.color5);
    final sixthWaterGradient =
        value.get(prefix + BeachWaveAnimationKeys.color6);
    final seventhWaterGradient =
        value.get(prefix + BeachWaveAnimationKeys.color7);
    final eighthWaterGradient =
        value.get(prefix + BeachWaveAnimationKeys.color8);

    return <Color>[
      firstWaterGradient,
      secondWaterGradient,
      thirdWaterGradient,
      fourthWaterGradient,
      fifthWaterGradient,
      sixthWaterGradient,
      seventhWaterGradient,
      eighthWaterGradient,
    ];
  }

  static List<double> stops(
    Movie value, {
    String prefix = '',
  }) {
    final firstWaterGradientStop =
        value.get(prefix + BeachWaveAnimationKeys.stop1);
    final secondWaterGradientStop =
        value.get(prefix + BeachWaveAnimationKeys.stop2);
    final thirdWaterGradientStop =
        value.get(prefix + BeachWaveAnimationKeys.stop3);
    final fourthWaterGradientStop =
        value.get(prefix + BeachWaveAnimationKeys.stop4);
    final fifthWaterGradientStop =
        value.get(prefix + BeachWaveAnimationKeys.stop5);
    final sixthWaterGradientStop =
        value.get(prefix + BeachWaveAnimationKeys.stop6);
    final seventhWaterGradientStop =
        value.get(prefix + BeachWaveAnimationKeys.stop7);
    final eighthWaterGradientStop =
        value.get(prefix + BeachWaveAnimationKeys.stop8);

    return <double>[
      firstWaterGradientStop,
      secondWaterGradientStop,
      thirdWaterGradientStop,
      fourthWaterGradientStop,
      fifthWaterGradientStop,
      sixthWaterGradientStop,
      seventhWaterGradientStop,
      eighthWaterGradientStop,
    ];
  }

  static List<dynamic> values(Movie value) {
    final currentWaterValue = value.get(BeachWaveAnimationKeys.waterMovement);
    final firstWaterGradient = value.get(BeachWaveAnimationKeys.color1);
    final secondWaterGradient = value.get(BeachWaveAnimationKeys.color2);
    final thirdWaterGradient = value.get(BeachWaveAnimationKeys.color3);
    final fourthWaterGradient = value.get(BeachWaveAnimationKeys.color4);
    final fifthWaterGradient = value.get(BeachWaveAnimationKeys.color5);
    final sixthWaterGradient = value.get(BeachWaveAnimationKeys.color6);
    final seventhWaterGradient = value.get(BeachWaveAnimationKeys.color7);
    final eighthWaterGradient = value.get(BeachWaveAnimationKeys.color8);
    final firstWaterGradientStop = value.get(BeachWaveAnimationKeys.stop1);
    final secondWaterGradientStop = value.get(BeachWaveAnimationKeys.stop2);
    final thirdWaterGradientStop = value.get(BeachWaveAnimationKeys.stop3);
    final fourthWaterGradientStop = value.get(BeachWaveAnimationKeys.stop4);
    final fifthWaterGradientStop = value.get(BeachWaveAnimationKeys.stop5);
    final sixthWaterGradientStop = value.get(BeachWaveAnimationKeys.stop6);
    final seventhWaterGradientStop = value.get(BeachWaveAnimationKeys.stop7);
    final eighthWaterGradientStop = value.get(BeachWaveAnimationKeys.stop8);

    return [
      currentWaterValue,
      firstWaterGradient,
      secondWaterGradient,
      thirdWaterGradient,
      fourthWaterGradient,
      fifthWaterGradient,
      sixthWaterGradient,
      seventhWaterGradient,
      eighthWaterGradient,
      firstWaterGradientStop,
      secondWaterGradientStop,
      thirdWaterGradientStop,
      fourthWaterGradientStop,
      fifthWaterGradientStop,
      sixthWaterGradientStop,
      seventhWaterGradientStop,
      eighthWaterGradientStop,
    ];
  }
}
