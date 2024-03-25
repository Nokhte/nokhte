// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'static_ocean_dive_movie_store.g.dart';

class StaticOceanDiveStore = _StaticOceanDiveStoreBase
    with _$StaticOceanDiveStore;

abstract class _StaticOceanDiveStoreBase extends BaseBeachWaveMovieStore
    with Store {
  _StaticOceanDiveStoreBase()
      : super(
          shouldPaintSand: StaticBeachWavesMovie.shouldPaintSand,
        ) {
    movie = StaticBeachWavesMovie.getMovie(WaterColorsAndStops.oceanDiveWater);
  }
}
