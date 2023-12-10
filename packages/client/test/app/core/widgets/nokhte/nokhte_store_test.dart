import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/nokhte/stack/presentation/mobx/nokhte_store.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late NokhteStore testStore;

  setUp(() {
    testStore = NokhteStore();
  });

  group("initial values", () {
    test("movie", () {
      expect(testStore.movie.duration, Seconds.get(4));
    });
  });

  group("actions", () {
    test('setPositionMovie', () {
      fakeAsync((async) {
        testStore.setPositionMovie(Offset.zero, Offset.zero);
        async.elapse(Seconds.get(0, milli: 190));
        expect(testStore.control, Control.playFromStart);
        expect(testStore.movieStatus, MovieStatus.inProgress);
      });
    });

    test("onComplete", () {
      testStore.onCompleted();
      expect(testStore.movieStatus, MovieStatus.finished);
    });

    test("reset", () {
      fakeAsync((async) {
        testStore.setPositionMovie(Offset.zero, Offset.zero);
        async.elapse(Seconds.get(0, milli: 190));
        testStore.reset();
        expect(testStore.showWidget, false);
        expect(testStore.control, Control.stop);
      });
    });
  });
}
