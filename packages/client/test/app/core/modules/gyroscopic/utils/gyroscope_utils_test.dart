import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/modules/gyroscopic/utils/utils.dart';

import '../constants/quadrant_lists.dart';

void main() {
  test("`setReferenceAngle` should work with a variety of values", () {
    const firstOldRefAngle = 200;
    const firstNewAngleRef = 350; // they went back 10
    final res =
        GyroscopeUtils.setReferenceAngle(firstNewAngleRef, firstOldRefAngle);
    expect(res, 190);
    const secondOldAngleRef = 210;
    const secondNewAngleRef = 350;
    final secondRes =
        GyroscopeUtils.setReferenceAngle(secondNewAngleRef, secondOldAngleRef);
    expect(secondRes, 200);
    const thirdOldAngleRef = 10;
    const thirdNewAngleRef = 340;
    final thirdRes =
        GyroscopeUtils.setReferenceAngle(thirdNewAngleRef, thirdOldAngleRef);
    expect(thirdRes, 350);
  });

  test("`resetRefAngleForMaxCapacity` should work w/ a variety of values", () {
    // try low end with 355 staying under 360 and going over and do the same
    // with high end values as well
    const firstMaxAngle = 355;
    const firstCurrentValue = 358;
    const firstOriginalReferenceAngle = 5;
    final firstRes = GyroscopeUtils.resetRefAngleForMaxCapacity(
      maxAngle: firstMaxAngle,
      currentValue: firstCurrentValue,
      originalReferenceAngle: firstOriginalReferenceAngle,
    );
    expect(firstRes, 8);
    const secondMaxAngle = 720;
    const secondCurrentValue = 745;
    const secondOriginalReferenceAngle = 350;
    final secondRes = GyroscopeUtils.resetRefAngleForMaxCapacity(
      maxAngle: secondMaxAngle,
      currentValue: secondCurrentValue,
      originalReferenceAngle: secondOriginalReferenceAngle,
    );
    expect(secondRes, 15);
  });

  test("`quadrantPartitioner` should do it's job", () {
    final firstRes = GyroscopeUtils.quadrantPartitioner(
        numberOfQuadrants: 4, totalAngleCoverageOfEachQuadrant: 90);
    expect(firstRes, QuadrantLists.dayList);
    final secondRes = GyroscopeUtils.quadrantPartitioner(
        numberOfQuadrants: 24, totalAngleCoverageOfEachQuadrant: 60);
    expect(secondRes, QuadrantLists.timeList);
  });

  test("calculateRevolution should do its job", () {
    final res = GyroscopeUtils.revolutionCalculator(359);
    expect(res, 0);
    final secondRes = GyroscopeUtils.revolutionCalculator(719);
    expect(secondRes, 1);
    final thirdRes = GyroscopeUtils.revolutionCalculator(3610);
    expect(thirdRes, 10);
  });

  test("Quadrant setup should do it's job", () {
    final firstRes = GyroscopeUtils.quadrantSetup(
      numberOfQuadrants: 4,
      totalAngleCoverageOfEachQuadrant: 90,
      startingQuadrant: 2,
    );
    expect(firstRes.quadrantInfo, QuadrantLists.dayList);
    expect(firstRes.maxAngle, 359);
    expect(firstRes.desiredStartingAngle, 269);
    expect(firstRes.startingRevolution, 0);
    final secondRes = GyroscopeUtils.quadrantSetup(
      numberOfQuadrants: 24,
      totalAngleCoverageOfEachQuadrant: 60,
      startingQuadrant: 12,
    );
    expect(secondRes.quadrantInfo, QuadrantLists.timeList);
    expect(secondRes.desiredStartingAngle, 779);
    expect(secondRes.startingRevolution, 2);
    expect(secondRes.maxAngle, 1439);
  });

  test("get current quadrant is doing what it should", () {
    final res = GyroscopeUtils.getCurrentQuadrant(
        currentAngle: 85, quadrants: QuadrantLists.dayList);
    expect(res, 0);
    final res2 = GyroscopeUtils.getCurrentQuadrant(
        currentAngle: 180, quadrants: QuadrantLists.dayList);
    expect(res2, 2);
    final res3 = GyroscopeUtils.getCurrentQuadrant(
        currentAngle: 365, quadrants: QuadrantLists.timeList);
    expect(res3, 6);
  });
}
