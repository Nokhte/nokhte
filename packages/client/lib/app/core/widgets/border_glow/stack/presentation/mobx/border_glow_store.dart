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

  @action
  @override
  initMovie(param) {
    setMovie(BorderGlowUpMovie.movie);
    setMovieStatus(MovieStatus.inProgress);
    setControl(Control.playFromStart);
  }

  @action
  initGlowDown() {
    setMovie(BorderGlowDownMovie.getMovie(
      lastColor: currentColor,
      lastWidth: currentWidth,
    ));
    setControl(Control.playFromStart);
    setControl(Control.stop);
    setControl(Control.play);
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
