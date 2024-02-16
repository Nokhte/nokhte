// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'suspended_at_ocean_dive_to_vibrant_blue_gradient_movie_store.g.dart';

class SuspendedAtOceanDiveToVibrantBlueGradientMovieStore = _SuspendedAtOceanDiveToVibrantBlueGradientMovieStoreBase
    with _$SuspendedAtOceanDiveToVibrantBlueGradientMovieStore;

abstract class _SuspendedAtOceanDiveToVibrantBlueGradientMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _SuspendedAtOceanDiveToVibrantBlueGradientMovieStoreBase()
      : super(
          shouldPaintSand:
              SuspendedAtOceanDiveToVibrantBlueGradientMovie.shouldPaintSand,
        ) {
    movie = SuspendedAtOceanDiveToVibrantBlueGradientMovie.movie;
  }

  @override
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
