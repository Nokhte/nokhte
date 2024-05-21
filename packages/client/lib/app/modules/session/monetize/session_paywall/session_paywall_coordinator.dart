// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/active_monetization_session.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts.dart';
import 'package:nokhte/app/core/modules/in_app_purchase/in_app_purchase.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
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
  final ActiveMonetizationSessionCoordinator activeMonetizationSession;
  final CleanUpCollaborationArtifactsCoordinator cleanUpCollaborationArtifacts;

  _SessionPaywallCoordinatorBase({
    required this.cleanUpCollaborationArtifacts,
    required super.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
    required this.swipe,
    required this.iap,
    required this.activeMonetizationSession,
    required super.getUserInfo,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await iap.getSubscriptionInfo();
    await activeMonetizationSession.listenToExplanationCompletionStatus();
    await captureScreen(Screens.nokhteSessionSpeakingInstructions);
    await getUserInfo(NoParams());
  }

  initReactors() {
    tapReactor();
    swipeReactor();
    presence.initReactors(
      onCollaboratorJoined: () {},
      onCollaboratorLeft: () {},
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
    everyoneHasFinishedExplanationReactor();
  }

  everyoneHasFinishedExplanationReactor() =>
      reaction((p0) => activeMonetizationSession.everyoneHasFinishedExplanation,
          (p0) {
        if (p0) widgets.setCanSwipe(true);
      });

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
        Modular.to.navigate(SessionConstants.waitingPatron);
      });

  purchaseSuccessReactor() =>
      reaction((p0) => iap.hasPurchasedSubscription, (p0) async {
        if (p0) {
          await activeMonetizationSession.dispose();
          Modular.to.navigate(SessionConstants.waitingPatron);
        }
      });

  phaseReactor() => reaction((p0) => sessionMetadata.currentPhases, (p0) async {
        if (p0.contains(-1.0)) {
          widgets.onExit();
          await activeMonetizationSession.dispose();
        }
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(
          () {
            widgets.onTap(
              tap.currentTapPosition,
              onFinalTap: () async {
                await activeMonetizationSession.updateHasFinishedExplanation();
              },
            );
          },
        ),
      );

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) async {
        switch (p0) {
          case GestureDirections.up:
            widgets.onSwipeUp(
              () async => await iap.buySubscription(),
            );
          case GestureDirections.down:
            await cleanUpCollaborationArtifacts(NoParams());
          default:
            break;
        }
      });

  @action
  onInactive() async {}

  @action
  onResumed() async {}
}
