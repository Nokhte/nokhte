// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'borealis_to_sky.g.dart';

class BorealisToSky = _BorealisToSkyBase with _$BorealisToSky;

abstract class _BorealisToSkyBase extends BaseBeachWaveMovieStore<NoParams>
    with Store {
  _BorealisToSkyBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      MovieTween(),
      WaterColorsAndStops.borealis,
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
