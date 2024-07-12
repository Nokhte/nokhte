// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'base_home_screen_widgets_coordinator.dart';
part 'base_home_screen_coordinator.g.dart';

class BaseHomeScreenCoordinator = _BaseHomeScreenCoordinatorBase
    with _$BaseHomeScreenCoordinator;

abstract class _BaseHomeScreenCoordinatorBase
    with Store, BaseCoordinator, BaseMobxLogic, Reactions {
  final BaseHomeScreenWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final TapDetector tap;
  @override
  final CaptureScreen captureScreen;

  _BaseHomeScreenCoordinatorBase({
    required this.captureScreen,
    required this.swipe,
    required this.tap,
    required this.widgets,
  }) {
    initBaseCoordinatorActions();
    initBaseLogicActions();
  }

  @action
  constructor(Offset center) {}

  initReactors() {
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () {
        widgets.setIsDisconnected(false);
        setDisableAllTouchFeedback(false);
      },
      onLongReConnected: () {
        widgets.setIsDisconnected(false);
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
        widgets.setIsDisconnected(true);
      },
    ));
  }

  swipeReactor({
    required Function onSwipeUp,
    required Function onSwipeLeft,
  }) =>
      reaction((p0) => swipe.directionsType, (p0) {
        ifTouchIsNotDisabled(() {
          switch (p0) {
            case GestureDirections.up:
              onSwipeUp();
            case GestureDirections.left:
              onSwipeLeft();
            default:
              break;
          }
        });
      });

  swipeCoordinatesReactor(Function(Offset) onSwipeUpCoordinatesChanged) =>
      reaction((p0) => swipe.mostRecentCoordinates.last, (p0) {
        ifTouchIsNotDisabled(() {
          onSwipeUpCoordinatesChanged(p0);
        });
      });

  deconstructor() {
    dispose();
    // widgets.dispose();
  }
}
