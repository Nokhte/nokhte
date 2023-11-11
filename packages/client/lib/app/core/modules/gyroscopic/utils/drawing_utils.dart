import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';

class DrawingUtils {
  static bool isWithinRange(int baseValue, int inputNum) {
    int lowerBound = baseValue - 2;
    int upperBound = baseValue + 2;

    return (inputNum >= lowerBound && inputNum <= upperBound);
  }

  static DrawingStatus decideIfTheyHaveDrawnACircle(
    List<int> inputList,
    int negativeTerritoryMark,
  ) {
    int peakValue = inputList[0];
    int baseValue = inputList[0];
    bool hasAscendedEnough = false;
    bool hasDescendedEnough = false;

    for (int i = 1; i < inputList.length; i++) {
      int value = inputList[i];

      if (value > peakValue) {
        peakValue = value;
      } else if (value < peakValue && value >= negativeTerritoryMark) {
        if (isWithinRange(baseValue, value)) {
          hasDescendedEnough = true;
        }
      } else if (value < negativeTerritoryMark) {
        if (isWithinRange(baseValue, value)) {
          hasAscendedEnough = true;
        }
      }

      if (hasAscendedEnough && hasDescendedEnough) {
        return DrawingStatus.hasDrawn;
      }
    }

    return DrawingStatus.hasNotDrawn;
  }
}
