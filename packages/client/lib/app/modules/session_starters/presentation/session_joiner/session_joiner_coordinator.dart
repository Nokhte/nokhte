// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
part 'session_joiner_coordinator.g.dart';

class SessionJoinerCoordinator = _SessionJoinerCoordinatorBase
    with _$SessionJoinerCoordinator;

abstract class _SessionJoinerCoordinatorBase
    with Store, BaseCoordinator, Reactions {
  final SessionJoinerWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final TapDetector tap;
  @override
  final CaptureScreen captureScreen;
  final SessionStartersLogicCoordinator logic;

  _SessionJoinerCoordinatorBase({
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
    initReactors();
    logic.listenToSessionActivation();
    await captureScreen(SessionStarterConstants.sessionJoiner);
  }

  initReactors() {
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
    disposers.add(qrCodeScannerReactor());
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) => onSwipe(p0));

  @observable
  int retryCount = 0;

  qrCodeScannerReactor() =>
      reaction((p0) => widgets.qrScanner.mostRecentScannedUID, (p0) {
        if (p0.isNotEmpty) {
          widgets.qrScanner.rotateText();
          Timer.periodic(Seconds.get(0, milli: 500), (timer) async {
            if (!logic.hasFoundNokhteSession) {
              if (retryCount < 5) {
                retryCount++;
                await logic.join(p0);
              } else {
                widgets.qrScanner.resetText();
                retryCount = 0;
                timer.cancel();
              }
            } else {
              widgets.enterSession();
              setDisableAllTouchFeedback(true);
              widgets.qrScanner.rotateText();
              timer.cancel();
            }
          });
        }
      });

  @action
  onSwipe(GestureDirections direction) {
    if (!isNavigatingAway) {
      switch (direction) {
        case GestureDirections.right:
          ifTouchIsNotDisabled(() {
            if (!logic.hasFoundNokhteSession) {
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
          // widgets.onTap(tap.currentTapPosition);
        });
      });

  deconstructor() {
    logic.dispose();
    widgets.dispose();
    dispose();
  }
}
