import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
import '../../../../shared/shared_mocks.mocks.dart';

void main() {
  late MockBeachWavesStore mockBeachWavesStore;
  late MockSmartTextStore mockSmartTextStore;
  late MockNokhteStore mockNokhteStore;
  late MockTrailingTextStore mockTrailingTextStore;
  late LoginScreenWidgetsCoordinator testStore;
  const tCoordinates = Offset(1, 1);

  setUp(() {
    mockBeachWavesStore = MockBeachWavesStore();
    mockSmartTextStore = MockSmartTextStore();
    mockNokhteStore = MockNokhteStore();
    mockTrailingTextStore = MockTrailingTextStore();
    testStore = LoginScreenWidgetsCoordinator(
      beachWaves: mockBeachWavesStore,
      smartTextStore: mockSmartTextStore,
      nokhte: mockNokhteStore,
      trailingText: mockTrailingTextStore,
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
      testStore.constructor(tCoordinates);
      expect(testStore.centerScreenCoordinates, tCoordinates);
      verify(mockSmartTextStore.setMessagesData(MessagesData.loginList));
      verify(mockSmartTextStore.startRotatingText());
      verify(mockBeachWavesStore.setMovieMode(BeachWaveMovieModes.blackOut));
    });
  });

  group("other functions", () {
    test("onResumed", () {
      fakeAsync((async) {
        testStore.onResumed();
        async.elapse(Seconds.get(0, milli: 200));
        verify(mockSmartTextStore.startRotatingText());
      });
    });

    test("onInactive", () {
      testStore.toggleHasMadeTheDot();
      testStore.onInactive();
      verify(mockSmartTextStore.reset());
      verify(mockNokhteStore.reset());
      expect(testStore.hasNotMadeTheDot, true);
    });

    test("onTap", () {
      testStore.onTap(tCoordinates);
      verify(mockSmartTextStore.startRotatingText(isResuming: true));
      expect(testStore.hasNotMadeTheDot, false);
      verify(mockNokhteStore.setPositionMovie(tCoordinates, Offset.zero));
    });
  });
}
