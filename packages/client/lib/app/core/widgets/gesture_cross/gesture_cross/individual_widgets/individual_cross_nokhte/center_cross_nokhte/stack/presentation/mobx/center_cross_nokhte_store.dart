// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'center_cross_nokhte_store.g.dart';

class CenterCrossNokhteStore = _CenterCrossNokhteStoreBase
    with _$CenterCrossNokhteStore;

abstract class _CenterCrossNokhteStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _CenterCrossNokhteStoreBase() {
    setMovie(RestingCenterCrossMovie.movie);
    toggleWidgetVisibility();
  }

  @action
  initMoveAndRegenerate(Offset endDirection) {
    setMovieStatus(MovieStatus.inProgress);
    setMovie(MoveAndRegengerateMovie.getMovie(endDirection));
    setControl(Control.playFromStart);
  }

  @override
  List<Object> get props => [];
}
