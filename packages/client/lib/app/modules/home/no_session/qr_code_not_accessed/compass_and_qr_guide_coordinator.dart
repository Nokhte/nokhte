// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields, annotate_overrides
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'compass_and_qr_guide_coordinator.g.dart';

class CompassAndQrGuideCoordinator = _CompassAndQrGuideCoordinatorBase
    with _$CompassAndQrGuideCoordinator;

abstract class _CompassAndQrGuideCoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final UserInformationCoordinator userInformation;
  final CompassAndQrGuideWidgetsCoordinator widgets;
  _CompassAndQrGuideCoordinatorBase({
    required super.sessionStarters,
    required super.swipe,
    required this.widgets,
    required super.deepLinks,
    required super.captureScreen,
    required super.tap,
    required this.userInformation,
  }) : super(widgets: widgets);

  @override
  @action
  constructor(center) async {
    widgets.constructor(center);
    initReactors();
    await captureScreen(Screens.compassAndQrGuideHome);
  }

  @override
  initReactors() {
    super.initReactors();
    swipeReactor(
      onSwipeUp: () {
        widgets.onSwipeUp();
      },
      onSwipeRight: () {},
    );
    swipeCoordinatesReactor(onSwipeUpCordinatesChanged);
    widgets.beachWavesMovieStatusReactor(
        onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
        onShoreToDeepSeaComplete: onShoreToDeepSeaComplete,
        onStorageEntry: () {},
        onAnyToShoreComplete: () {
          setDisableAllTouchFeedback(false);
        });
    tapReactor();
  }

  onSwipeUpCordinatesChanged(Offset offset) {
    if (widgets.primarySmartText.currentIndex == 3 ||
        widgets.primarySmartText.currentIndex == 5) {
      widgets.onSwipeCoordinatesChanged(offset);
    }
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        if (isInErrorMode) {
          widgets.onErrorResolved(() {
            setIsInErrorMode(true);
          });
        }
        ifTouchIsNotDisabled(() {
          widgets.onTap(
            tap.currentTapPosition,
            onFlowCompleted: () async =>
                await userInformation.updateHasAccessedQrCode(true),
          );
        });
      });
}
