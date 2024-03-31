import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class GetCurrentWaterAnimation {
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
