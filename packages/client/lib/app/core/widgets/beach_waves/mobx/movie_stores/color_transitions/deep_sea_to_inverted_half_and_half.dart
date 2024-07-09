// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'deep_sea_to_inverted_half_and_half.g.dart';

class DeepSeaToInvertedHalfAndHalf = _DeepSeaToInvertedHalfAndHalfBase
    with _$DeepSeaToInvertedHalfAndHalf;

abstract class _DeepSeaToInvertedHalfAndHalfBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _DeepSeaToInvertedHalfAndHalfBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
          callsOnCompleteTwice: false,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.deepSeaWater,
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
  reverseMovie(NoParams params) {
    control = Control.playReverseFromEnd;
  }
}
