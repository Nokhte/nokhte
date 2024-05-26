// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_duo_greeter_coordinator.g.dart';

class SessionDuoGreeterCoordinator = _SessionDuoGreeterCoordinatorBase
    with _$SessionDuoGreeterCoordinator;

abstract class _SessionDuoGreeterCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionDuoGreeterWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;
  final GyroscopicCoordinator gyroscopic;

  _SessionDuoGreeterCoordinatorBase({
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
    widgets.constructor();
    initReactors();
    await captureScreen(SessionConstants.duoGreeter);
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
    userPhaseReactor();
  }

  collaboratorPhaseReactor() =>
      reaction((p0) => sessionMetadata.currentPhases, (p0) {
        if (sessionMetadata.canMoveIntoInstructions &&
            widgets.touchRipple.movieStatus != MovieStatus.inProgress &&
            tap.tapCount.isGreaterThan(0)) {
          widgets.invisiblizePrimarySmartText();
          isNavigatingAway = true;
          Modular.to.navigate(pathIntoSession);
        }
      });

  userPhaseReactor() => reaction((p0) => sessionMetadata.userPhase, (p0) {
        if (sessionMetadata.userPhase == 1.0) {
          Timer(Seconds.get(10), () {
            if (!isNavigatingAway) {
              widgets.onTenSecondLapse();
            }
          });
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
            sessionMetadata.canMoveIntoInstructions) {
          if (pathIntoSession == SessionConstants.speaking) {
            widgets.initTransitionToSpeaking();
            isNavigatingAway = true;
          } else {
            isNavigatingAway = true;
            Modular.to.navigate(pathIntoSession);
          }
        }
      });

  deviceGyroscopeStatusReactor() =>
      reaction((p0) => gyroscopic.deviceHasGyroscope, (p0) async {
        if (!p0) {
          await presence.updateHasGyroscope(false);
        }
      });

  @computed
  String get pathIntoSession =>
      sessionMetadata.userIndex.isEven ? speakingPath : notesPath;

  @computed
  String get speakingPath {
    if (sessionMetadata.everyoneShouldSkipInstructions) {
      return SessionConstants.speaking;
    } else {
      if (!sessionMetadata.neighborShouldSkipInstructions) {
        return SessionConstants.speakingFullInstructions;
      } else {
        return SessionConstants.speakingHalfInstructions;
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
}
