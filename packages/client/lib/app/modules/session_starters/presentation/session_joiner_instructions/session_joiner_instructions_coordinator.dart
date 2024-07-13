// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
part 'session_joiner_instructions_coordinator.g.dart';

class SessionJoinerInstructionsCoordinator = _SessionJoinerInstructionsCoordinatorBase
    with _$SessionJoinerInstructionsCoordinator;

abstract class _SessionJoinerInstructionsCoordinatorBase
    with Store, BaseCoordinator, Reactions {
  final SessionJoinerInstructionsWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final TapDetector tap;
  final SessionStartersLogicCoordinator logic;
  @override
  final CaptureScreen captureScreen;

  _SessionJoinerInstructionsCoordinatorBase({
    required this.widgets,
    required this.tap,
    required this.swipe,
    required this.logic,
    required this.captureScreen,
  }) {
    initBaseCoordinatorActions();
  }

  @observable
  bool isNavigatingAway = false;

  @action
  toggleIsNavigatingAway() => isNavigatingAway = !isNavigatingAway;

  @action
  constructor(Offset center) async {
    widgets.constructor(center);
    widgets.initReactors();
    initReactors();
    await captureScreen(SessionStarterConstants.sessionStarterInstructions);
  }

  swipeCoordinatesReactor() =>
      reaction((p0) => swipe.mostRecentCoordinates.last, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.initWaterWake(p0);
        });
      });

  initReactors() {
    disposers.add(swipeCoordinatesReactor());
    disposers.add(swipeReactor());
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
        widgets.setIsDisconnected(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
        widgets.setIsDisconnected(true);
      },
    ));
    disposers.add(tapReactor());
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) => onSwipe(p0));

  @action
  onSwipe(GestureDirections direction) {
    if (!isNavigatingAway) {
      switch (direction) {
        case GestureDirections.down:
          ifTouchIsNotDisabled(() {
            widgets.onSwipeDown();
          });
        case GestureDirections.left:
          ifTouchIsNotDisabled(() {
            widgets.onSwipeLeft();
          });
        default:
          break;
      }
    }
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onTap(tap.currentTapPosition);
        });
      });

  deconstructor() {
    logic.dispose();
    widgets.dispose();
    dispose();
  }
}
