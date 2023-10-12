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

  static List<int> removeDuplicates(List<int> inputList) {
    List<int> uniqueList = [];
    Set<int> seenSet = {};

    for (int num in inputList) {
      if (!seenSet.contains(num)) {
        seenSet.add(num);
        uniqueList.add(num);
      }
    }

    return uniqueList;
  }

  static int clockwiseComparison(int firstVal, int secondVal) {
    int clockwiseDifference = (firstVal - secondVal + 360) % 360;
    if (clockwiseDifference > 0 && clockwiseDifference <= 180) {
      // angle2 is greater (clockwise) than angle1
      return 2;
    } else if (clockwiseDifference > 180 && clockwiseDifference < 360) {
      // angle1 is clockwise greater than angle2
      return 1;
    } else {
      // They are either the same angle or 180 degrees apart (opposite directions)
      return 0;
    }
  }

  static Threshold isInThresholdRange(
      int value, int lowerBound, int upperBound) {
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

  static int setReferenceAngle(
      int relativeReferenceAngle, int oldReferenceAngle) {
    int newReferenceAngle;
    final theDifference = newReferenceAngle = (360 - relativeReferenceAngle);
    print("the difference ${(oldReferenceAngle - theDifference) % 360}");
    if (oldReferenceAngle > 180) {
      newReferenceAngle = (theDifference - oldReferenceAngle).abs();
    } else {
      newReferenceAngle = (oldReferenceAngle - theDifference) % 360;
    }
    return newReferenceAngle;
  }

  static int resetRefAngleForMaxCapacity({
    required int maxAngle,
    required int currentValue,
    required originalReferenceAngle,
  }) {
    currentValue %= 360;
    maxAngle %= 360;
    int theDiffBetweenMaxAndCurrent = currentValue - maxAngle;
    theDiffBetweenMaxAndCurrent < 0 ? theDiffBetweenMaxAndCurrent += 360 : null;
    final int newRefAngle =
        ((theDiffBetweenMaxAndCurrent + originalReferenceAngle) % 360).floor();
    return newRefAngle;
  }
}
