// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'vibrant_blue_gradient_to_times_up_movie_store.g.dart';

class VibrantBlueGradientToTimesUpMovieStore = _VibrantBlueGradientToTimesUpMovieStoreBase
    with _$VibrantBlueGradientToTimesUpMovieStore;

abstract class _VibrantBlueGradientToTimesUpMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _VibrantBlueGradientToTimesUpMovieStoreBase()
      : super(
          shouldPaintSand: VibrantBlueGradientToTimesUpMovie.shouldPaintSand,
        ) {
    movie = VibrantBlueGradientToTimesUpMovie.movie;
  }

  @override
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
