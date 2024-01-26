// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/beach_waves/stack/movies/times_up_end_to_dynamic.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'times_up_end_to_the_depths_movie_store.g.dart';

class TimesUpEndToTheDepthsMovieStore = _TimesUpEndToTheDepthsMovieStoreBase
    with _$TimesUpEndToTheDepthsMovieStore;

abstract class _TimesUpEndToTheDepthsMovieStoreBase
    extends BaseCustomAnimatedWidgetStore<NoParams> with Store {
  _TimesUpEndToTheDepthsMovieStoreBase() {
    movie = TimesUpEndToDynamic.getMovie(WaterColorsAndStops.toTheDepthsWater);
  }

  @override
  initMovie(NoParams params) {
    movie = TimesUpEndToDynamic.getMovie(WaterColorsAndStops.toTheDepthsWater);
    control = Control.playFromStart;
  }
}
