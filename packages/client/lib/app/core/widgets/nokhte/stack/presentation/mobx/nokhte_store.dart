// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/nokhte/stack/stack.dart';
import 'package:simple_animations/simple_animations.dart';
part 'nokhte_store.g.dart';

class NokhteStore = _NokhteStoreBase with _$NokhteStore;

abstract class _NokhteStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _NokhteStoreBase() {
    setMovie(
      SetNokhtePositionMovie.getMovie(Offset.zero, Offset.zero),
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
    setMovie(
      SetNokhtePositionMovie.getMovie(Offset.zero, Offset.zero),
    );
    if (showWidget) {
      toggleWidgetVisibility();
    }
    setControl(Control.playFromStart);
    setControl(Control.stop);
  }

  @action
  initMoveUpAndApparateMovie() {
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
    Future.delayed(Seconds.get(0, milli: 190), () {
      setControl(Control.playFromStart);
      setMovieStatus(MovieStatus.inProgress);
    });
  }
}
