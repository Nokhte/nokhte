// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/login/login.dart';
import 'package:simple_animations/simple_animations.dart';
part 'login_nokhtes_store.g.dart';

class LoginNokhtesStore = _LoginNokhtesStoreBase with _$LoginNokhtesStore;

abstract class _LoginNokhtesStoreBase extends BaseWidgetStore with Store {
  _LoginNokhtesStoreBase() {
    setMovie(
      LoginNokhteMovies.setCenterPosition(
        const Offset(-10, -10),
        const Offset(-10, 10),
      ),
    );
  }

  @observable
  Offset centerCoordinates = Offset.zero;

  @observable
  LoginNokhtesMovieModes movieMode = LoginNokhtesMovieModes.initial;

  @action
  setMovieModes(LoginNokhtesMovieModes newMovieMode) =>
      movieMode = newMovieMode;

  @action
  setCenterCoordinates(Offset newCenter) => centerCoordinates = newCenter;

  @action
  reset() {
    setMovieModes(LoginNokhtesMovieModes.setPosition);
    setMovieStatus(MovieStatus.inProgress);
    setMovie(LoginNokhteMovies.moveBackToCenter(centerCoordinates));
    setControl(Control.playFromStart);
  }

  @action
  initMoveUpAndApparateMovie() {
    setMovieModes(LoginNokhtesMovieModes.setPosition);
    setMovieModes(LoginNokhtesMovieModes.moveUpAndApparate);
    setMovieStatus(MovieStatus.inProgress);
    setMovie(LoginNokhteMovies.moveUpAndDisappear(centerCoordinates));
    setControl(Control.playFromStart);
  }

  @action
  initPositionMovie(Offset touchPoint, Offset centerPoint) {
    setMovieModes(LoginNokhtesMovieModes.setPosition);
    setCenterCoordinates(centerPoint);
    setMovie(LoginNokhteMovies.setCenterPosition(touchPoint, centerPoint));
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }

  @computed
  bool get isAboutToApparate =>
      movieMode == LoginNokhtesMovieModes.moveUpAndApparate ? true : false;
}
