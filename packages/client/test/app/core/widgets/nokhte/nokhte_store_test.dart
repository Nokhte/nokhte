import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late NokhteStore testStore;
  const Offset tOffset = Offset(1, 1);

  setUp(() {
    testStore = NokhteStore();
  });

  group("initial values", () {
    test("movie", () {
      expect(testStore.movie.duration, Seconds.get(4));
    });

    test("centerCoordinates", () {
      expect(testStore.centerCoordinates, Offset.zero);
    });

    test("movieMode", () {
      expect(testStore.movieMode, NokhteMovieModes.initial);
    });
  });

  group("actions", () {
    test('setMovieModes', () {
      testStore.setMovieModes(NokhteMovieModes.moveUpAndApparate);
      expect(testStore.movieMode, NokhteMovieModes.moveUpAndApparate);
    });

    test("setCenterCoordinates", () {
      testStore.setCenterCoordinates(tOffset);
      expect(testStore.centerCoordinates, tOffset);
    });

    test("reset", () {
      testStore.toggleWidgetVisibility();
      testStore.reset();
      expect(testStore.movie.duration, Seconds.get(4));
      expect(testStore.showWidget, false);
      expect(testStore.control, Control.stop);
    });

    test("initMoveUpAndApparateMovie", () {
      testStore.initMoveUpAndApparateMovie();
      expect(testStore.movieMode, NokhteMovieModes.moveUpAndApparate);
      expect(testStore.movieStatus, MovieStatus.inProgress);
      expect(testStore.control, Control.playFromStart);
    });
    test('initPositionMovie', () {
      testStore.initPositionMovie(Offset.zero, Offset.zero);
      expect(testStore.control, Control.playFromStart);
      expect(testStore.movieStatus, MovieStatus.inProgress);
    });
  });

  group("computed", () {
    group("isAboutToApparate", () {
      test("false", () {
        expect(testStore.isAboutToApparate, false);
      });
      test("true", () {
        testStore.setMovieModes(NokhteMovieModes.moveUpAndApparate);
        expect(testStore.isAboutToApparate, true);
      });
    });
  });
}
