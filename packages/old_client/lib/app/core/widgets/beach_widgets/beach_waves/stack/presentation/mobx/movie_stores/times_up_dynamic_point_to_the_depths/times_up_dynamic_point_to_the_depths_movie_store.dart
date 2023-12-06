// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:simple_animations/simple_animations.dart';

import 'times_up_dynamic_point_to_the_depths_movie.dart';
// * Mobx Codegen Inclusion
part 'times_up_dynamic_point_to_the_depths_movie_store.g.dart';

class TimesUpDynamicPointToTheDepthsMovieStore = _TimesUpDynamicPointToTheDepthsMovieStoreBase
    with _$TimesUpDynamicPointToTheDepthsMovieStore;

abstract class _TimesUpDynamicPointToTheDepthsMovieStoreBase
    extends BaseCustomAnimatedWidgetStore<List<ColorAndStop>> with Store {
  _TimesUpDynamicPointToTheDepthsMovieStoreBase()
      : super(callsOnCompleteTwice: true) {
    movie = TimesUpDynamicPointToTheDepthsMovie.getMovie(
      WaterColorsAndStops.toTheDepthsWater,
    );
  }

  @override
  initMovie(List<ColorAndStop> param) {
    movie = TimesUpDynamicPointToTheDepthsMovie.getMovie(param);
    control = Control.playFromStart;
  }
}
