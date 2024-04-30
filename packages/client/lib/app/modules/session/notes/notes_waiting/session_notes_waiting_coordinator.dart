// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'session_notes_waiting_widgets_coordinator.dart';
part 'session_notes_waiting_coordinator.g.dart';

class SessionNotesWaitingCoordinator = _SessionNotesWaitingCoordinatorBase
    with _$SessionNotesWaitingCoordinator;

abstract class _SessionNotesWaitingCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionNotesWaitingWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final GetSessionMetadataStore sessionMetadata;

  _SessionNotesWaitingCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.presence,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @observable
  double userPhaseAtStart = 0.0;

  @action
  constructor() async {
    userPhaseAtStart = sessionMetadata.userPhase;
    widgets.constructor(userPhaseAtStart);
    initReactors();
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
          if (sessionMetadata.userPhase == 1.0) {
            if (sessionMetadata.canMoveIntoSecondInstructionsSet) {
              widgets.onReadyToTransition();
            }
          } else if (sessionMetadata.userPhase == 2.0) {
            if (sessionMetadata.canMoveIntoSession) {
              widgets.onReadyToTransition();
              widgets.setShouldMoveIntoSession(true);
            }
          }
        },
      );
}
