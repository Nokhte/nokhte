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
  final ListenToSessionMetadataStore sessionMetadata;

  _SessionHybridWaitingCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.presence,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @observable
  double userPhaseAtStart = 0.0;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    userPhaseAtStart = sessionMetadata.userPhase;
    await updateCurrentPhaseIfNecessary();
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
  }

  updateCurrentPhaseIfNecessary() async {
    if (userHasDoneSpeakingAndShouldSkipNotes) {
      await presence.updateCurrentPhase(2.0);
    }
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
          if (hasComeSpeakingInstructionsOrRootRouter) {
            if (sessionMetadata.canMoveIntoSecondInstructionsSet) {
              if (shouldGoIntoNotes ||
                  sessionMetadata.evenListMinusHybridPhone
                      .every((e) => e == 2.0)) {
                widgets.onReadyToTransition();
              }
            } else if (sessionMetadata.canMoveIntoSession) {
              widgets.setShouldMoveIntoSession(true);
              widgets.onReadyToTransition();
            }
          } else if (hasComeFromNotes) {
            if (sessionMetadata.canMoveIntoSession) {
              widgets.onReadyToTransition();
              widgets.setShouldMoveIntoSession(true);
            }
          }
        },
      );

  @computed
  bool get shouldGoIntoNotes => !sessionMetadata.neighborShouldSkipInstructions;

  @computed
  bool get hasComeSpeakingInstructionsOrRootRouter => userPhaseAtStart == 1.0;

  @computed
  bool get hasComeFromNotes => userPhaseAtStart == 2.0;

  @computed
  bool get userHasDoneSpeakingAndShouldSkipNotes =>
      userPhaseAtStart == 1.0 &&
      (sessionMetadata.userShouldSkipInstructions &&
          !sessionMetadata.neighborShouldSkipInstructions);

  @override
  deconstructor() {
    widgets.deconstructor();
    super.deconstructor();
  }
}
