import 'package:simple_animations/simple_animations.dart';

class GetCurrentWaterAnimation {
  static List<dynamic> values(Movie value) {
    final currentWaterValue = value.get('water movement');
    final firstWaterGradient = value.get('1st Water Gradient Color');
    final secondWaterGradient = value.get('2nd Water Gradient Color');
    final thirdWaterGradient = value.get('3rd Water Gradient Color');
    final fourthWaterGradient = value.get('4th Water Gradient Color');
    final fifthWaterGradient = value.get('5th Water Gradient Color');
    final sixthWaterGradient = value.get('6th Water Gradient Color');
    final seventhWaterGradient = value.get('7th Water Gradient Color');
    final eighthWaterGradient = value.get('8th Water Gradient Color');
    final firstWaterGradientStop = value.get('1st Water Gradient Stop');
    final secondWaterGradientStop = value.get('2nd Water Gradient Stop');
    final thirdWaterGradientStop = value.get('3rd Water Gradient Stop');
    final fourthWaterGradientStop = value.get('4th Water Gradient Stop');
    final fifthWaterGradientStop = value.get('5th Water Gradient Stop');
    final sixthWaterGradientStop = value.get('6th Water Gradient Stop');
    final seventhWaterGradientStop = value.get('7th Water Gradient Stop');
    final eighthWaterGradientStop = value.get('8th Water Gradient Stop');

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
