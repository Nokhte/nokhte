import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:fake_async/fake_async.dart';

void main() {
  late SmartTextStore testStore;

  setUp(() {
    testStore = SmartTextStore();
  });

  group("initial values", () {
    test("showWidget", () {
      expect(testStore.showWidget, false);
    });

    test("currentIndex", () {
      expect(testStore.currentIndex, 0);
    });

    test("opacityCounter", () {
      expect(testStore.opacityCounter, 0);
    });
  });
  group("actions", () {
    test("setMessagesData", () {
      testStore.setMessagesData(MessagesData.loginList);
      expect(testStore.messagesData[0].mainMessage, "Howdy");
    });

    test("toggleWidgetVisibility", () {
      testStore.toggleWidgetVisibility();
      expect(testStore.showWidget, true);
    });

    test("startRotatingText", () {
      fakeAsync((async) {
        testStore.setMessagesData(MessagesData.loginList);
        testStore.startRotatingText();
        async.elapse(testStore.currentInitialFadeInDelay);
        expect(testStore.showWidget, true);
      });
    });

    group("onOpacityTransitionComplete", () {
      setUp(() {
        testStore.setMessagesData(MessagesData.loginList);
      });
      // write these when you get back
      test("widget is visible at index 0", () {
        fakeAsync((async) {
          testStore.toggleWidgetVisibility();
          testStore.onOpacityTransitionComplete();
          async.elapse(testStore.currentInitialFadeInDelay);
          expect(testStore.showWidget, false);
        });
      });
      test("widget is not visible at index 0", () {
        testStore.onOpacityTransitionComplete();
        expect(testStore.opacityCounter, 1);
      });
      test("widget is not visible at index 1", () {
        fakeAsync((async) {
          testStore.currentIndex++;
          testStore.opacityCounter++;
          testStore.onOpacityTransitionComplete();
          async.elapse(testStore.currentOnScreenTime);
          expect(testStore.showWidget, true);
          expect(testStore.currentIndex, 2);
        });
      });
    });
  });

  group("computed", () {
    setUp(() {
      testStore.setMessagesData(MessagesData.loginList);
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
    test("currentUnlockGesture", () {
      expect(testStore.currentUnlockGesture, Gestures.none);
    });
  });
}
