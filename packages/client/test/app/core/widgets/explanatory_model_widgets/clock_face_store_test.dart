import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late ClockFaceStore testStore;

  setUp(() {
    testStore = ClockFaceStore();
  });

  group("initial values", () {
    test("movie", () {
      expect(testStore.movie.duration, Seconds.get(3));
    });
  });

  group("actions", () {
    test('initMovie', () {
      testStore.initMovie(NoParams());
      expect(testStore.control, Control.playFromStart);
      expect(testStore.movieStatus, MovieStatus.inProgress);
    });
  });
}
