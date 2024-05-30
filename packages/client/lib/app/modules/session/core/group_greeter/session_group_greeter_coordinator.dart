// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_group_greeter_coordinator.g.dart';

class SessionGroupGreeterCoordinator = _SessionGroupGreeterCoordinatorBase
    with _$SessionGroupGreeterCoordinator;

abstract class _SessionGroupGreeterCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionGroupGreeterWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;
  final GyroscopicCoordinator gyroscopic;

  _SessionGroupGreeterCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
    required this.gyroscopic,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @observable
  Stopwatch stopwatch = Stopwatch();

  @observable
  bool isNavigatingAway = false;

  @action
  constructor() async {
    widgets.constructor(
      numberOfCollaborators: sessionMetadata.numberOfCollaborators,
      userIndex: sessionMetadata.userIndex,
    );
    initReactors();
    await captureScreen(SessionConstants.groupGreeter);
    await gyroscopic.checkIfDeviceHasGyroscope();
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

  @action
  initReactors() {
    deviceGyroscopeStatusReactor();
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
      },
    );
    presence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        setDisableAllTouchFeedback(true);
        widgets.onCollaboratorLeft();
      },
    );
    tapReactor();
    rippleCompletionStatusReactor();
    collaboratorPhaseReactor();
    widgets.primarySmartTextIndexReactor(
      initTransition: () {
        if (pathIntoSession == SessionConstants.speaking) {
          widgets.initTransitionToSpeaking();
          isNavigatingAway = true;
        } else if (pathIntoSession == SessionConstants.hybrid ||
            pathIntoSession == SessionConstants.hybridWaiting) {
          if (pathIntoSession == SessionConstants.hybridWaiting) {
            widgets.setIsGoingToHybridWaiting(true);
          }
          widgets.initTransitionToHybrid();
          isNavigatingAway = true;
        } else {
          Modular.to.navigate(pathIntoSession);
        }
      },
      onComplete: () async => await updateCurrentPhase(),
    );
  }

  collaboratorPhaseReactor() =>
      reaction((p0) => sessionMetadata.currentPhases, (p0) {
        if (p0.every((e) => e == 1.0)) {
          widgets.initTransition(pathIntoSession);
        } else if (sessionMetadata.everyoneButUserPhases
                .every((e) => e == 1.0) &&
            sessionMetadata.userPhase != 1.0) {
          widgets.setIsTheLastOneToFinish(true);
        }
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(() async {
          widgets.onTap(
            tap.currentTapPosition,
            onFinalTap: () async => await presence.updateCurrentPhase(1),
          );
        }),
      );

  rippleCompletionStatusReactor() =>
      reaction((p0) => widgets.touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            sessionMetadata.canMoveIntoInstructions &&
            pathIntoSession != SessionConstants.speaking &&
            pathIntoSession != SessionConstants.hybrid &&
            pathIntoSession != SessionConstants.hybridWaiting) {
          Modular.to.navigate(pathIntoSession);
        }
      });

  deviceGyroscopeStatusReactor() =>
      reaction((p0) => gyroscopic.deviceHasGyroscope, (p0) async {
        if (!p0) {
          await presence.updateHasGyroscope(false);
        }
      });

  updateCurrentPhase() async {
    Timer.periodic(Seconds.get(0, milli: 500), (timer) async {
      if (sessionMetadata.userPhase != 1.0) {
        await presence.updateCurrentPhase(1.0);
      } else {
        timer.cancel();
      }
    });
  }

  @computed
  String get pathIntoSession {
    if (sessionMetadata.numberOfCollaborators.isOdd) {
      if (sessionMetadata.userIndex == 0) {
        return hybridPath;
      } else if (sessionMetadata.userIndex.isOdd) {
        return notesPath;
      } else {
        return SessionConstants.speakingRouter;
      }
    } else {
      if (sessionMetadata.userIndex.isEven) {
        return SessionConstants.speakingRouter;
      } else {
        return notesPath;
      }
    }
  }

  @computed
  String get notesPath {
    if (sessionMetadata.everyoneShouldSkipInstructions) {
      return SessionConstants.notes;
    } else {
      return SessionConstants.notesWaiting;
    }
  }

  @computed
  String get hybridPath {
    if (sessionMetadata.everyoneShouldSkipInstructions) {
      return SessionConstants.hybrid;
    } else {
      if (!sessionMetadata.neighborShouldSkipInstructions) {
        return SessionConstants.hybridSpeakingInstructions;
      } else {
        return SessionConstants.hybridWaiting;
      }
    }
  }
}
