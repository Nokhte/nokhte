// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
part 'session_duo_greeter_coordinator.g.dart';

class SessionDuoGreeterCoordinator = _SessionDuoGreeterCoordinatorBase
    with _$SessionDuoGreeterCoordinator;

abstract class _SessionDuoGreeterCoordinatorBase with Store {
  final SessionDuoGreeterWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  final BaseCoordinator base;

  _SessionDuoGreeterCoordinatorBase({
    required this.widgets,
    required this.tap,
    required this.presence,
    required CaptureScreen captureScreen,
  })  : base = BaseCoordinator(captureScreen: captureScreen),
        sessionMetadata = presence.sessionMetadataStore;

  @observable
  Stopwatch stopwatch = Stopwatch();

  @observable
  bool isNavigatingAway = false;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await base.captureScreen(SessionConstants.duoGreeter);
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
    base.disposers.add(userPhaseReactor());
  }

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
        (p0) => base.ifTouchIsNotDisabled(() async {
          widgets.onTap(
            tap.currentTapPosition,
            onFinalTap: () async => await presence.updateCurrentPhase(1),
            phoneType: sessionMetadata.sessionScreenType,
          );
        }),
      );

  rippleCompletionStatusReactor() =>
      reaction((p0) => widgets.touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished && widgets.hasCompletedInstructions) {
          isNavigatingAway = true;
          widgets.route(
            isACollaborativeSession:
                sessionMetadata.presetType == PresetTypes.collaborative,
          );
        }
      });

  deconstructor() {
    base.deconstructor();
    widgets.base.deconstructor();
  }
}
