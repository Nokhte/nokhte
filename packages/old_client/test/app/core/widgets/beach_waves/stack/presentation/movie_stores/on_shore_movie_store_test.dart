import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late OnShoreMovieStore testStore;

  setUp(() {
    testStore = OnShoreMovieStore();
  });

  group("initial values", () {
    test("movie duration should be the on shore duration", () {
      expect(testStore.movie.duration, Seconds.get(2, milli: 1));
    });

    test("control should be mirror", () {
      expect(testStore.control, Control.mirror);
    });
  });
}
