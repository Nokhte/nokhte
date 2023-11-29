import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/beach_waves/stack/presentation/mobx/movie_stores/times_up_end_to_ocean_dive/times_up_end_to_ocean_dive.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class BeachWavesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<OceanDiveToTimesUpMovieStore>(
          (i) => OceanDiveToTimesUpMovieStore(),
          export: true,
        ),
        Bind.singleton<SuspendedAtOceanDiveStore>(
          (i) => SuspendedAtOceanDiveStore(),
          export: true,
        ),
        Bind.singleton<OceanDiveToOnShoreMovieStore>(
          (i) => OceanDiveToOnShoreMovieStore(),
          export: true,
        ),
        Bind.singleton<OnShoreToOceanDiveMovieStore>(
          (i) => OnShoreToOceanDiveMovieStore(),
          export: true,
        ),
        Bind.singleton<OnShoreMovieStore>(
          (i) => OnShoreMovieStore(),
          export: true,
        ),
        Bind.singleton<TimesUpMovieStore>(
          (i) => TimesUpMovieStore(),
          export: true,
        ),
        Bind.singleton<TimesUpEndToOceanDiveMovieStore>(
          (i) => TimesUpEndToOceanDiveMovieStore(),
          export: true,
        ),
        Bind.singleton<NewBeachWavesStore>(
          (i) => NewBeachWavesStore(
            timesUpEndToOceanDiveMovie: i<TimesUpEndToOceanDiveMovieStore>(),
            timesUpMovieStore: i<TimesUpMovieStore>(),
            oceanDiveToTimesUpMovieStore: i<OceanDiveToTimesUpMovieStore>(),
            suspendedAtOceanDiveStore: i<SuspendedAtOceanDiveStore>(),
            oceanDiveToOnShoreMovieStore: i<OceanDiveToOnShoreMovieStore>(),
            onShoreToOceanDiveMovieStore: i<OnShoreToOceanDiveMovieStore>(),
            onShoreMovieStore: i<OnShoreMovieStore>(),
          ),
          export: true,
        ),
      ];
}
