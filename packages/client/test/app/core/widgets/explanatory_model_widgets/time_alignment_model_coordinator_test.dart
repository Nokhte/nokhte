import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late TimeAlignmentModelCoordinator testStore;
  late ClockFaceStore clockFace;
  late AvailabilitySectorsStore availabilitySectors;

  setUp(() {
    clockFace = ClockFaceStore();
    availabilitySectors = AvailabilitySectorsStore();
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
      expect(clockFace.movieStatus, MovieStatus.inProgress);
    });
  });
}
