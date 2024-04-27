// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/mobx/gyroscopic_coordinator.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_group_greeter_coordinator.g.dart';

class SessionGroupGreeterCoordinator = _SessionGroupGreeterCoordinatorBase
    with _$SessionGroupGreeterCoordinator;

abstract class _SessionGroupGreeterCoordinatorBase extends BaseCoordinator
    with Store {
  final DecidePhoneRole decidePhoneRoleLogic;
  final SessionGroupGreeterWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final GetSessionMetadataStore sessionMetadata;
  final GyroscopicCoordinator gyroscopic;

  _SessionGroupGreeterCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.decidePhoneRoleLogic,
    required this.tap,
    required this.presence,
    required this.gyroscopic,
  }) : sessionMetadata = presence.getSessionMetadataStore;

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
    await captureScreen(Screens.nokhteSessionGroupGreeter);
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
    if (presence.getSessionMetadataStore.everyoneIsOnline) {
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
        Modular.to.navigate(pathIntoSession);
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
            presence.getSessionMetadataStore.canMoveIntoInstructions) {
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
      if (presence.getSessionMetadataStore.userPhase != 1.0) {
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
        return '/session/hybrid_instructions';
      } else if (sessionMetadata.userIndex.isOdd) {
        return '/session/speaking_instructions';
      } else {
        return '/session/notes_instructions';
      }
    } else {
      if (sessionMetadata.userIndex.isEven) {
        return '/session/speaking_instructions';
      } else {
        return '/session/notes_instructions';
      }
    }
  }
}
