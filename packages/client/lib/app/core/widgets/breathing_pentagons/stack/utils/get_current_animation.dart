/// get_current_animation.dart
/// Proofreading Information:
///   - Proofreader: Sonny Vesali
///   - Date: July 30th 2023
///
/// Author: Sonny Vesali
///
/// This utility class provides a method to extract the current state of the
/// [Movie] animation and return it as a list of dynamic values. It is intended
/// to be invoked when the user wants to induce a windDown animation. The
/// [GetCurrentAnimation.values] function is called in the builder of the
/// [BreathingPentagonsButton] widget, allowing the animation to be tracked
/// accurately.
///
/// The [GetCurrentAnimation.values] function takes a [Movie] object as input
/// and extracts the following animation properties:
/// - `angle`: The current angle of rotation of the pentagons.
/// - `scale`: The current scale of the pentagons.
/// - `1st Pentagon > 1st Gradient Color`: The first gradient color of the
///   first pentagon. This property is used to ensure smooth animation when
///   animating the colors of the pentagons using radial gradients.
/// - `1st Pentagon > 2nd Gradient Color`: The second gradient color of the
///   first pentagon. Similar to the above, it's used for smooth color animation.
/// - `2nd Pentagon > 1st Gradient Color`: The first gradient color of the
///   second pentagon.
/// - `2nd Pentagon > 2nd Gradient Color`: The second gradient color of the
///   second pentagon.
/// - `3rd Pentagon > 1st Gradient Color`: The first gradient color of the
///   third pentagon.
/// - `3rd Pentagon > 2nd Gradient Color`: The second gradient color of the
///   third pentagon.
///
/// Note: The pentagons use radial gradients to achieve the animated color
/// transition effect. To ensure smooth animation, each gradient color is
/// extracted individually and tracked separately during the animation process.
///
/// Example usage:
/// ```dart
/// Movie currentMovie = Movie.builder(
///   duration: Duration(seconds: 2),
///   tweenMap: {
///     'angle': Tween<double>(begin: 0.0, end: 360.0),
///     'scale': Tween<double>(begin: 1.0, end: 1.5),
///      // ... other tween properties
///   },
/// ).animate(controller);
///
/// List<dynamic> currentAnimationValues = GetCurrentAnimation.values(currentMovie);
/// ```
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
