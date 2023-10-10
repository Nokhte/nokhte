import 'package:primala/app/core/modules/gyroscopic/types/types.dart';

class GyroscopeUtils {
  static CloserTo determineCloser(int lowerBound, int upperBound, int input) {
    // Calculate the absolute differences between input and lowerBound, and input andupperBound
    int diffToStart = (input - lowerBound).abs();
    int diffToEnd = (input - upperBound).abs();

    if (diffToStart < diffToEnd) {
      return CloserTo.lowerBound;
    } else if (diffToStart > diffToEnd) {
      return CloserTo.upperBound;
    } else {
      return CloserTo.equidistant;
    }
  }

  static Threshold isWithinBounds(int value, int lowerBound, int upperBound) {
    // Range does not wrap around (e.g., 350 to 30 degrees)
    if (lowerBound <= upperBound) {
      if (value >= lowerBound && value <= upperBound) {
        return Threshold(
          isInRange: true,
          closerTo: determineCloser(lowerBound, upperBound, value),
          angle: value,
        );
      } else {
        return Threshold(
            isInRange: false, closerTo: CloserTo.initial, angle: value);
      }
    } else {
      // Range wraps around (e.g., 350 to 30 degrees)
      if (value >= lowerBound || value <= upperBound) {
        return Threshold(
          isInRange: true,
          closerTo: determineCloser(lowerBound, upperBound, value),
          angle: value,
        );
        //
      } else {
        return Threshold(
            isInRange: false, closerTo: CloserTo.initial, angle: value);
      }
    }
  }
}
