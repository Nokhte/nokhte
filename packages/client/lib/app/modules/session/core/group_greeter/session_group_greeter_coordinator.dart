// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
part 'session_group_greeter_coordinator.g.dart';

class SessionGroupGreeterCoordinator = _SessionGroupGreeterCoordinatorBase
    with _$SessionGroupGreeterCoordinator;

abstract class _SessionGroupGreeterCoordinatorBase
    with Store, ExpBaseCoordinator, SmartTextPaddingAdjuster {
  final SessionGroupGreeterWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  @override
  final CaptureScreen captureScreen;

  _SessionGroupGreeterCoordinatorBase({
    required this.widgets,
    required this.tap,
    required this.presence,
    required this.captureScreen,
  }) : sessionMetadata = presence.sessionMetadataStore {
    initBaseCoordinatorActions();
    initSmartTextActions();
  }

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
    disposers.addAll(widgets.base.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
      },
    ));
    disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        setDisableAllTouchFeedback(true);
        widgets.onCollaboratorLeft();
      },
    ));
    disposers.add(tapReactor());
    disposers.add(rippleCompletionStatusReactor());
  }

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(() async {
          widgets.onTap(
            tap.currentTapPosition,
            onFinalTap: () async => await presence.updateCurrentPhase(1),
            phoneType: sessionMetadata.sessionScreenType,
          );
        }),
      );

  rippleCompletionStatusReactor() =>
      reaction((p0) => widgets.touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          widgets.route(
            isACollaborativeSession:
                sessionMetadata.presetType == PresetTypes.collaborative,
          );
        }
      });

  deconstructor() {
    dispose();
    widgets.base.deconstructor();
  }
}
