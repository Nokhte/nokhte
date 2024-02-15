import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'base_coordinator_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CaptureScreen>(),
])
void main() {
  late BaseCoordinator testStore;

  setUp(() => testStore = BaseCoordinator(
        captureScreen: MockCaptureScreen(),
      ));

  group("initial values", () {
    test("disableAllTouchFeedback", () {
      expect(testStore.disableAllTouchFeedback, false);
    });
  });

  group("actions", () {
    test("toggleDisableAllTouchFeedback", () {
      testStore.toggleDisableAllTouchFeedback();
      expect(testStore.disableAllTouchFeedback, true);
    });
  });
}
