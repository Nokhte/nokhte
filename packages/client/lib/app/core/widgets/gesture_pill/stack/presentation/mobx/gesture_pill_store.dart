// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:path_morph/path_morph.dart';
import 'package:primala/app/core/widgets/gesture_pill/gesture_pill.dart';
// import 'package:primala/app/core/widgets/gesture_cross/gesture_cross.dart';
import 'package:primala/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'gesture_pill_store.g.dart';

class GesturePillStore = _GesturePillStoreBase with _$GesturePillStore;

abstract class _GesturePillStoreBase extends Equatable with Store {
  Path endingPath;
  SampledPathData animationPathData;
  late AnimationController controller;

  _GesturePillStoreBase({
    required this.endingPath,
  }) : animationPathData = PathMorph.samplePaths(
          SvgAnimtionCostants.pillPath,
          endingPath,
        );

  @observable
  bool showWidget = true;

  @action
  startTheAnimation() {
    controller.play();
    colorController = Control.play;
  }

  @observable
  MovieTween movie = PillToCircle.movie;

  @observable
  Control colorController = Control.stop;

  @action
  animationRenderingCallback(int i, Offset z) {
    animationPathData.shiftedPoints[i] = z;
  }

  @action
  onAnimationCompleted() {
    showWidget = false;
  }

  @override
  List<Object> get props => [];
}
