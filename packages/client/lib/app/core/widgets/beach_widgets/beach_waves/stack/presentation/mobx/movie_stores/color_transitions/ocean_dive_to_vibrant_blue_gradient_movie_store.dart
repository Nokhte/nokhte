// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'ocean_dive_to_vibrant_blue_gradient_movie_store.g.dart';

class OceanDiveToVibrantBlueGradientMovieStore = _OceanDiveToVibrantBlueGradientMovieStoreBase
    with _$OceanDiveToVibrantBlueGradientMovieStore;

abstract class _OceanDiveToVibrantBlueGradientMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _OceanDiveToVibrantBlueGradientMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.oceanDiveWater,
      WaterColorsAndStops.vibrantBlueGrad,
    );
  }

  @override
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
