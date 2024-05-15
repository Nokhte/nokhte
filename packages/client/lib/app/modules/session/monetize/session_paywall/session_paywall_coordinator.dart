// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/in_app_purchase/in_app_purchase.dart';
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
  final ListenToSessionMetadataStore sessionMetadata;
  final SwipeDetector swipe;
  final InAppPurchaseCoordinator iap;

  _SessionPaywallCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
    required this.swipe,
    required this.iap,
    required super.getUserInfo,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    // await iap.getSubscriptionInfo();
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
        widgets.setDisableTouchInput(false);
      },
      onDisconnected: () {
        widgets.setDisableTouchInput(true);
      },
    );
    widgets.beachWaveMovieStatusReactor(onReturnHome: onAnimationComplete);
    subscriptionInfoReactor();
    purchaseSuccessReactor();
    purchaseErrorReactor();
    phaseReactor();
    validSessionReactor();
  }

  subscriptionInfoReactor() => reaction((p0) => iap.skuProductEntity, (p0) {
        widgets.onProductInfoReceived(p0);
      });

  purchaseErrorReactor() => reaction((p0) => iap.errorMessage, (p0) {
        if (p0 == FailureConstants.cancelledPurchaseFailureMsg) {
          widgets.onPaymentFailure();
          iap.setErrorMessage('');
        }
      });

  validSessionReactor() =>
      reaction((p0) => sessionMetadata.isAValidSession, (p0) {
        // init transition back to session
      });

  purchaseSuccessReactor() =>
      reaction((p0) => iap.hasPurchasedSubscription, (p0) {
        if (p0) {
          // you want conditional logic, if it's a valid session
          // initiate the transition to back to the session
          // if there are others, then initiate an intermediate screen
          // you can either route to waiting patron or do something else
        }
      });

  phaseReactor() => reaction((p0) => sessionMetadata.currentPhases, (p0) {
        if (p0.contains(-1)) {
          widgets.onSwipeDown();
        }
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(
          () {
            widgets.onTap(tap.currentTapPosition);
          },
        ),
      );

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) async {
        switch (p0) {
          case GestureDirections.up:
            widgets.onSwipeUp();
            await iap.buySubscription();
          case GestureDirections.down:
            // await presence.completeTheSession();
            widgets.onSwipeDown();
          default:
            break;
        }
      });

  @action
  onInactive() async {
    // await presence
    //     .updateOnlineStatus(UpdatePresencePropertyParams.userNegative());
  }

  @action
  onResumed() async {
    //   await presence
    //       .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    //   if (sessionMetadata.everyoneIsOnline) {
    //     presence.incidentsOverlayStore.onCollaboratorJoined();
    //   }
  }
}
