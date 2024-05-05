// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'lime_to_sky_movie_store.g.dart';

class LimeToSkyMovieStore = _LimeToSkyMovieStoreBase with _$LimeToSkyMovieStore;

abstract class _LimeToSkyMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _LimeToSkyMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.lime,
      WaterColorsAndStops.sky,
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
