// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'inverted_half_and_half_to_dry_sand_movie_store.g.dart';

class InvertedHalfAndHalfToDrySandMovieStore = _InvertedHalfAndHalfToDrySandMovieStoreBase
    with _$InvertedHalfAndHalfToDrySandMovieStore;

abstract class _InvertedHalfAndHalfToDrySandMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _InvertedHalfAndHalfToDrySandMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
          callsOnCompleteTwice: false,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.invertedHalfWaterAndSand,
      WaterColorsAndStops.condensedDrySand,
    );
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
