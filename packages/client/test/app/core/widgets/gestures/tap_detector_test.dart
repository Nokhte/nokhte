import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/widgets/gestures/stack/presentation/mobx/tap_detector.dart';

void main() {
  late TapDetector tDetector;
  const tOffset = Offset(1, 1);

  setUp(() {
    tDetector = TapDetector();
  });

  group("initial values", () {
    test("tapCount", () {
      expect(tDetector.tapCount, 0);
    });
    test("currentTapPosition", () {
      expect(tDetector.currentTapPosition, Offset.zero);
    });
  });

  group("actions", () {
    test("ontapDown", () {
      tDetector.onTapDown(tOffset);
      expect(tDetector.currentTapPosition, tOffset);
    });

    test("onTap", () {
      tDetector.onTap();
      expect(tDetector.tapCount, 1);
    });
  });
}
