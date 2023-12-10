import 'package:fake_async/fake_async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late TrailingTextStore testStore;
  const tSize = Size(1.0, 1.0);

  setUp(() {
    testStore = TrailingTextStore();
  });

  group("initial values", () {
    test("textSize", () {
      expect(testStore.textSize, Size.zero);
    });
  });

  group("actions", () {
    test("setTextSizeAndMovie", () {
      fakeAsync((async) {
        testStore.setTextSizeAndMovie(
          newTextSize: tSize,
          newTextRevealDirection: TextRevealDirection.fromLeft,
        );
        async.elapse(Seconds.get(2));
        expect(testStore.textSize, tSize);
        expect(testStore.control, Control.stop);
        expect(testStore.movie.duration, Seconds.get(2));
      });
    });

    test("reset", () {
      testStore.reset();
      expect(testStore.showWidget, false);
      expect(testStore.control, Control.stop);
    });

    test("initReverse", () {
      testStore.initReverse();
      expect(testStore.control, Control.playReverseFromEnd);
      expect(testStore.movieStatus, MovieStatus.inProgress);
    });

    test("initMovie", () {
      testStore.initMovie(NoParams());
      expect(testStore.control, Control.playFromStart);
      expect(testStore.movieStatus, MovieStatus.inProgress);
    });
  });
}
