// ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'gesture_cross_store.g.dart';

class GestureCrossStore = _GestureCrossStoreBase with _$GestureCrossStore;

abstract class _GestureCrossStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  final Path path = SvgAnimtionConstants.crossPath;
  final Rect bounds = SvgAnimtionConstants.crossPath.getBounds();

  @observable
  ObservableList<CircleInformation> circleInformation =
      ObservableList.of(StartingCirclePresets.homeScreen);

  @observable
  int tapCount = 0;

  @action
  incrementTapCount() => tapCount++;
}
