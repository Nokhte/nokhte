import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
import '../../../../shared/shared_mocks.mocks.dart';

void main() {
  late MockBeachWavesStore mockLayer1BeachWavesStore;
  late MockBeachWavesStore mockLayer2BeachWavesStore;
  late SmartTextStore smartTextStore;
  late NokhteStore nokhteStore;
  late TrailingTextStore topTrailingTextStore;
  late TrailingTextStore bottomTrailingTextStore;
  late MockWifiDisconnectOverlayStore wifiDisconnectOverlayStore;
  late LoginScreenWidgetsCoordinator testStore;
  const tCoordinates = Offset(1, 1);

  setUp(() {
    wifiDisconnectOverlayStore = MockWifiDisconnectOverlayStore();
    mockLayer1BeachWavesStore = MockBeachWavesStore();
    mockLayer2BeachWavesStore = MockBeachWavesStore();
    smartTextStore = SmartTextStore();
    nokhteStore = NokhteStore();
    topTrailingTextStore = TrailingTextStore();
    bottomTrailingTextStore = TrailingTextStore();
    testStore = LoginScreenWidgetsCoordinator(
      wifiDisconnectOverlay: wifiDisconnectOverlayStore,
      layer1BeachWaves: mockLayer1BeachWavesStore,
      layer2BeachWaves: mockLayer2BeachWavesStore,
      smartTextStore: smartTextStore,
      nokhte: nokhteStore,
      bottomTrailingText: bottomTrailingTextStore,
      topTrailingText: topTrailingTextStore,
    );
  });

  group("initial values", () {
    test("hasNotMadeTheDot", () {
      expect(testStore.hasNotMadeTheDot, true);
    });

    test("centerScreenCoordinates", () {
      expect(testStore.centerScreenCoordinates, Offset.zero);
    });

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

    test("toggleHasMadeTheDot", () {
      testStore.toggleHasMadeTheDot();
      expect(testStore.hasNotMadeTheDot, false);
    });

    test("setCenterScreenCoordinates", () {
      testStore.setCenterScreenCoordinates(tCoordinates);
      expect(testStore.centerScreenCoordinates, tCoordinates);
    });

    test("connstructor", () {
      when(mockLayer2BeachWavesStore.currentStore)
          .thenAnswer((realInvocation) => OnShoreMovieStore());
      testStore.constructor(tCoordinates, () {}, () {}, () {});
      expect(testStore.centerScreenCoordinates, tCoordinates);
      verify(
          mockLayer1BeachWavesStore.setMovieMode(BeachWaveMovieModes.blackOut));
    });
  });

  group("other functions", () {
    test("triggerLoginAnimation", () {
      when(mockLayer2BeachWavesStore.currentStore)
          .thenAnswer((realInvocation) => OnShoreMovieStore());
      testStore.triggerLoginAnimation();
      expect(bottomTrailingTextStore.showWidget, false);
      expect(bottomTrailingTextStore.showWidget, false);
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
      smartTextStore.setMessagesData(MessagesData.loginList);
      smartTextStore.currentIndex = 3;
      testStore.onTap(tCoordinates);
      expect(testStore.hasNotMadeTheDot, false);
      expect(nokhteStore.centerCoordinates, Offset.zero);
      expect(nokhteStore.showWidget, true);
    });
  });

  group("reactors", () {
    group("trailingTextReactor", () {
      test("reverse completed", () {
        testStore.trailingTextReactor();
        bottomTrailingTextStore.initReverse();
        bottomTrailingTextStore.onCompleted();
        expect(nokhteStore.movieMode, NokhteMovieModes.moveUpAndApparate);
      });
      test("forward completed", () {
        testStore.trailingTextReactor();
        bottomTrailingTextStore.initMovie(NoParams());
        bottomTrailingTextStore.onCompleted();
        expect(testStore.canSwipeUp, true);
      });
    });
    group("onNokhteAnimationCompleteReactor", () {
      test("movieMode == NokhteMovieModes.setPosition", () {
        bool businessLogicWasCalled = false;
        testStore.nokhteReactor(() {
          businessLogicWasCalled = true;
        });
        nokhteStore.initMovie(NoParams());
        nokhteStore.onCompleted();
        expect(businessLogicWasCalled, false);
        expect(bottomTrailingTextStore.showWidget, true);
        expect(topTrailingTextStore.showWidget, true);

        //
      });

      test("movieMode == NokhteMovieModes.moveUpAndApparate", () {
        bool businessLogicWasCalled = false;
        testStore.nokhteReactor(() {
          businessLogicWasCalled = true;
        });
        nokhteStore.initMoveUpAndApparateMovie();
        nokhteStore.onCompleted();
        expect(businessLogicWasCalled, true);
      });
    });
  });
}
