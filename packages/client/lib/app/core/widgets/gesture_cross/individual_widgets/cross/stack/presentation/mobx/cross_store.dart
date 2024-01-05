// ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'cross_store.g.dart';

class CrossStore = _CrossStoreBase with _$CrossStore;

abstract class _CrossStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _CrossStoreBase() {
    toggleWidgetVisibility();
    setMovie(CrossExpansionAndContractionMovie.movie);
  }

  final Path path = SvgAnimtionConstants.crossPath;
  final Rect bounds = SvgAnimtionConstants.crossPath.getBounds();

  @observable
  ObservableList<CircleInformation> circleInformation =
      ObservableList.of(StartingCirclePresets.homeScreen);
}
