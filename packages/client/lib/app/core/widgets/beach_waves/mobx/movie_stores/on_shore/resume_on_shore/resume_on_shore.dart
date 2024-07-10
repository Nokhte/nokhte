// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'resume_on_shore_movie.dart';
export "resume_on_shore_params.dart";
part 'resume_on_shore.g.dart';

class ResumeOnShore = _ResumeOnShoreBase with _$ResumeOnShore;

abstract class _ResumeOnShoreBase
    extends BaseBeachWaveMovieStore<ResumeOnShoreParams> with Store {
  _ResumeOnShoreBase()
      : super(
          callsOnCompleteTwice: false,
          shouldPaintSand: OnShoreMovie.shouldPaintSand,
        ) {
    movie = OnShoreMovie.getMovie(
        shouldInvert: false, startingDirection: WaterDirection.up);
  }

  @override
  @action
  initMovie(ResumeOnShoreParams params) {
    setMovie(ResumeOnShoreMovie.getMovie(params));
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }
}
