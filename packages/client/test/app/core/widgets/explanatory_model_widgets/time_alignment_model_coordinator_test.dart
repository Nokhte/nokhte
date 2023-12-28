import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import '../wifi_disconnect_overlay/wifi_disconnect_mocks.mocks.dart';

void main() {
  late TimeAlignmentModelCoordinator testStore;
  late ClockFaceStore clockFace;
  late AvailabilitySectorsStore availabilitySectors;
  late MockGetOnConnectivityChangedStore mockConnectivity;

  setUp(() {
    mockConnectivity = MockGetOnConnectivityChangedStore();
    clockFace = ClockFaceStore();
    availabilitySectors =
        AvailabilitySectorsStore(connectivity: mockConnectivity);
    testStore = TimeAlignmentModelCoordinator(
      clockFace: clockFace,
      availabilitySectors: availabilitySectors,
    );
  });

  group("actions", () {
    test('init', () {
      testStore.init();
      expect(clockFace.control, Control.playFromStart);
      expect(clockFace.movieStatus, MovieStatus.inProgress);
      expect(availabilitySectors.control, Control.play);
      expect(availabilitySectors.movieStatus, MovieStatus.inProgress);
      expect(availabilitySectors.movieMode, AvailabilitySectorMovieModes.setup);
    });

    test("reverseClockFaceMovie", () {
      testStore.reverseClockFaceMovie();
      expect(clockFace.control, Control.playReverseFromEnd);
    });
  });
}
