import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/modules/gyroscopic/utils/utils.dart';

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
}
