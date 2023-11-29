// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/beach_waves/stack/movies/dynamic_start_to_times_up.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'ocean_dive_to_times_up_movie_store.g.dart';

class OceanDiveToTimesUpMovieStore = _OceanDiveToTimesUpMovieStoreBase
    with _$OceanDiveToTimesUpMovieStore;

abstract class _OceanDiveToTimesUpMovieStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  _OceanDiveToTimesUpMovieStoreBase() {
    movie = DynamicStartToTimesUp.getMovie(
      timerLength: Seconds.get(45),
      startingColors: WaterColorsAndStops.oceanDiveWater,
    );
    control = Control.playFromStart;
  }
}
