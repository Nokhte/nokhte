import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/modules/gyroscopic/utils/utils.dart';

void main() {
  test("should work with a variety of values", () {
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
    final thirdOldAngleRef = 10;
    final thirdNewAngleRef = 340;
    final thirdRes =
        GyroscopeUtils.setReferenceAngle(thirdNewAngleRef, thirdOldAngleRef);
    expect(thirdRes, 350);
  });
}
