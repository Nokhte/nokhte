// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'qr_navigation_reminder_coordinator.g.dart';

class QrNavigationReminderCoordinator = _QrNavigationReminderCoordinatorBase
    with _$QrNavigationReminderCoordinator;

abstract class _QrNavigationReminderCoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  @override
  final QrNavigationReminderWidgetsCoordinator widgets;
  _QrNavigationReminderCoordinatorBase({
    required super.swipe,
    required this.widgets,
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
    super.initReactors();
    disposers.add(swipeReactor(
        onSwipeUp: () {
          widgets.onSwipeUp();
        },
        onSwipeLeft: () {}));
    disposers.add(tapReactor());
    disposers.add(swipeCoordinatesReactor(widgets.initWaterWake));
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onTap(tap.currentTapPosition);
        });
      });
}
