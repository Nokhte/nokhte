// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'vibrant_blue_grad_to_dry_sand_movie_store.g.dart';

class VibrantBlueGradToDrySandMovieStore = _VibrantBlueGradToDrySandMovieStoreBase
    with _$VibrantBlueGradToDrySandMovieStore;

abstract class _VibrantBlueGradToDrySandMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _VibrantBlueGradToDrySandMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.vibrantBlueGrad,
      WaterColorsAndStops.drySand,
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
