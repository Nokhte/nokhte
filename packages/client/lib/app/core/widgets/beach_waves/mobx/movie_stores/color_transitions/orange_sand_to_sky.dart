// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'orange_sand_to_sky.g.dart';

class OrangeSandToSky = _OrangeSandToSkyBase with _$OrangeSandToSky;

abstract class _OrangeSandToSkyBase extends BaseBeachWaveMovieStore<NoParams>
    with Store {
  _OrangeSandToSkyBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
          callsOnCompleteTwice: false,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.orangeSand,
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
