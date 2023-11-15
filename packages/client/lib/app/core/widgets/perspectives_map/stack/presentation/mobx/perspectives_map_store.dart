// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'perspectives_map_store.g.dart';

class PerspectivesMapStore = _PerspectivesMapStoreBase
    with _$PerspectivesMapStore;

abstract class _PerspectivesMapStoreBase extends Equatable with Store {
  @observable
  bool showWidget = false;

  @action
  toggleWidgetVisibility() {
    showWidget = !showWidget;
  }

  @action
  setController(Control newControl) {
    controller = newControl;
  }

  @action
  setMovie(MovieTween newMovie) => movie = newMovie;

  @observable
  MovieTween movie = PerspectivesMapColorAndVertOffsetChange.getMovie(
      startingCircleColors: List.filled(5, Colors.white),
      endingCircleColors: List.filled(5, Colors.white),
      startingVertOffsets: List.filled(5, 0),
      endingVertOffsets: List.filled(5, 0));

  @observable
  Control controller = Control.stop;

  @override
  List<Object> get props => [];
}
