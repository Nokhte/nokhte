// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/mobx.dart';

import 'suspended_at_the_depths_movie.dart';
// * Mobx Codegen Inclusion
part 'suspended_at_the_depths_movie_store.g.dart';

class SuspendedAtTheDepthsMovieStore = _SuspendedAtTheDepthsMovieStoreBase
    with _$SuspendedAtTheDepthsMovieStore;

abstract class _SuspendedAtTheDepthsMovieStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  _SuspendedAtTheDepthsMovieStoreBase() {
    movie = SuspendedAtTheDepthsMovie.movie;
  }
}
