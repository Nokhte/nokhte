// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'session_paywall_widgets_coordinator.dart';
part 'session_paywall_coordinator.g.dart';

class SessionPaywallCoordinator = _SessionPaywallCoordinatorBase
    with _$SessionPaywallCoordinator;

abstract class _SessionPaywallCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final TapDetector tap;
  final SessionPaywallWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final GetSessionMetadataStore sessionMetadata;
  final SwipeDetector swipe;

  _SessionPaywallCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
    required this.swipe,
    required super.getUserInfo,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await captureScreen(Screens.nokhteSessionSpeakingInstructions);
    await getUserInfo(NoParams());
  }

  initReactors() {
    tapReactor();
    swipeReactor();
    presence.initReactors(
      onCollaboratorJoined: () {
        // widgets.setDisableTouchInput(false);
        // widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        // widgets.setDisableTouchInput(true);
        // widgets.onCollaboratorLeft();
      },
    );
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        // widgets.setDisableTouchInput(false);
      },
      onDisconnected: () {
        // widgets.setDisableTouchInput(true);
      },
    );
    widgets.beachWaveMovieStatusReactor(onReturnHome: onAnimationComplete);
  }

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(
          () {
            widgets.onTap(tap.currentTapPosition);
          },
        ),
      );

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            widgets.onSwipeUp();
            Timer(Seconds.get(2), () {
              widgets.onPaymentFailure();
            });
          case GestureDirections.down:
            widgets.onSwipeDown();
          default:
            break;
        }
      });

  @action
  onInactive() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userNegative());
  }

  @action
  onResumed() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    if (sessionMetadata.everyoneIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
  }
}
