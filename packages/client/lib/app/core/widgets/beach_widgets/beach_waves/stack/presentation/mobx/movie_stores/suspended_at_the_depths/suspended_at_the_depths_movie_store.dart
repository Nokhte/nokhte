// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'suspended_at_the_depths_movie_store.g.dart';

class SuspendedAtTheDepthsMovieStore = _SuspendedAtTheDepthsMovieStoreBase
    with _$SuspendedAtTheDepthsMovieStore;

abstract class _SuspendedAtTheDepthsMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _SuspendedAtTheDepthsMovieStoreBase()
      : super(
          shouldPaintSand: SuspendedAtOceanDiveMovie.shouldPaintSand,
        ) {
    movie = SuspendedAtTheDepthsMovie.movie;
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
