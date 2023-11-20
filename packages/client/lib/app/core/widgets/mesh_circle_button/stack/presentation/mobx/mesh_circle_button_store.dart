// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'mesh_circle_button_store.g.dart';

class MeshCircleButtonStore = _MeshCircleButtonStoreBase
    with _$MeshCircleButtonStore;

abstract class _MeshCircleButtonStoreBase extends Equatable with Store {
  AnimatedMeshGradientController meshGradientController =
      AnimatedMeshGradientController();

  @observable
  bool isAnimating = false;

  @observable
  Control control = Control.stop;

  @observable
  MovieTween movie = GlowUp.movie;

  @observable
  Color currentGlowColor = Colors.transparent;

  @action
  setCurrentGlowColor(Color newColor) => currentGlowColor = newColor;

  @action
  initGlowDown() {
    movie = GlowDown.getMovie(currentGlowColor);
    control = Control.playFromStart;
  }

  @action
  initGlowUp() {
    movie = GlowUp.movie;
    control = Control.playFromStart;
  }

  @action
  setControl(Control newControl) => control = newControl;

  @action
  setMovie(MovieTween newMovie) => movie = newMovie;

  widgetConstructor() {
    Future.delayed(Seconds.get(1), () {
      toggleWidgetVisibility();
    });
  }

  @action
  toggleWidgetVisibility() {
    showWidget = !showWidget;
  }

  @observable
  bool showWidget = false;

  @action
  toggleColorAnimation() {
    if (isAnimating) {
      meshGradientController.stop();
      isAnimating = false;
    } else {
      meshGradientController.start();
      isAnimating = true;
    }
  }

  @override
  List<Object> get props => [];
}
