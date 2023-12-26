import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late TimeAlignmentModelCoordinator testStore;
  late ClockFaceStore clockFace;
  late AvailabilitySectorsStore availabilitySectors;
  late AccompanyingTextStore accompanyingText;
  late SmartGradientCircleStore userCircle;
  late SmartGradientCircleStore collaboratorCircle;

  setUp(() {
    userCircle = SmartGradientCircleStore();
    collaboratorCircle = SmartGradientCircleStore();
    accompanyingText = AccompanyingTextStore();
    clockFace = ClockFaceStore();
    availabilitySectors = AvailabilitySectorsStore();
    testStore = TimeAlignmentModelCoordinator(
      clockFace: clockFace,
      availabilitySectors: availabilitySectors,
      accompanyingText: accompanyingText,
      userCircle: userCircle,
      collaboratorCircle: collaboratorCircle,
    );
  });

  group("actions", () {
    test('init', () {
      testStore.init();
      expect(clockFace.control, Control.playFromStart);
      expect(availabilitySectors.control, Control.playFromStart);
    });
  });
}
