// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'dry_sand_to_vibrant_blue_grad_movie_store.g.dart';

class DrySandToVibrantBlueGradMovieStore = _DrySandToVibrantBlueGradMovieStoreBase
    with _$DrySandToVibrantBlueGradMovieStore;

abstract class _DrySandToVibrantBlueGradMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _DrySandToVibrantBlueGradMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.drySand,
      WaterColorsAndStops.drySandToVibrantBlueGradForBothPhase9,
    );
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
