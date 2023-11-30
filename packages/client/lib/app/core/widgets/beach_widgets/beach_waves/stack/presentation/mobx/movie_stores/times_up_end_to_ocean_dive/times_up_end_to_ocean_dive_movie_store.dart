// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';

import 'times_up_end_to_ocean_dive_movie.dart';
// * Mobx Codegen Inclusion
part 'times_up_end_to_ocean_dive_movie_store.g.dart';

class TimesUpEndToOceanDiveMovieStore = _TimesUpEndToOceanDiveMovieStoreBase
    with _$TimesUpEndToOceanDiveMovieStore;

abstract class _TimesUpEndToOceanDiveMovieStoreBase
    extends BaseCustomAnimatedWidgetStore<NoParams> with Store {
  _TimesUpEndToOceanDiveMovieStoreBase() {
    movie = TimesUpEndToOceanDiveMovie.movie;
  }

  @override
  initMovie(NoParams params) {
    movie = TimesUpEndToOceanDiveMovie.movie;
    control = Control.playFromStart;
  }
}
