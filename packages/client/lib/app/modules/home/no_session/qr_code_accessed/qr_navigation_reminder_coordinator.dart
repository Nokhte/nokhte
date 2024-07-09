// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'qr_navigation_reminder_coordinator.g.dart';

class QrNavigationReminderCoordinator = _QrNavigationReminderCoordinatorBase
    with _$QrNavigationReminderCoordinator;

abstract class _QrNavigationReminderCoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  @override
  final QrNavigationReminderWidgetsCoordinator widgets;
  _QrNavigationReminderCoordinatorBase({
    required super.sessionStarters,
    required super.swipe,
    required this.widgets,
    required super.deepLinks,
    required super.captureScreen,
    required super.tap,
  }) : super(widgets: widgets);

  @override
  @action
  constructor(Offset offset) async {
    widgets.constructor(offset);
    initReactors();
    await captureScreen(HomeConstants.qrNavigationReminder);
  }

  @override
  initReactors() {
    disposers.add(widgets.beachWavesMovieStatusReactor(
      onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
      onShoreToDeepSeaComplete: onShoreToDeepSeaComplete,
      onStorageEntry: () {},
      onAnyToShoreComplete: () {
        setDisableAllTouchFeedback(false);
      },
    ));
    super.initReactors();
    disposers.add(swipeReactor(
        onSwipeUp: () {
          widgets.onSwipeUp();
        },
        onSwipeLeft: () {}));
    disposers.add(tapReactor());
    disposers.add(swipeCoordinatesReactor(onSwipeUpCordinatesChanged));
  }

  onSwipeUpCordinatesChanged(Offset offset) {
    if (widgets.primarySmartText.currentIndex.isLessThanOrEqualTo(1)) {
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
          widgets.onTap(tap.currentTapPosition);
        });
      });
}
