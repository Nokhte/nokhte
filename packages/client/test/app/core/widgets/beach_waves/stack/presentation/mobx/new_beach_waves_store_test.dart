import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/beach_waves/stack/presentation/mobx/movie_stores/times_up_end_to_ocean_dive/times_up_end_to_ocean_dive.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late NewBeachWavesStore testStore;
  late OnShoreToOceanDiveMovieStore onShoreToOceanDiveMovieStore;
  late OnShoreMovieStore onShoreMovieStore;
  late SuspendedAtOceanDiveStore suspendedAtOceanDiveStore;
  late SuspendedAtTheDepthsMovieStore suspendedAtTheDepthsMovieStore;
  late OceanDiveToOnShoreMovieStore oceanDiveToOnShoreMovieStore;
  late TimesUpMovieStore timesUpMovieStore;
  late OceanDiveToTimesUpMovieStore oceanDiveToTimesUpMovieStore;
  late TimesUpEndToOceanDiveMovieStore timesUpEndToOceanDiveMovie;
  late TimesUpDynamicPointToTheDepthsMovieStore
      timesUpDynamicPointToTheDepthsMovieStore;

  setUp(() {
    suspendedAtTheDepthsMovieStore = SuspendedAtTheDepthsMovieStore();
    timesUpMovieStore = TimesUpMovieStore();
    oceanDiveToTimesUpMovieStore = OceanDiveToTimesUpMovieStore();
    suspendedAtOceanDiveStore = SuspendedAtOceanDiveStore();
    onShoreToOceanDiveMovieStore = OnShoreToOceanDiveMovieStore();
    onShoreMovieStore = OnShoreMovieStore();
    oceanDiveToOnShoreMovieStore = OceanDiveToOnShoreMovieStore();
    timesUpEndToOceanDiveMovie = TimesUpEndToOceanDiveMovieStore();
    timesUpDynamicPointToTheDepthsMovieStore =
        TimesUpDynamicPointToTheDepthsMovieStore();

    testStore = NewBeachWavesStore(
      suspendedAtTheDepthsMovieStore: suspendedAtTheDepthsMovieStore,
      timesUpDynamicPointToTheDepthsMovie:
          timesUpDynamicPointToTheDepthsMovieStore,
      timesUpEndToOceanDiveMovie: timesUpEndToOceanDiveMovie,
      timesUpMovieStore: timesUpMovieStore,
      oceanDiveToTimesUpMovieStore: oceanDiveToTimesUpMovieStore,
      suspendedAtOceanDiveStore: suspendedAtOceanDiveStore,
      oceanDiveToOnShoreMovieStore: oceanDiveToOnShoreMovieStore,
      onShoreToOceanDiveMovieStore: onShoreToOceanDiveMovieStore,
      onShoreMovieStore: onShoreMovieStore,
    );
  });

  group("initial values", () {
    test("movieMode", () {
      testStore.movieMode = BeachWaveMovieModes.none;
    });

    // test("currentWaterYPosition should be set to -1.0", () {
    //   expect(testStore.currentWaterYPosition, -1.0);
    // });

    group('movieModeToStoreLookup', () {
      test("none key", () {
        final noneRes =
            testStore.movieModeToStoreLookup[BeachWaveMovieModes.none];
        expect(noneRes?.movie.duration, Seconds.get(0));
      });
      test("oceanDive key", () {
        final oceanDiveRes = testStore
            .movieModeToStoreLookup[BeachWaveMovieModes.onShoreToOceanDive];
        expect(oceanDiveRes?.movie.duration, Seconds.get(5));
      });
      test("onShore key", () {
        final onShoreRes =
            testStore.movieModeToStoreLookup[BeachWaveMovieModes.onShore];
        expect(onShoreRes?.movie.duration, Seconds.get(2, milli: 1));
      });
    });

    group("computed values", () {
      test("currentControl", () {
        final currentControlRes = testStore.currentControl;
        expect(currentControlRes, Control.stop);
      });
      test("currentMovie", () {
        final currentMovieDuration = testStore.currentMovie.duration;
        expect(currentMovieDuration, Seconds.get(0));
      });
    });
  });

  group("actions", () {
    // test(
    //     "setCurrentWaterYPosition should set currentWaterYPosition according to the parameter",
    //     () {
    //   testStore.setCurrentWaterYPosition(10.1234);
    //   expect(testStore.currentWaterYPosition, 10.1234);
    // });
    test('setMovieMode', () {
      testStore.setMovieMode(BeachWaveMovieModes.oceanDive);
      expect(testStore.movieMode, BeachWaveMovieModes.oceanDive);
    });
  });

  group("computed values", () {
    setUp(() {
      testStore.setMovieMode(BeachWaveMovieModes.onShore);
    });
    test("currentControl", () {
      expect(testStore.currentControl, Control.mirror);
    });

    test("currentMovie", () {
      expect(testStore.currentMovie.duration, Seconds.get(2, milli: 1));
    });
  });
}
