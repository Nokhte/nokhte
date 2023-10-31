// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'perspectives_map_store.g.dart';

class PerspectivesMapStore = _PerspectivesMapStoreBase
    with _$PerspectivesMapStore;

abstract class _PerspectivesMapStoreBase extends Equatable with Store {
  @observable
  bool wantToFadeOut = true;

  @action
  setFadeOut(bool newFadeStatus) {
    wantToFadeOut = newFadeStatus;
  }

  @observable
  bool showWidget = true;

  @action
  setController(Control newControl) {
    controller = newControl;
  }

  @observable
  MovieTween movie = PerspectivesMapColorAndVertOffsetChange.getMovie(
      startingCircleColors: List.filled(5, Colors.white),
      endingCircleColors: List.filled(5, Colors.white),
      startingVertOffsets: List.filled(5, 0),
      endingVertOffsets: List.filled(5, 0));

  // @action
  // setPillMovie(MovieTween newMovie) {
  //   movie = newMovie;
  // }

  @observable
  Control controller = Control.stop;

  @action
  onAnimationCompleted() {
    if (wantToFadeOut) showWidget = false;
  }

  @override
  List<Object> get props => [];
}
