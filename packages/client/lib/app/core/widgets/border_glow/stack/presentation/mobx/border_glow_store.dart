// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/border_glow/border_glow.dart';
import 'package:simple_animations/simple_animations.dart';
part 'border_glow_store.g.dart';

class BorderGlowStore = _BorderGlowStoreBase with _$BorderGlowStore;

abstract class _BorderGlowStoreBase
    extends BaseCustomAnimatedWidgetStore<NoParams> with Store {
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
    setMovie(BorderGlowUpMovie.movie);
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playFromStart);
  }

  @action
  initGlowDown() {
    isGlowingUp = false;
    altControl = Control.playFromStart;
  }

  @observable
  Color currentColor = Colors.transparent;

  @observable
  double currentWidth = 0.0;

  @observable
  Control altControl = Control.stop;

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
