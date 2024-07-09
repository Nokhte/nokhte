// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/session/widgets/border_glow/border_glow.dart';
import 'package:simple_animations/simple_animations.dart';
part 'border_glow_store.g.dart';

class BorderGlowStore = _BorderGlowStoreBase with _$BorderGlowStore;

abstract class _BorderGlowStoreBase extends BaseWidgetStore<NoParams>
    with Store {
  _BorderGlowStoreBase() {
    setMovie(BorderGlowUpMovie.movie);
  }

  @observable
  bool isGlowingUp = false;

  @computed
  MovieTween get activeMovie => isGlowingUp ? movie : altMovie;

  @computed
  Control get activeControl => isGlowingUp ? control : altControl;

  @action
  @override
  initMovie(param) {
    isGlowingUp = true;
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playFromStart);
  }

  @action
  setAtCompleteWhiteOut() {
    isGlowingUp = true;
    setMovie(StaticWhiteOutMovie.movie);
    setControl(Control.playReverseFromEnd);
    setControl(Control.stop);
  }

  @action
  initWhiteOut() {
    isGlowingUp = true;
    setMovie(BorderGlowWhiteOutMovie.movie);
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playFromStart);
  }

  @action
  initGlowDown() {
    isGlowingUp = false;
    setMovieStatus(MovieStatus.inProgress);
    altControl = Control.playFromStart;
  }

  @observable
  Color currentColor = Colors.transparent;

  @observable
  double currentWidth = 0.0;

  @observable
  Control altControl = Control.stop;

  @action
  setAltControl(Control newVal) => altControl = newVal;

  @observable
  MovieTween altMovie = BorderGlowDownMovie.getMovie();

  @action
  setAnimationValues({
    required Color color,
    required double width,
  }) {
    if (isGlowingUp) {
      currentColor = color;
      currentWidth = width;

      altMovie = BorderGlowDownMovie.getMovie(
        lastColor: currentColor,
        lastWidth: currentWidth,
      );
    }
  }
}