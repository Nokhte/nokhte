// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
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
  final GetUserInfoStore getUserInfo;
  @override
  final CaptureScreen captureScreen;

  _SessionJoinerInstructionsCoordinatorBase({
    required this.widgets,
    required this.tap,
    required this.swipe,
    required this.getUserInfo,
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
    await getUserInfo(NoParams());
    await captureScreen(SessionStarterConstants.sessionStarterInstructions);
  }

  initReactors() {
    disposers.add(swipeCoordinatesReactor());
    disposers.add(userInfoReactor());
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

  swipeCoordinatesReactor() =>
      reaction((p0) => swipe.mostRecentCoordinates.last, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.initWaterWake(p0);
        });
      });

  userInfoReactor() => reaction((p0) => getUserInfo.state, (p0) {
        if (p0 == StoreState.loaded) {
          widgets.onUserInfoLoaded(
            getUserInfo.hasAccessedQrCode,
            getUserInfo.userUID,
          );
        }
      });

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
        case GestureDirections.right:
          ifTouchIsNotDisabled(() {
            if (getUserInfo.hasAccessedQrCode) {
              widgets.onSwipeRight();
            }
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
