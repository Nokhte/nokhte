// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'deeper_blue_to_black_out.g.dart';

class DeeperBlueToBlackOut = _DeeperBlueToBlackOutBase
    with _$DeeperBlueToBlackOut;

abstract class _DeeperBlueToBlackOutBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _DeeperBlueToBlackOutBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      MovieTween(),
      WaterColorsAndStops.deeperBlue,
      WaterColorsAndStops.blackOut,
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
