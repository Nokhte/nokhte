import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late TimesUpDynamicPointToTheDepthsMovieStore testStore;

  setUp(() {
    testStore = TimesUpDynamicPointToTheDepthsMovieStore();
  });

  group("initial values", () {
    test("movie duration should be the ocean dive duration", () {
      expect(testStore.movie.duration, Seconds.get(3));
    });

    test("control should be control.stop", () {
      expect(testStore.control, Control.stop);
    });
  });

  test("initMovie", () {
    testStore.initMovie(WaterColorsAndStops.blackOut);
    expect(testStore.control, Control.playFromStart);
  });
}
