// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'sky_to_inverted_half_and_half.g.dart';

class SkyToInvertedHalfAndHalf = _SkyToInvertedHalfAndHalfBase
    with _$SkyToInvertedHalfAndHalf;

abstract class _SkyToInvertedHalfAndHalfBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _SkyToInvertedHalfAndHalfBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      MovieTween(),
      WaterColorsAndStops.sky,
      WaterColorsAndStops.invertedHalfWaterAndSand,
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
