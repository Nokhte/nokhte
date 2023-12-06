// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/beach_waves/stack/movies/dynamic_to_times_up_start.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'ocean_dive_to_times_up_start_movie_store.g.dart';

class OceanDiveToTimesUpStartMovieStore = _OceanDiveToTimesUpStartMovieStoreBase
    with _$OceanDiveToTimesUpStartMovieStore;

abstract class _OceanDiveToTimesUpStartMovieStoreBase
    extends BaseCustomAnimatedWidgetStore<NoParams> with Store {
  _OceanDiveToTimesUpStartMovieStoreBase() {
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
