import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class BeachWavesModule extends Module {
  @override
  exportedBinds(i) {
    i.add<BlackOutMovieStore>(
      () => BlackOutMovieStore(),
    );

    i.add<BlackOutToDrySandMovieStore>(
      () => BlackOutToDrySandMovieStore(),
    );

    i.add<OceanDiveToOnShoreMovieStore>(
      () => OceanDiveToOnShoreMovieStore(),
    );

    i.add<OceanDiveToTimesUpStartMovieStore>(
      () => OceanDiveToTimesUpStartMovieStore(),
    );

    i.add<OnShoreToOceanDiveMovieStore>(
      () => OnShoreToOceanDiveMovieStore(),
    );

    i.add<OnShoreMovieStore>(
      () => OnShoreMovieStore(),
    );

    i.add<SuspendedAtOceanDiveStore>(
      () => SuspendedAtOceanDiveStore(),
    );

    i.add<SuspendedAtTheDepthsMovieStore>(
      () => SuspendedAtTheDepthsMovieStore(),
    );

    i.add<TimesUpMovieStore>(
      () => TimesUpMovieStore(),
    );

    i.add<TimesUpEndToTheDepthsMovieStore>(
      () => TimesUpEndToTheDepthsMovieStore(),
    );

    i.add<TimesUpEndToOceanDiveMovieStore>(
      () => TimesUpEndToOceanDiveMovieStore(),
    );

    i.add<TimesUpDynamicPointToTheDepthsMovieStore>(
      () => TimesUpDynamicPointToTheDepthsMovieStore(),
    );
    i.add<WaterFromTopToOnShoreMoviePart1Store>(
      () => WaterFromTopToOnShoreMoviePart1Store(),
    );
    i.add<WaterFromTopToOnShoreMoviePart2Store>(
      () => WaterFromTopToOnShoreMoviePart2Store(),
    );
    i.add<BeachWavesStore>(
      () => BeachWavesStore(
        blackOutMovie: i<BlackOutMovieStore>(),
        blackOutToDrySandMovieStore: i<BlackOutToDrySandMovieStore>(),
        oceanDiveToOnShoreMovieStore: i<OceanDiveToOnShoreMovieStore>(),
        oceanDiveToTimesUpStartMovieStore:
            i<OceanDiveToTimesUpStartMovieStore>(),
        onShoreToOceanDiveMovieStore: i<OnShoreToOceanDiveMovieStore>(),
        onShoreMovieStore: i<OnShoreMovieStore>(),
        suspendedAtTheDepthsMovieStore: i<SuspendedAtTheDepthsMovieStore>(),
        suspendedAtOceanDiveStore: i<SuspendedAtOceanDiveStore>(),
        timesUpMovieStore: i<TimesUpMovieStore>(),
        timesUpDynamicPointToTheDepthsMovie:
            i<TimesUpDynamicPointToTheDepthsMovieStore>(),
        timesUpEndToTheDepthsMovieStore: i<TimesUpEndToTheDepthsMovieStore>(),
        timesUpEndToOceanDiveMovie: i<TimesUpEndToOceanDiveMovieStore>(),
        waterFromTopToOnShoreMoviePart1Store:
            i<WaterFromTopToOnShoreMoviePart1Store>(),
        waterFromTopToOnShoreMoviePart2Store:
            i<WaterFromTopToOnShoreMoviePart2Store>(),
      ),
    );
  }
}
