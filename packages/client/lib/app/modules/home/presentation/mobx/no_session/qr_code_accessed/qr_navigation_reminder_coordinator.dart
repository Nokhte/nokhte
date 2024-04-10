// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields, annotate_overrides
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
part 'qr_navigation_reminder_coordinator.g.dart';

class QrNavigationReminderCoordinator = _QrNavigationReminderCoordinatorBase
    with _$QrNavigationReminderCoordinator;

abstract class _QrNavigationReminderCoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final QrNavigationReminderWidgetsCoordinator widgets;
  _QrNavigationReminderCoordinatorBase({
    required super.collaborationLogic,
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
    await captureScreen(Screens.qrNavigationReminderHome);
  }

  @override
  initReactors() {
    widgets.beachWavesMovieStatusReactor(
      onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
      onShoreToVibrantBlueComplete: onShoreToVibrantBlueComplete,
      onVirginStorageEntry: () {},
      onSubsequentStorageEntry: () {},
      onAnyToShoreComplete: () {
        setDisableAllTouchFeedback(false);
      },
    );
    super.initReactors();
    swipeReactor(
        onSwipeUp: () {
          widgets.onSwipeUp();
        },
        onSwipeRight: () {});
    tapReactor();
    swipeCoordinatesReactor(onSwipeUpCordinatesChanged);
  }

  onSwipeUpCordinatesChanged(Offset offset) {
    if (widgets.primarySmartText.currentIndex.isLessThanOrEqualTo(1)) {
      widgets.onSwipeCoordinatesChanged(offset);
    }
  }

  tapReactor() => reaction((p0) => tap.currentTapPosition, (p0) {
        if (isInErrorMode) {
          widgets.onErrorResolved(() {
            setIsInErrorMode(true);
          });
        }
        ifTouchIsNotDisabled(() {
          widgets.onTap(p0);
        });
      });
}
