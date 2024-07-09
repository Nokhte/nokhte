// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/login/login.dart';
import 'package:simple_animations/simple_animations.dart';
part 'nokhte_store.g.dart';

class NokhteStore = _NokhteStoreBase with _$NokhteStore;

abstract class _NokhteStoreBase extends BaseWidgetStore with Store {
  _NokhteStoreBase() {
    setMovie(
      SetNokhtePositionMovie.getMovie(
          const Offset(-10, -10), const Offset(-10, 10)),
    );
  }

  @observable
  Offset centerCoordinates = Offset.zero;

  @observable
  NokhteMovieModes movieMode = NokhteMovieModes.initial;

  @action
  setMovieModes(NokhteMovieModes newMovieMode) => movieMode = newMovieMode;

  @action
  setCenterCoordinates(Offset newCenter) => centerCoordinates = newCenter;

  @action
  reset() {
    setMovieModes(NokhteMovieModes.setPosition);
    setMovieStatus(MovieStatus.inProgress);
    setMovie(MoveBackToCenterMovie.getMovie(centerCoordinates));
    setControl(Control.playFromStart);
  }

  @action
  initMoveUpAndApparateMovie() {
    setMovieModes(NokhteMovieModes.setPosition);
    setMovieModes(NokhteMovieModes.moveUpAndApparate);
    setMovieStatus(MovieStatus.inProgress);
    setMovie(MoveUpAndApparateMovie.getMovie(centerCoordinates));
    setControl(Control.playFromStart);
  }

  @action
  initPositionMovie(Offset touchPoint, Offset centerPoint) {
    setMovieModes(NokhteMovieModes.setPosition);
    setCenterCoordinates(centerPoint);
    setMovie(SetNokhtePositionMovie.getMovie(touchPoint, centerPoint));
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }

  @computed
  bool get isAboutToApparate =>
      movieMode == NokhteMovieModes.moveUpAndApparate ? true : false;
}
