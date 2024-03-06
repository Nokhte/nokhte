// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'resume_on_shore_movie_store.g.dart';

class ResumeOnShoreMovieStore = _ResumeOnShoreMovieStoreBase
    with _$ResumeOnShoreMovieStore;

abstract class _ResumeOnShoreMovieStoreBase
    extends BaseBeachWaveMovieStore<ResumeOnShoreParams> with Store {
  _ResumeOnShoreMovieStoreBase()
      : super(
          callsOnCompleteTwice: false,
          shouldPaintSand: OnShoreMovie.shouldPaintSand,
        ) {
    movie = OnShoreMovie.movie;
  }

  @override
  @action
  initMovie(ResumeOnShoreParams params) {
    setMovie(ResumeOnShoreMovie.getMovie(params));
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }
}
