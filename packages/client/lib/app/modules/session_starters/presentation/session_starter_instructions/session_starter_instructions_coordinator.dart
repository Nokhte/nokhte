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
part 'session_starter_instructions_coordinator.g.dart';

class SessionStarterInstructionsCoordinator = _SessionStarterInstructionsCoordinatorBase
    with _$SessionStarterInstructionsCoordinator;

abstract class _SessionStarterInstructionsCoordinatorBase
    with Store, BaseCoordinator, Reactions {
  final SessionStarterInstructionsWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final TapDetector tap;
  final GetUserInfoStore getUserInfo;
  @override
  final CaptureScreen captureScreen;

  _SessionStarterInstructionsCoordinatorBase({
    required this.widgets,
    required this.tap,
    required this.swipe,
    required this.getUserInfo,
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
    disposers.add(swipeReactor());
    disposers.add(userInfoReactor());
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
          widgets.onUserInfoLoaded(getUserInfo.hasAccessedQrCodeScanner);
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
        case GestureDirections.right:
          ifTouchIsNotDisabled(() {
            widgets.onSwipeRight();
          });
        case GestureDirections.left:
          ifTouchIsNotDisabled(() {
            if (getUserInfo.hasAccessedQrCodeScanner) {
              widgets.onSwipeLeft();
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
    widgets.dispose();
    dispose();
  }
}
