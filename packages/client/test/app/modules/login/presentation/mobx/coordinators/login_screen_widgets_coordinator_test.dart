import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/login/login.dart';
import '../../../../shared/shared_mocks.mocks.dart';

void main() {
  late BeachWavesStore layer1BeachWavesStore;
  late BeachWavesStore layer2BeachWavesStore;
  late SmartTextStore smartTextStore;
  late MockWifiDisconnectOverlayStore wifiDisconnectOverlayStore;
  late LoginScreenWidgetsCoordinator testStore;

  setUp(() {
    wifiDisconnectOverlayStore = MockWifiDisconnectOverlayStore();
    layer1BeachWavesStore = BeachWavesStore();
    layer2BeachWavesStore = BeachWavesStore();
    smartTextStore = SmartTextStore();
    testStore = LoginScreenWidgetsCoordinator(
      wifiDisconnectOverlay: wifiDisconnectOverlayStore,
      layer1BeachWaves: layer1BeachWavesStore,
      layer2BeachWaves: layer2BeachWavesStore,
      smartTextStore: smartTextStore,
    );
  });

  group("initial values", () {
    test("canSwipeUp", () {
      expect(testStore.canSwipeUp, false);
    });

    test("hasCompletedSandTransition", () {
      expect(testStore.hasCompletedSandTransition, false);
    });

    test("hasCompletedWaterFromTopToOnShorePt1", () {
      expect(testStore.hasCompletedWaterFromTopToOnShorePt1, false);
    });

    test("hasCompletedWaterFromTopToOnShorePt2", () {
      expect(testStore.hasCompletedWaterFromTopToOnShorePt2, false);
    });

    test("hasTriggeredLoginAnimation", () {
      expect(testStore.hasTriggeredLoginAnimation, false);
    });
  });

  group("actions", () {
    test("toggleHasCompletedSandTransition", () {
      testStore.toggleHasCompletedSandTransition();
      expect(testStore.hasCompletedSandTransition, true);
    });
    test("toggleHasCompletedWaterFromTopToOnShorePt1", () {
      testStore.toggleHasCompletedWaterFromTopToOnShorePt1();
      expect(testStore.hasCompletedWaterFromTopToOnShorePt1, true);
    });
    test("toggleHasCompletedWaterFromTopToOnShorePt2", () {
      testStore.toggleHasCompletedWaterFromTopToOnShorePt2();
      expect(testStore.hasCompletedWaterFromTopToOnShorePt2, true);
    });
    test("toggleHasTriggeredLoginAnimation", () {
      testStore.toggleHasTriggeredLoginAnimation();
      expect(testStore.hasTriggeredLoginAnimation, true);
    });
    test('setCanSwipeUp', () {
      testStore.setCanSwipeUp(true);
      expect(testStore.canSwipeUp, true);
    });

    test("connstructor", () {
      testStore.constructor(() {}, () {});
      expect(layer1BeachWavesStore.movieMode,
          BeachWaveMovieModes.blackOutToDrySand);
      expect(layer2BeachWavesStore.movieMode, BeachWaveMovieModes.onShore);
    });
  });

  group("other functions", () {
    test("triggerLoginAnimation", () {
      testStore.triggerLoginAnimation();
      expect(testStore.hasTriggeredLoginAnimation, true);
    });

    group("loggedInOnResumed", () {
      test("!hasTriggeredAnimation", () {
        testStore.loggedInOnResumed();
        expect(testStore.hasTriggeredLoginAnimation, true);
      });

      test("hasFinishedBlackOutToSand", () {
        final res = testStore.hasFinishedBlackOutToSand(MovieStatus.finished);
        expect(res, false);
      });

      test("hasFinishedWaterFromTopPart2", () {
        final res =
            testStore.hasFinishedWaterFromTopPart2(MovieStatus.finished);
        expect(res, false);
      });

      test("hasFinishedWaterFromTopPart1", () {
        final res =
            testStore.hasFinishedWaterFromTopPart1(MovieStatus.finished);
        expect(res, false);
      });
    });

    test("onTap", () {
      smartTextStore.setMessagesData(LoginList.list);
      smartTextStore.currentIndex = 1;
    });
  });
}
