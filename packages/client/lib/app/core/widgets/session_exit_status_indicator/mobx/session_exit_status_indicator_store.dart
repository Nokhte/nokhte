// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/session_exit_status_indicator/session_exit_status_indicator.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_exit_status_indicator_store.g.dart';

class SessionExitStatusIndicatorStore = _SessionExitStatusIndicatorStoreBase
    with _$SessionExitStatusIndicatorStore;

abstract class _SessionExitStatusIndicatorStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  _SessionExitStatusIndicatorStoreBase() {
    setMovie(
      ShowSessionExitStatusIndicatorMovie.getMovie(
        startingPercent: 20,
      ),
    );
  }

  @observable
  ExitStatusMovieModes movieMode = ExitStatusMovieModes.none;

  @action
  setMovieMode(ExitStatusMovieModes value) => movieMode = value;

  @observable
  int numberOfAffirmative = 0;

  @action
  setNumberOfAffirmative(int value) => numberOfAffirmative = value;

  @observable
  int total = 0;

  @action
  setTotal(int value) => total = value;

  @action
  initStartingMovie({
    required int numberOfAffirmative,
    required int total,
  }) {
    setMovieMode(ExitStatusMovieModes.show);
    setMovieStatus(MovieStatus.inProgress);
    setNumberOfAffirmative(numberOfAffirmative);
    setTotal(total);
    setMovie(
      ShowSessionExitStatusIndicatorMovie.getMovie(
        startingPercent: percent,
      ),
    );
    setControl(Control.playFromStart);
  }

  @action
  initAdjust(int newNumberOfAffirmative) {
    setMovieMode(ExitStatusMovieModes.adjust);
    setMovieStatus(MovieStatus.inProgress);
    final newPercent = (newNumberOfAffirmative / total) * 100;
    Timer(Seconds.get(0, milli: 500), () {
      setNumberOfAffirmative(newNumberOfAffirmative);
    });
    setMovie(
      AdjustSessionExitStatusIndicatorMovie.getMovie(
        startingPercent: percent,
        endingPercent: newPercent,
      ),
    );
    setControl(Control.playFromStart);
  }

  @action
  initComplete() {
    setMovieMode(ExitStatusMovieModes.complete);
    setMovieStatus(MovieStatus.inProgress);
    setMovie(
      CompleteSessionExitStatusIndicatorMovie.getMovie(
        startingPercent: percent,
      ),
    );
    setControl(Control.playFromStart);
  }

  @computed
  double get percent => (numberOfAffirmative / total) * 100;
}
