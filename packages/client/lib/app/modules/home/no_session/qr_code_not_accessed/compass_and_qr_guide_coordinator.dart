// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'compass_and_qr_guide_coordinator.g.dart';

class CompassAndQrGuideCoordinator = _CompassAndQrGuideCoordinatorBase
    with _$CompassAndQrGuideCoordinator;

abstract class _CompassAndQrGuideCoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  @override
  final CompassAndQrGuideWidgetsCoordinator widgets;
  _CompassAndQrGuideCoordinatorBase({
    required super.swipe,
    required this.widgets,
    required super.captureScreen,
    required super.tap,
  }) : super(widgets: widgets);

  @override
  @action
  constructor(center) async {
    widgets.constructor(center);
    initReactors();
    await captureScreen(HomeConstants.compassAndQrGuide);
  }

  @override
  initReactors() {
    super.initReactors();
    disposers.add(swipeReactor(
      onSwipeUp: () {
        widgets.onSwipeUp();
      },
      onSwipeLeft: () {},
    ));
    disposers.add(swipeCoordinatesReactor(onSwipeUpCordinatesChanged));
    disposers.add(tapReactor());
  }

  onSwipeUpCordinatesChanged(Offset offset) {
    if (widgets.primarySmartText.currentIndex == 3 ||
        widgets.primarySmartText.currentIndex == 5) {
      widgets.onSwipeCoordinatesChanged(offset);
    }
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onTap(tap.currentTapPosition);
        });
      });
}
