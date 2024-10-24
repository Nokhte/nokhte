import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late BaseWidgetStore testStore;

  setUp(() => testStore = BaseWidgetStore());

  group("initial values", () {
    test("movie", () {
      expect(testStore.movie.duration, Duration.zero);
    });
    test("control", () {
      expect(testStore.control, Control.stop);
    });
    test("pastControl", () {
      expect(testStore.pastControl, Control.stop);
    });
    test("showWidget", () {
      expect(testStore.showWidget, true);
    });

    test("hasFadedIn", () {
      expect(testStore.hasFadedIn, false);
    });
  });

  group("actions", () {
    test("toggleWidgetVisibility", () {
      testStore.toggleWidgetVisibility();
      expect(testStore.showWidget, false);
    });

    test("toggleHasFadedIn", () {
      testStore.toggleHasFadedIn();
      expect(testStore.hasFadedIn, true);
      testStore.toggleHasFadedIn();
      expect(testStore.hasFadedIn, false);
    });
    test("setPastControl", () {
      testStore.setPastControl(Control.loop);
      expect(testStore.pastControl, Control.loop);
    });
    test("setControl", () {
      testStore.setControl(Control.loop);
      expect(testStore.control, Control.loop);
    });
    test("onCompleted", () {
      testStore.onCompleted();
      testStore.setPastControl(Control.loop);
      expect(testStore.movieStatus, MovieStatus.finished);
      expect(testStore.pastControl, Control.loop);
      expect(testStore.control, Control.stop);
    });

    test("setMovieStatus", () {
      testStore.setMovieStatus(MovieStatus.idle);
      expect(testStore.movieStatus, MovieStatus.idle);
    });
  });
}
