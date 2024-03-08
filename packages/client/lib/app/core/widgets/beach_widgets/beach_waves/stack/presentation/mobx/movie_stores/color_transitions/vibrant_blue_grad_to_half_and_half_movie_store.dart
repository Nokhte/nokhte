// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'vibrant_blue_grad_to_half_and_half_movie_store.g.dart';

class VibrantBlueGradToHalfAndHalfMovieStore = _VibrantBlueGradToHalfAndHalfMovieStoreBase
    with _$VibrantBlueGradToHalfAndHalfMovieStore;

abstract class _VibrantBlueGradToHalfAndHalfMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _VibrantBlueGradToHalfAndHalfMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.vibrantBlueGrad,
      WaterColorsAndStops.halfWaterAndSand,
    );
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
