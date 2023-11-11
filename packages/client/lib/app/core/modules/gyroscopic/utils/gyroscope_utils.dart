import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';

class GyroscopeUtils {
  static CloserTo determineCloser(int lowerBound, int upperBound, int input) {
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

  static List<int> includeNegativeQuads(
      List<int> inputList, int maxValue, int minThreshold) {
    return inputList.map((value) {
      int newVal = -199;
      if (value == maxValue) {
        newVal = -1;
      } else if (value < maxValue && value > minThreshold) {
        final theDiff = ((maxValue - value) * -1) - 1;
        newVal = theDiff;
      } else {
        newVal = value;
      }
      return newVal;
    }).toList();
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
      return 2;
    } else if (clockwiseDifference > 180 && clockwiseDifference < 360) {
      return 1;
    } else {
      return 0;
    }
  }

  static Threshold isAboveUpperBound(int value, int upperBound) {
    throw UnimplementedError();
  }

  static Threshold isInThresholdRange(
      int value, int lowerBound, int upperBound) {
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
      if (value >= lowerBound || value <= upperBound) {
        return Threshold(
          isInRange: true,
          closerTo: determineCloser(lowerBound, upperBound, value),
          angle: value,
        );
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
    if (oldReferenceAngle > 180) {
      newReferenceAngle = (theDifference - oldReferenceAngle).abs();
    } else {
      newReferenceAngle = (oldReferenceAngle - theDifference) % 360;
    }
    return newReferenceAngle;
  }

  static int revolutionCalculator(int angle) {
    int revolution = (angle / 360) < 1 ? 0 : (angle / 360).floor();
    return revolution;
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

  static List<QuadrantInfo> quadrantPartitioner(
      {required int numberOfQuadrants, required int quadrantSpread}) {
    if (numberOfQuadrants < 1 || quadrantSpread < 1) {
      throw ArgumentError(
          "Number of quadrants and total angle coverage must be greater than 0.");
    }

    List<QuadrantInfo> quadrantList = [];

    for (int i = 0; i < numberOfQuadrants; i++) {
      int startingAngle = i * quadrantSpread;
      int endingAngle = (i + 1) * quadrantSpread - 1;

      QuadrantInfo quadrantInfo =
          QuadrantInfo(startingAngle: startingAngle, endingAngle: endingAngle);
      quadrantList.add(quadrantInfo);
    }

    return quadrantList;
  }

  static GyroSetupReturnType quadrantSetup({
    required int numberOfQuadrants,
    required int quadrantSpread,
    required int startingQuadrant,
  }) {
    final quadrantList = quadrantPartitioner(
      numberOfQuadrants: numberOfQuadrants,
      quadrantSpread: quadrantSpread,
    );
    final quadRange = ((quadrantList[startingQuadrant].endingAngle -
                quadrantList[startingQuadrant].startingAngle) /
            2)
        .floor();
    int desiredStartingAngle =
        quadrantList[startingQuadrant].startingAngle + quadRange;
    if (startingQuadrant == 0) {
      desiredStartingAngle = 0;
    }
    final startingRev = revolutionCalculator(desiredStartingAngle);

    return GyroSetupReturnType(
        quadrantInfo: quadrantList,
        maxAngle: quadrantList.last.endingAngle,
        desiredStartingAngle: desiredStartingAngle,
        startingRevolution: startingRev);
  }

  static int getCurrentQuadrant({
    required currentAngle,
    required List<QuadrantInfo> quadrants,
  }) {
    for (int i = 0; i < quadrants.length; i++) {
      QuadrantInfo quadrant = quadrants[i];
      if (currentAngle >= quadrant.startingAngle &&
          currentAngle <= quadrant.endingAngle &&
          i != quadrants.length - 1) {
        return i;
      } else if (currentAngle >= quadrant.startingAngle &&
          i == quadrants.length - 1) {
        return i;
      }
    }
    return -1;
  }
}
