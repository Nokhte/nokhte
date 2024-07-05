// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/exit_status_indicator/exit_status_indicator.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'exit_status_indicator_store.g.dart';

class ExitStatusIndicatorStore = _ExitStatusIndicatorStoreBase
    with _$ExitStatusIndicatorStore;

abstract class _ExitStatusIndicatorStoreBase extends BaseWidgetStore
    with Store {
  _ExitStatusIndicatorStoreBase() {
    setMovie(
      ExitStatusIndicatorMovies.show(
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
      ExitStatusIndicatorMovies.show(
        startingPercent: percent,
      ),
    );
    setControl(Control.playFromStart);
  }

  initHide() {
    setMovieMode(ExitStatusMovieModes.hide);
    setMovieStatus(MovieStatus.inProgress);
    setMovie(
      ExitStatusIndicatorMovies.hide(
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
      ExitStatusIndicatorMovies.adjust(
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
      ExitStatusIndicatorMovies.complete(
        startingPercent: percent,
      ),
    );
    setControl(Control.playFromStart);
  }

  @computed
  double get percent => (numberOfAffirmative / total) * 100;
}
