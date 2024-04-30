// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'half_screen_tint_movie.dart';
part 'half_screen_tint_store.g.dart';

class HalfScreenTintStore = _HalfScreenTintStoreBase with _$HalfScreenTintStore;

abstract class _HalfScreenTintStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _HalfScreenTintStoreBase() {
    setMovie(HalfScreenTintMovie.movie);
  }

  @observable
  Color tintcolor = Colors.black;

  @action
  setTintColor(Color newVal) => tintcolor = newVal;

  @observable
  bool shouldCoverBottom = true;

  @action
  setShouldCoverBottom(bool newVal) => shouldCoverBottom = newVal;
}
