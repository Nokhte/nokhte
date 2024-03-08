// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'dry_sand_to_vibrant_blue_grad_movie_store.g.dart';

class DrySandToVibrantBlueGradMovieStore = _DrySandToVibrantBlueGradMovieStoreBase
    with _$DrySandToVibrantBlueGradMovieStore;

abstract class _DrySandToVibrantBlueGradMovieStoreBase
    extends BaseBeachWaveMovieStore<WaterDirectionParam> with Store {
  _DrySandToVibrantBlueGradMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = SequenceTransitionMovie.getMovie(
      WaterColorsAndStops.drySandToVibrantBlueFromBottomSequence,
      movieLength: Seconds.get(10),
    );
  }

  @override
  @action
  initMovie(WaterDirectionParam params) {
    List<List<ColorAndStop>> waterSequence = [];
    switch (params) {
      case WaterDirectionParam.fromTop:
        waterSequence = WaterColorsAndStops.drySandToVibrantBlueFromTopSequence;
      case WaterDirectionParam.fromBottom:
        waterSequence =
            WaterColorsAndStops.drySandToVibrantBlueFromBottomSequence;
    }
    movie = SequenceTransitionMovie.getMovie(
      waterSequence,
      movieLength: Seconds.get(10),
    );
    control = Control.playFromStart;
  }
}
