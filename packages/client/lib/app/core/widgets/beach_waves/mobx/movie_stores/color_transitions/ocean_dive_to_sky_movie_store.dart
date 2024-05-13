// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'ocean_dive_to_sky_movie_store.g.dart';

class OceanDiveToSkyMovieStore = _OceanDiveToSkyMovieStoreBase
    with _$OceanDiveToSkyMovieStore;

abstract class _OceanDiveToSkyMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _OceanDiveToSkyMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.oceanDiveWater,
      WaterColorsAndStops.sky,
    );
  }

  @override
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
