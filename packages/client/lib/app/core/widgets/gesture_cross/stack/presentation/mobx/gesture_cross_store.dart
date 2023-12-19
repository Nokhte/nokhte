// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:path_morph/path_morph.dart';
import 'package:simple_animations/simple_animations.dart';
part 'gesture_cross_store.g.dart';

class GestureCrossStore = _GestureCrossStoreBase with _$GestureCrossStore;

abstract class _GestureCrossStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  Path endingPath;
  late SampledPathData animationPathData;
  MovieTween topCircleAnimationMovie = MovieTween();
  late AnimationController controller;

  @observable
  bool wantToFadeOut = true;

  @action
  setFadeOut(bool newFadeStatus) {
    wantToFadeOut = newFadeStatus;
  }

  _GestureCrossStoreBase({
    required this.endingPath,
  }) {
    animationPathData = PathMorph.samplePaths(
      SvgAnimtionConstants.pillPath,
      endingPath,
    );

    showWidget = true;
  }

  @action
  setPillAnimationControl(Control newControl) {
    pillController = newControl;
  }

  @action
  setPillMovie(MovieTween newMovie) {
    movie = newMovie;
  }

  @observable
  Control pillController = Control.stop;

  @action
  animationRenderingCallback(int i, Offset z) {
    animationPathData.shiftedPoints[i] = z;
  }

  @action
  onAnimationCompleted() {
    if (wantToFadeOut) showWidget = false;
  }

  @override
  List<Object> get props => [];
}
