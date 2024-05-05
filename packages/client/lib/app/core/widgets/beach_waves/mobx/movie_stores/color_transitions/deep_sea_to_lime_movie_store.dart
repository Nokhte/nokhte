// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'deep_sea_to_lime_movie_store.g.dart';

class DeepSeaToLimeMovieStore = _DeepSeaToLimeMovieStoreBase
    with _$DeepSeaToLimeMovieStore;

abstract class _DeepSeaToLimeMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _DeepSeaToLimeMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.deepSeaWater,
      WaterColorsAndStops.lime,
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
