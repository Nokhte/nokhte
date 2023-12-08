import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class BeachWavesModule extends Module {
  @override
  exportedBinds(i) {
    i.addSingleton<BlackOutMovieStore>(
      () => BlackOutMovieStore(),
    );
    i.addSingleton<SuspendedAtTheDepthsMovieStore>(
      () => SuspendedAtTheDepthsMovieStore(),
    );
    i.addSingleton<OceanDiveToTimesUpStartMovieStore>(
      () => OceanDiveToTimesUpStartMovieStore(),
    );
    i.addSingleton<TimesUpEndToTheDepthsMovieStore>(
      () => TimesUpEndToTheDepthsMovieStore(),
    );
    i.addSingleton<SuspendedAtOceanDiveStore>(
      () => SuspendedAtOceanDiveStore(),
    );
    i.addSingleton<OceanDiveToOnShoreMovieStore>(
      () => OceanDiveToOnShoreMovieStore(),
    );
    i.addSingleton<OnShoreToOceanDiveMovieStore>(
      () => OnShoreToOceanDiveMovieStore(),
    );
    i.addSingleton<OnShoreMovieStore>(
      () => OnShoreMovieStore(),
    );
    i.addSingleton<TimesUpMovieStore>(
      () => TimesUpMovieStore(),
    );
    i.addSingleton<TimesUpEndToOceanDiveMovieStore>(
      () => TimesUpEndToOceanDiveMovieStore(),
    );
    i.addSingleton<TimesUpDynamicPointToTheDepthsMovieStore>(
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
