// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'ocean_dive_to_times_up_start_movie_store.g.dart';

class OceanDiveToTimesUpStartMovieStore = _OceanDiveToTimesUpStartMovieStoreBase
    with _$OceanDiveToTimesUpStartMovieStore;

abstract class _OceanDiveToTimesUpStartMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _OceanDiveToTimesUpStartMovieStoreBase()
      : super(
          shouldPaintSand: DynamicToTimesUpStart.shouldPaintSand,
        ) {
    movie = DynamicToTimesUpStart.getMovie(
      startingColors: WaterColorsAndStops.oceanDiveWater,
    );
  }

  @override
  initMovie(NoParams params) {
    movie = DynamicToTimesUpStart.getMovie(
      startingColors: WaterColorsAndStops.oceanDiveWater,
    );
    control = Control.playFromStart;
  }
}
