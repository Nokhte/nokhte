import 'package:simple_animations/simple_animations.dart';

class GetCurrentWaterAnimation {
  static List<dynamic> values(Movie value) {
    final currentWaterValue = value.get('water movement');
    final firstWaterGradient = value.get('1st Water Gradient Color');
    final secondWaterGradient = value.get('2nd Water Gradient Color');
    final thirdWaterGradient = value.get('3rd Water Gradient Color');
    final fourthWaterGradient = value.get('4th Water Gradient Color');
    final fifthWaterGradient = value.get('5th Water Gradient Color');
    return [
      currentWaterValue,
      firstWaterGradient,
      secondWaterGradient,
      thirdWaterGradient,
      fourthWaterGradient,
      fifthWaterGradient,
    ];
  }
}
