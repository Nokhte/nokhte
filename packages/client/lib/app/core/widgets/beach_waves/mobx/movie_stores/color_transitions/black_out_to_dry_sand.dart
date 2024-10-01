// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'black_out_to_dry_sand.g.dart';

class BlackOutToDrySand = _BlackOutToDrySandBase with _$BlackOutToDrySand;

abstract class _BlackOutToDrySandBase extends BaseBeachWaveMovieStore<NoParams>
    with Store {
  _BlackOutToDrySandBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      MovieTween(),
      WaterColorsAndStops.blackOut,
      WaterColorsAndStops.drySand,
    );
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
