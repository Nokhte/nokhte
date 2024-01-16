// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'suspended_at_the_depths_to_times_up_start_movie_store.g.dart';

class SuspendedAtTheDepthsToTimesUpStartMovieStore = _SuspendedAtTheDepthsToTimesUpStartMovieStoreBase
    with _$SuspendedAtTheDepthsToTimesUpStartMovieStore;

abstract class _SuspendedAtTheDepthsToTimesUpStartMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _SuspendedAtTheDepthsToTimesUpStartMovieStoreBase()
      : super(
          shouldPaintSand: DynamicToTimesUpStart.shouldPaintSand,
        ) {
    movie = DynamicToTimesUpStart.getMovie(
      startingColors: WaterColorsAndStops.toTheDepthsWater,
    );
  }

  @override
  initMovie(NoParams params) {
    movie = DynamicToTimesUpStart.getMovie(
      startingColors: WaterColorsAndStops.toTheDepthsWater,
    );
    control = Control.playFromStart;
  }
}
