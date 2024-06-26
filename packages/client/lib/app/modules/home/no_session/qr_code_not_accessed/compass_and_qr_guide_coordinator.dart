// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields, annotate_overrides
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'compass_and_qr_guide_coordinator.g.dart';

class CompassAndQrGuideCoordinator = _CompassAndQrGuideCoordinatorBase
    with _$CompassAndQrGuideCoordinator;

abstract class _CompassAndQrGuideCoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final CompassAndQrGuideWidgetsCoordinator widgets;
  _CompassAndQrGuideCoordinatorBase({
    required super.sessionStarters,
    required super.swipe,
    required this.widgets,
    required super.deepLinks,
    required super.captureScreen,
    required super.tap,
  }) : super(widgets: widgets);

  @override
  @action
  constructor(center) async {
    widgets.constructor(center);
    initReactors();
    await base.captureScreen(HomeConstants.compassAndQrGuide);
  }

  @override
  initReactors() {
    super.initReactors();
    base.disposers.add(swipeReactor(
      onSwipeUp: () {
        widgets.onSwipeUp();
      },
      onSwipeRight: () {},
    ));
    base.disposers.add(swipeCoordinatesReactor(onSwipeUpCordinatesChanged));
    base.disposers.add(widgets.beachWavesMovieStatusReactor(
        onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
        onShoreToDeepSeaComplete: onShoreToDeepSeaComplete,
        onStorageEntry: () {},
        onAnyToShoreComplete: () {
          base.setDisableAllTouchFeedback(false);
        }));
    base.disposers.add(tapReactor());
  }

  onSwipeUpCordinatesChanged(Offset offset) {
    if (widgets.primarySmartText.currentIndex == 3 ||
        widgets.primarySmartText.currentIndex == 5) {
      widgets.onSwipeCoordinatesChanged(offset);
    }
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        if (base.isInErrorMode) {
          widgets.onErrorResolved(() {
            base.setIsInErrorMode(true);
          });
        }
        base.ifTouchIsNotDisabled(() {
          widgets.onTap(tap.currentTapPosition);
        });
      });
}
