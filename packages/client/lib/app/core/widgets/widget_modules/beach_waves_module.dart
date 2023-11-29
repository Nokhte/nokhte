import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class BeachWavesModule extends Module {
  @override
  List<Bind> get binds => [
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
        Bind.singleton<NewBeachWavesStore>(
          (i) => NewBeachWavesStore(
            oceanDiveToOnShoreMovieStore: i<OceanDiveToOnShoreMovieStore>(),
            onShoreToOceanDiveMovieStore: i<OnShoreToOceanDiveMovieStore>(),
            onShoreMovieStore: i<OnShoreMovieStore>(),
          ),
          export: true,
        ),
      ];
}
