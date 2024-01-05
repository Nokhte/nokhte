// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'gesture_cross_store.g.dart';

class GestureCrossStore = _GestureCrossStoreBase with _$GestureCrossStore;

abstract class _GestureCrossStoreBase extends Equatable with Store {
  final CrossStore cross;
  final GradientCrossNokhteStore gradientNokhte;
  final CenterCrossNokhteStore centerCrossNokhte;

  _GestureCrossStoreBase({
    required this.cross,
    required this.gradientNokhte,
    required this.centerCrossNokhte,
  });

  @action
  setHomeScreen() {
    gradientNokhte.setMovie(VibrantBlueGradientNokhteMovie.movie);
  }

  @action
  setCollaborationHomeScreen() {
    gradientNokhte.setMovie(WaterGradientNokhteMovie.movie);
    gradientNokhte.setControl(Control.mirror);
  }

  @action
  initMoveAndRegenerate(Offset endDirection) {
    centerCrossNokhte.initMoveAndRegenerate(endDirection);
  }

  @override
  List<Object> get props => [];
}
