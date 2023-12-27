// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'availability_sectors_store.g.dart';

class AvailabilitySectorsStore = _AvailabilitySectorsStoreBase
    with _$AvailabilitySectorsStore;

abstract class _AvailabilitySectorsStoreBase
    extends BaseCustomAnimatedWidgetStore<NoParams> with Store {
  _AvailabilitySectorsStoreBase() {
    setMovie(SetupAvailabilitySectorsMovies.movie);
  }

  @observable
  AvailabilitySectorMovieModes movieMode = AvailabilitySectorMovieModes.initial;

  @action
  setMovieMode(AvailabilitySectorMovieModes newMovieMode) =>
      movieMode = newMovieMode;

  @override
  initMovie(param) {
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.play);
    setMovieMode(AvailabilitySectorMovieModes.setup);
  }

  @action
  initJoinAndFadeOutMovie() {
    if (movieStatus == MovieStatus.finished &&
        movieMode == AvailabilitySectorMovieModes.setup) {
      setMovieStatus(MovieStatus.inProgress);
      setMovieMode(AvailabilitySectorMovieModes.joinAndFadeOut);
      setMovie(JoinSectorsAndFadeOutMovie.movie);
      setControl(Control.playFromStart);
    }
  }
}
