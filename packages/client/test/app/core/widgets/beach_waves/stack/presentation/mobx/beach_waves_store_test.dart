import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../../../../modules/shared/shared_test_utils.dart';

void main() {
  late BeachWavesStore testStore;
  List mockAnimationValues = [
    0.0, // water y values
    Colors.black, // water colors
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    0.0, // water stops
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
  ];

  setUp(() {
    testStore = SharedTestUtils.getBeachWaves();
  });

  group("initial values", () {
    test("movieMode", () {
      testStore.movieMode = BeachWaveMovieModes.onShore;
    });

    group('movieModeToStoreLookup', () {
      test("blackOut key", () {
        final res =
            testStore.movieModeToStoreLookup[BeachWaveMovieModes.blackOut];
        expect(res?.movie.duration, Seconds.get(1));
      });

      test("blackOutToDrySand key", () {
        final res = testStore
            .movieModeToStoreLookup[BeachWaveMovieModes.blackOutToDrySand];
        expect(res?.movie.duration, Seconds.get(2));
      });

      test("oceanDiveToTimesUp key", () {
        final res = testStore
            .movieModeToStoreLookup[BeachWaveMovieModes.oceanDiveToTimesUp];
        expect(res?.movie.duration, Seconds.get(2));
      });
      test("oceanDiveToOnShore key", () {
        final res = testStore
            .movieModeToStoreLookup[BeachWaveMovieModes.oceanDiveToOnShore];
        expect(res?.movie.duration, Seconds.get(5));
      });
      test("onShore key", () {
        final onShoreRes =
            testStore.movieModeToStoreLookup[BeachWaveMovieModes.onShore];
        expect(onShoreRes?.movie.duration, Seconds.get(2, milli: 1));
      });
      test("onShoreToOceanDive key", () {
        final res = testStore
            .movieModeToStoreLookup[BeachWaveMovieModes.onShoreToOceanDive];
        expect(res?.movie.duration, Seconds.get(2, milli: 1));
      });
      test("onShoreToOceanDive key", () {
        final oceanDiveRes = testStore
            .movieModeToStoreLookup[BeachWaveMovieModes.onShoreToOceanDive];
        expect(oceanDiveRes?.movie.duration, Seconds.get(2, milli: 1));
      });
      test("none key", () {
        final noneRes =
            testStore.movieModeToStoreLookup[BeachWaveMovieModes.none];
        expect(noneRes?.movie.duration, Seconds.get(0));
      });
      test("timesUp key", () {
        final res =
            testStore.movieModeToStoreLookup[BeachWaveMovieModes.timesUp];
        expect(res?.movie.duration, Seconds.get(45));
      });
      test("timesUpDynamicPointToTheDepths key", () {
        final res = testStore.movieModeToStoreLookup[
            BeachWaveMovieModes.timesUpDynamicPointToTheDepths];
        expect(res?.movie.duration, Seconds.get(3));
      });
      test("timesUpEndToTheDepths key", () {
        final res = testStore
            .movieModeToStoreLookup[BeachWaveMovieModes.timesUpEndToTheDepths];
        expect(res?.movie.duration, Seconds.get(2));
      });
      test("timesUpEndToOceanDive key", () {
        final res = testStore
            .movieModeToStoreLookup[BeachWaveMovieModes.timesUpEndToOceanDive];
        expect(res?.movie.duration, Seconds.get(2));
      });
      test("suspendedAtOceanDive key", () {
        final res = testStore
            .movieModeToStoreLookup[BeachWaveMovieModes.staticOceanDive];
        expect(res?.movie.duration, Seconds.get(1));
      });
      test("suspendedAtTheDepths key", () {
        final res =
            testStore.movieModeToStoreLookup[BeachWaveMovieModes.staticDepths];
        expect(res?.movie.duration, Seconds.get(1));
      });

      // test("waterFromTopToOnShore key", () {
      //   final res = testStore
      //       .movieModeToStoreLookup[BeachWaveMovieModes.waterFromTopToOnShore];
      //   expect(res?.movie.duration, Seconds.get(1));
      // });
    });

    group("computed values", () {
      test("currentControl", () {
        final currentControlRes = testStore.currentControl;
        expect(currentControlRes, Control.mirror);
      });

      test("shouldPaintSandOnCurrent", () {
        final currentControlRes = testStore.shouldPaintSandOnCurrent;
        expect(currentControlRes, true);
      });
      test("currentMovie", () {
        final currentMovieDuration = testStore.currentMovie.duration;
        expect(currentMovieDuration, Seconds.get(2, milli: 1));
      });
    });
  });

  group("actions", () {
    test('setMovieMode', () {
      testStore.setMovieMode(BeachWaveMovieModes.onShoreToOceanDive);
      expect(testStore.movieMode, BeachWaveMovieModes.onShoreToOceanDive);
    });
  });

  test("setPivotColors", () {
    testStore.setPivotColors(mockAnimationValues);
    expect(testStore.pivotColors, WaterColorsAndStops.blackOut);
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

    test('currentStore', () {
      expect(testStore.currentStore, isA<OnShoreMovieStore>());
    });
    test('currentMovieStatus', () {
      expect(testStore.currentMovieStatus, MovieStatus.idle);
    });
  });
}
