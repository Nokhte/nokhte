// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'session_notes_waiting_widgets_coordinator.dart';
part 'session_notes_waiting_coordinator.g.dart';

class SessionNotesWaitingCoordinator = _SessionNotesWaitingCoordinatorBase
    with _$SessionNotesWaitingCoordinator;

abstract class _SessionNotesWaitingCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionNotesWaitingWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;

  _SessionNotesWaitingCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.presence,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @observable
  double userPhaseAtStart = 0.0;

  @action
  constructor() async {
    userPhaseAtStart = sessionMetadata.userPhase;
    widgets.constructor(userPhaseAtStart);
    initReactors();
    await captureScreen(SessionConstants.notesWaiting);
  }

  initReactors() {
    disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        widgets.onCollaboratorLeft();
      },
    ));
    disposers.add(collaboratorPhaseReactor());
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () {},
      onLongReConnected: () {},
      onDisconnected: () {},
    ));
    disposers.add(widgets.rightSideUpIndexReactor(navigate));
  }

  @action
  navigate() => Modular.to.navigate(route);

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

  updateIfNecessary() async {
    if (sessionMetadata.evenList.every((e) => e == 2.0)) {
      await presence.updateCurrentPhase(2.0);
    }
  }

  collaboratorPhaseReactor() => reaction(
        (p0) => sessionMetadata.currentPhases,
        (p0) async {
          if (userPhaseAtStart == 1.0) {
            await updateIfNecessary();
            if (sessionMetadata.canMoveIntoSecondInstructionsSet) {
              if (shouldGoIntoNotes) {
                widgets.onReadyToTransition();
              }
            } else if (sessionMetadata.canMoveIntoSession) {
              widgets.setShouldMoveIntoSession(true);
              widgets.onReadyToTransition();
            }
          } else if (userPhaseAtStart == 2.0) {
            if (sessionMetadata.canMoveIntoSession) {
              widgets.setShouldMoveIntoSession(true);
              widgets.onReadyToTransition();
            }
          }
        },
      );

  @computed
  bool get shouldGoIntoNotes => !sessionMetadata.userShouldSkipInstructions;

  @computed
  String get route {
    if (!sessionMetadata.neighborShouldSkipInstructions &&
        !sessionMetadata.userShouldSkipInstructions) {
      return SessionConstants.notesFullInstructions;
    } else {
      return SessionConstants.notesHalfInstructions;
    }
  }
}
