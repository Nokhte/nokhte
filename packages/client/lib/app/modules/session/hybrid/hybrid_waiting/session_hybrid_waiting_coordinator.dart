// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'session_hybrid_waiting_widgets_coordinator.dart';
part 'session_hybrid_waiting_coordinator.g.dart';

class SessionHybridWaitingCoordinator = _SessionHybridWaitingCoordinatorBase
    with _$SessionHybridWaitingCoordinator;

abstract class _SessionHybridWaitingCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionHybridWaitingWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;

  _SessionHybridWaitingCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.presence,
  }) : sessionMetadata = presence.sessionMetadataStore;

  @observable
  double userPhaseAtStart = 0.0;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    userPhaseAtStart = sessionMetadata.userPhase;
    await updateIfNecessary();
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

  updateIfNecessary() async {
    if (bothShouldSkip) {
      await presence.updateCurrentPhase(2.0);
    }
    if (sessionMetadata.canMoveIntoSession) {
      Timer(Seconds.get(2), () {
        widgets.onReadyToTransition();
        widgets.setShouldMoveIntoSession(true);
      });
    } else if (userPhaseAtStart == 1.0 &&
        sessionMetadata.hybridCanMoveIntoSecondInstructionsSet &&
        !sessionMetadata.userShouldSkipInstructions) {
      Timer(Seconds.get(2), () {
        widgets.onReadyToTransition();
      });
      // Modular.to.navigate(SessionConstants.hybridNotesInstructions);
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
          if (sessionMetadata.userPhase == 1.0 &&
              sessionMetadata.hybridCanMoveIntoSecondInstructionsSet) {
            widgets.onReadyToTransition();
          } else if (sessionMetadata.userPhase == 2.0 &&
              sessionMetadata.canMoveIntoSession) {
            widgets.onReadyToTransition();
            widgets.setShouldMoveIntoSession(true);
          }
        },
      );

  @computed
  bool get bothShouldSkip =>
      sessionMetadata.userShouldSkipInstructions &&
      sessionMetadata.neighborShouldSkipInstructions;

  @computed
  bool get shouldGoIntoNotesInstructions =>
      !sessionMetadata.neighborShouldSkipInstructions;

  @computed
  bool get hasComeSpeakingInstructionsOrRootRouter => userPhaseAtStart == 1.0;

  @computed
  bool get hasCompletedInstructions => userPhaseAtStart == 2.0;

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
