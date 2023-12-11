import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class BeachWavesModule extends Module {
  @override
  exportedBinds(i) {
    i.add<BlackOutMovieStore>(
      () => BlackOutMovieStore(),
    );
    i.add<SuspendedAtTheDepthsMovieStore>(
      () => SuspendedAtTheDepthsMovieStore(),
    );
    i.add<OceanDiveToTimesUpStartMovieStore>(
      () => OceanDiveToTimesUpStartMovieStore(),
    );
    i.add<TimesUpEndToTheDepthsMovieStore>(
      () => TimesUpEndToTheDepthsMovieStore(),
    );
    i.add<SuspendedAtOceanDiveStore>(
      () => SuspendedAtOceanDiveStore(),
    );
    i.add<OceanDiveToOnShoreMovieStore>(
      () => OceanDiveToOnShoreMovieStore(),
    );
    i.add<OnShoreToOceanDiveMovieStore>(
      () => OnShoreToOceanDiveMovieStore(),
    );
    i.add<OnShoreMovieStore>(
      () => OnShoreMovieStore(),
    );
    i.add<TimesUpMovieStore>(
      () => TimesUpMovieStore(),
    );
    i.add<TimesUpEndToOceanDiveMovieStore>(
      () => TimesUpEndToOceanDiveMovieStore(),
    );
    i.add<TimesUpDynamicPointToTheDepthsMovieStore>(
      () => TimesUpDynamicPointToTheDepthsMovieStore(),
    );
    i.add<BeachWavesStore>(
      () => BeachWavesStore(
        blackOutMovie: i<BlackOutMovieStore>(),
        timesUpEndToTheDepthsMovieStore: i<TimesUpEndToTheDepthsMovieStore>(),
        suspendedAtTheDepthsMovieStore: i<SuspendedAtTheDepthsMovieStore>(),
        timesUpDynamicPointToTheDepthsMovie:
            i<TimesUpDynamicPointToTheDepthsMovieStore>(),
        timesUpEndToOceanDiveMovie: i<TimesUpEndToOceanDiveMovieStore>(),
        timesUpMovieStore: i<TimesUpMovieStore>(),
        oceanDiveToTimesUpStartMovieStore:
            i<OceanDiveToTimesUpStartMovieStore>(),
        suspendedAtOceanDiveStore: i<SuspendedAtOceanDiveStore>(),
        oceanDiveToOnShoreMovieStore: i<OceanDiveToOnShoreMovieStore>(),
        onShoreToOceanDiveMovieStore: i<OnShoreToOceanDiveMovieStore>(),
        onShoreMovieStore: i<OnShoreMovieStore>(),
      ),
    );
  }
}
