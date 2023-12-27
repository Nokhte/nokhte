import 'package:nokhte/app/core/widgets/widgets.dart';

class SharedTestUtils {
  static BeachWavesStore getBeachWaves() => BeachWavesStore(
        blackOutMovie: BlackOutMovieStore(),
        blackOutToDrySandMovieStore: BlackOutToDrySandMovieStore(),
        oceanDiveToOnShoreMovieStore: OceanDiveToOnShoreMovieStore(),
        oceanDiveToTimesUpStartMovieStore: OceanDiveToTimesUpStartMovieStore(),
        onShoreToOceanDiveMovieStore: OnShoreToOceanDiveMovieStore(),
        onShoreMovieStore: OnShoreMovieStore(),
        suspendedAtOceanDiveStore: SuspendedAtOceanDiveStore(),
        suspendedAtTheDepthsMovieStore: SuspendedAtTheDepthsMovieStore(),
        timesUpMovieStore: TimesUpMovieStore(),
        timesUpDynamicPointToTheDepthsMovie:
            TimesUpDynamicPointToTheDepthsMovieStore(),
        timesUpEndToOceanDiveMovie: TimesUpEndToOceanDiveMovieStore(),
        timesUpEndToTheDepthsMovieStore: TimesUpEndToTheDepthsMovieStore(),
        waterFromTopToOnShoreMoviePart1Store:
            WaterFromTopToOnShoreMoviePart1Store(),
        waterFromTopToOnShoreMoviePart2Store:
            WaterFromTopToOnShoreMoviePart2Store(),
      );
}
