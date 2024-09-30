// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'deep_sea_to_sky.g.dart';

class DeepSeaToSky = _DeepSeaToSkyBase with _$DeepSeaToSky;

abstract class _DeepSeaToSkyBase extends BaseBeachWaveMovieStore<NoParams>
    with Store {
  _DeepSeaToSkyBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      MovieTween(),
      WaterColorsAndStops.deepSeaWater,
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
  reverseMovie(NoParams params) {
    control = Control.playReverseFromEnd;
  }
}
