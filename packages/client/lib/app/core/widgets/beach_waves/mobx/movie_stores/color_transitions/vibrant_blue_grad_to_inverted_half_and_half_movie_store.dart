// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'vibrant_blue_grad_to_inverted_half_and_half_movie_store.g.dart';

class VibrantBlueGradToInvertedHalfAndHalfMovieStore = _VibrantBlueGradToInvertedHalfAndHalfMovieStoreBase
    with _$VibrantBlueGradToInvertedHalfAndHalfMovieStore;

abstract class _VibrantBlueGradToInvertedHalfAndHalfMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _VibrantBlueGradToInvertedHalfAndHalfMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.vibrantBlueGrad,
      WaterColorsAndStops.invertedHalfWaterAndSand,
    );
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }

  @override
  @action
  reverseMovie(params) {
    control = Control.playReverseFromEnd;
  }
}
