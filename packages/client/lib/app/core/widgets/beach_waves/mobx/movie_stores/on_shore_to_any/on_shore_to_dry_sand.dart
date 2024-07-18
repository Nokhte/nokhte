// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'on_shore_to_dry_sand.g.dart';

class OnShoreToDrySand = _OnShoreToDrySandBase with _$OnShoreToDrySand;

abstract class _OnShoreToDrySandBase extends BaseBeachWaveMovieStore<double>
    with Store {
  _OnShoreToDrySandBase()
      : super(
          callsOnCompleteTwice: true,
          shouldPaintSand: OnShoreToAny.shouldPaintSand,
        ) {
    movie = OnShoreMovie.getMovie(
        shouldInvert: false, startingDirection: WaterDirection.up);
  }

  @override
  @action
  initMovie(double startingWaterPosition) {
    setMovie(
      OnShoreToAny.getMovie(
        startingWaterMovement: startingWaterPosition,
        endingColors: WaterColorsAndStops.drySand,
      ),
    );
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }
}
