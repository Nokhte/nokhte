// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'any_to_half_and_half.g.dart';

class AnyToHalfAndHalf = _AnyToHalfAndHalfBase with _$AnyToHalfAndHalf;

abstract class _AnyToHalfAndHalfBase
    extends BaseBeachWaveMovieStore<List<ColorAndStop>> with Store {
  _AnyToHalfAndHalfBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      MovieTween(),
      WaterColorsAndStops.toTheDepthsWater,
      WaterColorsAndStops.toTheDepthsWater,
    );
  }

  @override
  initMovie(List<ColorAndStop> param) {
    const halfAndHalf = WaterColorsAndStops.halfWaterAndSand;
    movie = TwoSecondBeachTransitionMovie.getMovie(
      MovieTween(),
      param,
      halfAndHalf,
    );
    control = Control.playFromStart;
  }
}
