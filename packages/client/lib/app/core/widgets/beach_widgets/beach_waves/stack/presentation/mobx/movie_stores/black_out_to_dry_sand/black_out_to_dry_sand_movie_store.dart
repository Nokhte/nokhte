// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'black_out_to_dry_sand_movie_store.g.dart';

class BlackOutToDrySandMovieStore = _BlackOutToDrySandMovieStoreBase
    with _$BlackOutToDrySandMovieStore;

abstract class _BlackOutToDrySandMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _BlackOutToDrySandMovieStoreBase()
      : super(
          shouldPaintSand: BlackOutToDrySandMovie.shouldPaintSand,
        ) {
    movie = BlackOutToDrySandMovie.movie;
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
