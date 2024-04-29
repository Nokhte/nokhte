// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'session_hybrid_waiting_widgets_coordinator.dart';
part 'session_hybrid_waiting_coordinator.g.dart';

class SessionHybridWaitingCoordinator = _SessionHybridWaitingCoordinatorBase
    with _$SessionHybridWaitingCoordinator;

abstract class _SessionHybridWaitingCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionHybridWaitingWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final GetSessionMetadataStore sessionMetadata;

  _SessionHybridWaitingCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.presence,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @observable
  double userPhaseAtStart = 0.0;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    userPhaseAtStart = sessionMetadata.userPhase;
  }

  initReactors() {
    presence.initReactors(
      onCollaboratorJoined: () {
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        widgets.onCollaboratorLeft();
      },
    );
    collaboratorPhaseReactor();
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () {},
      onLongReConnected: () {},
      onDisconnected: () {},
    );
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

  collaboratorPhaseReactor() => reaction(
        (p0) => sessionMetadata.currentPhases,
        (p0) {
          if (userPhaseAtStart == 1.0) {
            if (sessionMetadata.canMoveIntoSecondInstructionsSet) {
              widgets.onReadyToTransition();
            }
          } else if (userPhaseAtStart == 2.0) {
            if (sessionMetadata.canMoveIntoSession) {
              widgets.onReadyToTransition();
              widgets.setShouldMoveIntoSession(true);
              //
            }
          }
        },
      );
}
