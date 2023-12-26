import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

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
}
