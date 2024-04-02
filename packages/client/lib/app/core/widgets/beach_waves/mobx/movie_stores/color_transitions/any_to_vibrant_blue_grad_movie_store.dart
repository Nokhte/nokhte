// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'any_to_vibrant_blue_grad_movie_store.g.dart';

class AnyToVibrantBlueGradMovieStore = _AnyToVibrantBlueGradMovieStoreBase
    with _$AnyToVibrantBlueGradMovieStore;

abstract class _AnyToVibrantBlueGradMovieStoreBase
    extends BaseBeachWaveMovieStore<DurationAndGradient> with Store {
  _AnyToVibrantBlueGradMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.toTheDepthsWater,
      WaterColorsAndStops.toTheDepthsWater,
    );
  }

  @override
  initMovie(DurationAndGradient param) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      param.gradient,
      WaterColorsAndStops.vibrantBlueGrad,
      seconds: param.duration,
    );
    control = Control.playFromStart;
  }
}
