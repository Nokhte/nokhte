import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class BeachWavesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<OceanDiveMovieStore>(
          (i) => OceanDiveMovieStore(),
          export: true,
        ),
        Bind.singleton<OnShoreMovieStore>(
          (i) => OnShoreMovieStore(),
          export: true,
        ),
        Bind.singleton<NewBeachWavesStore>(
          (i) => NewBeachWavesStore(
            oceanDiveMovieStore: i<OceanDiveMovieStore>(),
            onShoreMovieStore: i<OnShoreMovieStore>(),
          ),
          export: true,
        ),
      ];
}
