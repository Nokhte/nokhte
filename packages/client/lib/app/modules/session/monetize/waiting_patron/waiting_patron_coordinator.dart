// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'waiting_patron_widgets_coordinator.dart';
part 'waiting_patron_coordinator.g.dart';

class WaitingPatronCoordinator = _WaitingPatronCoordinatorBase
    with _$WaitingPatronCoordinator;

abstract class _WaitingPatronCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final TapDetector tap;
  final WaitingPatronWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;
  final SwipeDetector swipe;

  _WaitingPatronCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
    required this.swipe,
    required super.getUserInfo,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await captureScreen(Screens.nokhteSessionSpeakingInstructions);
    await getUserInfo(NoParams());
  }

  initReactors() {
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