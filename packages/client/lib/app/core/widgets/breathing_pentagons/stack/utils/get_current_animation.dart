import 'package:simple_animations/simple_animations.dart';

class GetCurrentAnimation {
  static List<dynamic> values(Movie value) {
    final currentAngle = value.get('angle');
    final currentScale = value.get('scale');
    final currentFirstPentagonFirstGradient =
        value.get('1st Pentagon > 1st Gradient Color');
    final currentFirstPentagonSecondGradient =
        value.get('1st Pentagon > 2nd Gradient Color');
    final currentSecondPentagonFirstGradient =
        value.get('2nd Pentagon > 1st Gradient Color');
    final currentSecondPentagonSecondGradient =
        value.get('2nd Pentagon > 2nd Gradient Color');
    final currentThirdPentagonFirstGradient =
        value.get('3rd Pentagon > 1st Gradient Color');
    final currentThirdPentagonSecondGradient =
        value.get('3rd Pentagon > 2nd Gradient Color');
    return [
      currentAngle,
      currentScale,
      currentFirstPentagonFirstGradient,
      currentFirstPentagonSecondGradient,
      currentSecondPentagonFirstGradient,
      currentSecondPentagonSecondGradient,
      currentThirdPentagonFirstGradient,
      currentThirdPentagonSecondGradient,
    ];
  }
}
