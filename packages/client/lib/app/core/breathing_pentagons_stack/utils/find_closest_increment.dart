/// find_closest_increment.dart
///
/// Author: Sonny Vesali
/// Proofreading Date: July 30th 2023
///
/// This utility class calculates the closest increment value to a given input
/// based on a fixed increment of 1.25. Used in the windDown animation, each
/// 1.25 increment corresponds to a 180-degree rotation for the
/// `breathingPentagonsButton` widget.
///
/// The [call] method takes a [double] input, calculates the number of
/// increments by dividing the input by 1.25, and rounds it to the nearest
/// integer. It then determines the closest value by multiplying the number of
/// increments by 1.25, ensuring the animation knows where to wind down after a
/// specific rotation for a quick wind down animation.
///
/// Example:
/// ```dart
/// double inputAngle = 3;
/// double closestIncrement = FindClosestIncrement.call(inputAngle);
/// print(closestIncrement); // Output: 2.5
/// ```
class FindClosestIncrement {
  static double call(double input) {
    int numberOfIncrements = (input / 1.25).round();
    double closestValue = numberOfIncrements * 1.25;
    return closestValue;
  }
}
