import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
import '../../../../shared/shared_mocks.mocks.dart';

void main() {
  late MockBeachWavesStore mockBeachWavesStore;
  late SmartTextStore smartTextStore;
  late NokhteStore nokhteStore;
  late TrailingTextStore topTrailingTextStore;
  late TrailingTextStore bottomTrailingTextStore;
  late LoginScreenWidgetsCoordinator testStore;
  const tCoordinates = Offset(1, 1);

  setUp(() {
    mockBeachWavesStore = MockBeachWavesStore();
    smartTextStore = SmartTextStore();
    nokhteStore = NokhteStore();
    topTrailingTextStore = TrailingTextStore();
    bottomTrailingTextStore = TrailingTextStore();
    testStore = LoginScreenWidgetsCoordinator(
      beachWaves: mockBeachWavesStore,
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
  });

  group("actions", () {
    test("toggleHasMadeTheDot", () {
      testStore.toggleHasMadeTheDot();
      expect(testStore.hasNotMadeTheDot, false);
    });

    test("setCenterScreenCoordinates", () {
      testStore.setCenterScreenCoordinates(tCoordinates);
      expect(testStore.centerScreenCoordinates, tCoordinates);
    });

    test("screenConstructor", () {
      testStore.constructor(tCoordinates, () {});
      expect(testStore.centerScreenCoordinates, tCoordinates);
      verify(mockBeachWavesStore.setMovieMode(BeachWaveMovieModes.blackOut));
    });
  });

  group("other functions", () {
    test("onResumed", () {
      fakeAsync((async) {
        smartTextStore.setMessagesData(MessagesData.loginList);
        testStore.onResumed();
        async.elapse(Seconds.get(0, milli: 200));
      });
    });

    test("onInactive", () {
      testStore.toggleHasMadeTheDot();
      testStore.onInactive();
      // verify(smartTextStore.reset());
      expect(testStore.hasNotMadeTheDot, true);
    });

    test("onTap", () {
      smartTextStore.setMessagesData(MessagesData.loginList);
      smartTextStore.currentIndex = 3;
      testStore.onTap(tCoordinates);
      expect(testStore.hasNotMadeTheDot, false);
      expect(nokhteStore.centerCoordinates, Offset.zero);
    });
  });

  group("reactors", () {
    test("trailingTextReactor", () {
      testStore.trailingTextReactor();
      bottomTrailingTextStore.initReverse();
      bottomTrailingTextStore.onCompleted();
      expect(nokhteStore.movieMode, NokhteMovieModes.moveUpAndApparate);
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
