// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_exit_coordinator.g.dart';

class SessionExitCoordinator = _SessionExitCoordinatorBase
    with _$SessionExitCoordinator;

abstract class _SessionExitCoordinatorBase with Store, HomeScreenRouter {
  final SessionExitWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  final CleanUpCollaborationArtifactsCoordinator cleanUpCollaborationArtifacts;
  final CaptureNokhteSessionEnd captureEnd;
  final BaseCoordinator base;
  final GetUserInfoStore getUserInfo;

  _SessionExitCoordinatorBase({
    required CaptureScreen captureScreen,
    required this.widgets,
    required this.swipe,
    required this.captureEnd,
    required this.presence,
    required this.cleanUpCollaborationArtifacts,
    required this.getUserInfo,
  })  : base = BaseCoordinator(captureScreen: captureScreen),
        sessionMetadata = presence.sessionMetadataStore;

  @observable
  bool showCollaboratorIncidents = true;

  @observable
  bool phaseHasBeenSet = false;

  @action
  setShowCollaboratorIncidents(bool newVal) =>
      showCollaboratorIncidents = newVal;

  @action
  constructor() async {
    phaseHasBeenSet = false;
    widgets.constructor();
    initReactors();
    await presence.updateCurrentPhase(4.0);
    await base.captureScreen(SessionConstants.exit);
  }

  @observable
  bool isGoingHome = false;

  @action
  setIsGoingHome(bool newVal) => isGoingHome = newVal;

  @observable
  bool blockUserPhaseReactor = false;

  @action
  setBlockUserPhaseReactor(bool newVal) => blockUserPhaseReactor = newVal;

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
    base.disposers.add(widgets.beachWavesMovieStatusReactor(
        onToHomeComplete: onAnimationComplete,
        onReturnToTalkingComplete: () {
          if (phoneRole == SessionScreenTypes.speaking) {
            Modular.to.navigate(SessionConstants.speaking);
          }
        },
        onReturnToHybridComplete: () {
          Modular.to.navigate(SessionConstants.groupHybrid);
        }));
    base.disposers.add(swipeReactor());
    base.disposers.add(userPhaseReactor());
    base.disposers.add(
      widgets.sessionExitStatusCompletionReactor(
        onInitialized: () => base.disposers.add(numberOfAffirmativeReactor()),
        onReadyToGoHome: () async => await onReturnHome(),
      ),
    );
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.down:
            base.ifTouchIsNotDisabled(() async {
              widgets.onReadyToGoBack(phoneRole);
              base.setDisableAllTouchFeedback(true);
            });
          default:
            break;
        }
      });

  @action
  onReturnHome() async {
    showCollaboratorIncidents = false;
    presence.dispose();
    if (sessionMetadata.userIndex == 0) {
      await presence.completeTheSession();
      await captureEnd(NoParams());
    }
    Timer(Seconds.get(1), () async {
      await getUserInfo(NoParams());
    });
    widgets.initHomeTransition();
  }

  numberOfAffirmativeReactor() =>
      reaction((p0) => sessionMetadata.numberOfAffirmative, (p0) {
        if (!blockUserPhaseReactor) {
          if (p0 == sessionMetadata.numberOfCollaborators) {
            setBlockUserPhaseReactor(true);
            setShowCollaboratorIncidents(false);
          }
          widgets.onNumOfAffirmativeChanged(
            totalNumberOfCollaborators: sessionMetadata.numberOfCollaborators,
            totalAffirmative: p0,
          );
        }
      });

  userPhaseReactor() => reaction((p0) => sessionMetadata.userPhase, (p0) async {
        if (p0 == 4.0) {
          if (sessionMetadata.numberOfAffirmative ==
              sessionMetadata.numberOfCollaborators) {
            await onReturnHome();
          } else {
            widgets.initStartingMovie(
              totalAffirmative: sessionMetadata.numberOfAffirmative,
              totalNumberOfCollaborators: sessionMetadata.numberOfCollaborators,
            );
          }
        } else if (p0 == -1.0) {
          setShowCollaboratorIncidents(false);
          widgets.onNumOfAffirmativeChanged(
            totalNumberOfCollaborators: sessionMetadata.numberOfAffirmative,
            totalAffirmative: sessionMetadata.numberOfAffirmative,
          );
          //
        }
      });

  @computed
  SessionScreenTypes get phoneRole => sessionMetadata.sessionScreenType;

  deconstructor() {
    widgets.base.deconstructor();
    base.deconstructor();
  }
}
