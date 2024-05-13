// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'sky_to_inverted_half_and_half_movie_store.g.dart';

class SkyToInvertedHalfAndHalfMovieStore = _SkyToInvertedHalfAndHalfMovieStoreBase
    with _$SkyToInvertedHalfAndHalfMovieStore;

abstract class _SkyToInvertedHalfAndHalfMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _SkyToInvertedHalfAndHalfMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.sky,
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
