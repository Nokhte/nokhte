// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:path_morph/path_morph.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'perspectives_map_store.g.dart';

class PerspectivesMapStore = _PerspectivesMapStoreBase
    with _$PerspectivesMapStore;

abstract class _PerspectivesMapStoreBase extends Equatable with Store {
  Path endingPath;
  SampledPathData animationPathData;
  MovieTween topCircleAnimationMovie = MovieTween();
  late AnimationController controller;

  @observable
  bool wantToFadeOut = true;

  @action
  setFadeOut(bool newFadeStatus) {
    wantToFadeOut = newFadeStatus;
  }

  _PerspectivesMapStoreBase({
    required this.endingPath,
  }) : animationPathData = PathMorph.samplePaths(
          SvgAnimtionCostants.pillPath,
          endingPath,
        );

  @observable
  bool showWidget = true;

  @action
  setPillAnimationControl(Control newControl) {
    // controller.play();
    pillController = newControl;
  }

  @observable
  MovieTween movie = MovieTween();

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
