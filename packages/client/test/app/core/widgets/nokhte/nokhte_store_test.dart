import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/login/login.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late LoginNokhtesStore testStore;
  const Offset tOffset = Offset(1, 1);

  setUp(() {
    testStore = LoginNokhtesStore();
  });

  group("initial values", () {
    test("movie", () {
      expect(testStore.movie.duration, Seconds.get(2));
    });

    test("centerCoordinates", () {
      expect(testStore.centerCoordinates, Offset.zero);
    });

    test("movieMode", () {
      expect(testStore.movieMode, LoginNokhtesMovieModes.initial);
    });
  });

  group("actions", () {
    test('setMovieModes', () {
      testStore.setMovieModes(LoginNokhtesMovieModes.moveUpAndApparate);
      expect(testStore.movieMode, LoginNokhtesMovieModes.moveUpAndApparate);
    });

    test("setCenterCoordinates", () {
      testStore.setCenterCoordinates(tOffset);
      expect(testStore.centerCoordinates, tOffset);
    });

    test("reset", () {
      testStore.toggleWidgetVisibility();
      testStore.reset();
      expect(testStore.movie.duration, Seconds.get(02));
      expect(testStore.showWidget, false);
      expect(testStore.control, Control.playFromStart);
    });

    test("initMoveUpAndApparateMovie", () {
      testStore.initMoveUpAndApparateMovie();
      expect(testStore.movieMode, LoginNokhtesMovieModes.moveUpAndApparate);
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
        testStore.setMovieModes(LoginNokhtesMovieModes.moveUpAndApparate);
        expect(testStore.isAboutToApparate, true);
      });
    });
  });
}
