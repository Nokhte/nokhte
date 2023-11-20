// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'perspectives_map_store.g.dart';

class PerspectivesMapStore = _PerspectivesMapStoreBase
    with _$PerspectivesMapStore;

abstract class _PerspectivesMapStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _PerspectivesMapStoreBase() {
    movie = PerspectivesMapColorAndVertOffsetChange.getMovie(
        startingCircleColors: List.filled(5, Colors.white),
        endingCircleColors: List.filled(5, Colors.white),
        startingVertOffsets: List.filled(5, 0),
        endingVertOffsets: List.filled(5, 0));
    showWidget = false;
  }
}
