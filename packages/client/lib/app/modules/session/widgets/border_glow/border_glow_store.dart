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
    setMovie(BorderGlowMovies.glowUp());
  }

  @observable
  bool isGlowingUp = false;

  @action
  @override
  initMovie(param) {
    isGlowingUp = true;
    setMovie(BorderGlowMovies.glowUp());
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playFromStart);
  }

  @action
  resetCurrentBackToGreen() {
    setMovie(
      BorderGlowMovies.glowUp(
        startingColor: currentColor,
        startingWidth: currentWidth,
      ),
    );
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }

  @action
  initGlowDown() {
    isGlowingUp = false;
    setMovie(BorderGlowDownMovie.getMovie(
      lastColor: currentColor,
      lastWidth: currentWidth,
    ));
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }

  @observable
  Color currentColor = Colors.transparent;

  @observable
  double currentWidth = 0.0;

  @action
  setAnimationValues({
    required Color color,
    required double width,
  }) {
    currentColor = color;
    currentWidth = width;
  }
}
