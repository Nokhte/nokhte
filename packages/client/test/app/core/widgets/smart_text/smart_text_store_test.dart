import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:fake_async/fake_async.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late SmartTextStore testStore;

  setUp(() {
    testStore = SmartTextStore();
  });

  group("initial values", () {
    test("currentIndex", () {
      expect(testStore.currentIndex, 0);
    });
  });
  group("actions", () {
    test("reset", () {
      testStore.reset();
      expect(testStore.currentIndex, 0);
      expect(testStore.isPaused, false);
      expect(testStore.control, Control.stop);
    });
    test("setMessagesData", () {
      testStore.setMessagesData(LoginList.list);
      expect(testStore.messagesData[0].text, "Howdy");
    });

    group("startRotatingText", () {
      setUp(() {
        testStore.setMessagesData(LoginList.list);
      });
      test("is not resuming", () {
        fakeAsync((async) {
          testStore.startRotatingText();
          async.elapse(testStore.currentInitialFadeInDelay);
          expect(testStore.control, Control.play);
        });
      });
      test("is resuming", () {
        fakeAsync((async) {
          testStore.startRotatingText(isResuming: true);
          async.elapse(testStore.currentInitialFadeInDelay);
          expect(testStore.control, Control.playReverse);
        });
      });
    });

    group("onOpacityTransitionComplete", () {
      setUp(() {
        testStore.setMessagesData(LoginList.list);
      });
      test("widget is visible at index 0", () {
        fakeAsync((async) {
          testStore.setControl(Control.playFromStart);
          testStore.onOpacityTransitionComplete();
          async.elapse(testStore.currentOnScreenTime);
          expect(testStore.control, Control.playReverse);
        });
      });
      test("widget is not visible at index 0", () {
        fakeAsync((async) {
          testStore.setControl(Control.playReverse);
          testStore.onOpacityTransitionComplete();
          async.elapse(Seconds.get(0, milli: 100));
          expect(testStore.control, Control.playFromStart);
          expect(testStore.currentIndex, 1);
        });
      });
    });
  });

  group("computed", () {
    setUp(() {
      testStore.setMessagesData(LoginList.list);
    });
    test("currentSubText", () {
      expect(testStore.currentSubText, "");
    });
    test("currentMainText", () {
      expect(testStore.currentMainText, "Howdy");
    });
    test("currentShouldPauseHere", () {
      expect(testStore.currentShouldPauseHere, false);
    });
    test("currentMainTextFontSize", () {
      expect(testStore.currentMainTextFontSize, 25.0);
    });
    test("currentSubTextFontSize", () {
      expect(testStore.currentSubTextFontSize, 15.0);
    });
    test("currentInitialFadeInDelay", () {
      expect(testStore.currentInitialFadeInDelay, Seconds.get(1));
    });
    test("currentOnScreenTime", () {
      expect(testStore.currentOnScreenTime, Seconds.get(2));
    });
  });
}
