// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_group_greeter_coordinator.g.dart';

class SessionGroupGreeterCoordinator = _SessionGroupGreeterCoordinatorBase
    with _$SessionGroupGreeterCoordinator;

abstract class _SessionGroupGreeterCoordinatorBase with Store {
  final SessionGroupGreeterWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;

  final BaseCoordinator base;

  _SessionGroupGreeterCoordinatorBase({
    required this.widgets,
    required this.tap,
    required this.presence,
    required CaptureScreen captureScreen,
  })  : sessionMetadata = presence.sessionMetadataStore,
        base = BaseCoordinator(captureScreen: captureScreen);

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
    await base.captureScreen(SessionConstants.groupGreeter);
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
    base.disposers.addAll(widgets.base.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => base.setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        base.setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        base.setDisableAllTouchFeedback(true);
      },
    ));
    base.disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        base.setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        base.setDisableAllTouchFeedback(true);
        widgets.onCollaboratorLeft();
      },
    ));
    base.disposers.add(tapReactor());
    base.disposers.add(rippleCompletionStatusReactor());
    base.disposers.add(collaboratorPhaseReactor());
    base.disposers.add(widgets.primarySmartTextIndexReactor(
      onComplete: () async => await updateCurrentPhase(),
    ));
  }

  collaboratorPhaseReactor() =>
      reaction((p0) => sessionMetadata.currentPhases, (p0) {
        if (p0.every((e) => e >= 1.0)) {
          widgets.initTransition(pathIntoSession);
        } else if (sessionMetadata.everyoneButUserPhases
                .every((e) => e >= 1.0) &&
            sessionMetadata.userPhase != 1.0) {
          widgets.setIsTheLastOneToFinish(true);
        }
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => base.ifTouchIsNotDisabled(() async {
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
            !widgets.hasTriggeredTint) {
          Modular.to.navigate(pathIntoSession);
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

  deconstructor() {
    base.deconstructor();
    widgets.base.deconstructor();
  }

  @computed
  String get pathIntoSession {
    if (sessionMetadata.numberOfCollaborators.isOdd) {
      if (sessionMetadata.userIndex == 0) {
        return SessionConstants.hybridRouter;
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
}
