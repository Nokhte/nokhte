// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'times_up_end_to_ocean_dive_movie_store.g.dart';

class TimesUpEndToOceanDiveMovieStore = _TimesUpEndToOceanDiveMovieStoreBase
    with _$TimesUpEndToOceanDiveMovieStore;

abstract class _TimesUpEndToOceanDiveMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _TimesUpEndToOceanDiveMovieStoreBase()
      : super(
          shouldPaintSand: TimesUpEndToDynamic.shouldPaintSand,
        ) {
    movie = TimesUpEndToDynamic.getMovie(WaterColorsAndStops.oceanDiveWater);
  }

  @override
  initMovie(NoParams params) {
    movie = TimesUpEndToDynamic.getMovie(WaterColorsAndStops.oceanDiveWater);
    control = Control.playFromStart;
  }
}
