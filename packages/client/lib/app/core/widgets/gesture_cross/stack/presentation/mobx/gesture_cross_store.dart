// ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:dartz/dartz.dart';
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
  ObservableList<CircleInformation> circleInformation = ObservableList.of(
    [
      //bottom
      CircleInformation(
        colorOrGradient: Left(Colors.white.withOpacity(.25)),
        offset: CircleOffsets.bottom,
      ),
      // center
      CircleInformation(
        colorOrGradient: Right(ColorsAndStops(
          colors: [Colors.white],
          stops: [0],
        )),
        offset: CircleOffsets.center,
      ),
      // left
      CircleInformation(
        colorOrGradient: Left(Colors.white.withOpacity(.25)),
        offset: CircleOffsets.left,
      ),
      // right
      CircleInformation(
        colorOrGradient: Left(Colors.white.withOpacity(.25)),
        offset: CircleOffsets.right,
      ),
      // top
      CircleInformation(
        colorOrGradient: Right(ColorsAndStops(
          colors: [Color(0xFF4CD7FC), Color(0xFF6AEAB9)],
          stops: [.1, .6],
        )),
        offset: CircleOffsets.top,
      ),
    ],
  );
}
