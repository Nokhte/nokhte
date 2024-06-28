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
import 'package:nokhte_backend/tables/_real_time_disabled/company_presets/queries.dart';
part 'session_collaboration_greeter_coordinator.g.dart';

class SessionCollaborationGreeterCoordinator = _SessionCollaborationGreeterCoordinatorBase
    with _$SessionCollaborationGreeterCoordinator;

abstract class _SessionCollaborationGreeterCoordinatorBase with Store {
  final SessionCollaborationGreeterWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;

  final BaseCoordinator base;

  _SessionCollaborationGreeterCoordinatorBase({
    required this.widgets,
    required this.tap,
    required this.presence,
    required CaptureScreen captureScreen,
  })  : sessionMetadata = presence.sessionMetadataStore,
        base = BaseCoordinator(captureScreen: captureScreen);

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await base.captureScreen(SessionConstants.collaborationGreeter);
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
  }

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => base.ifTouchIsNotDisabled(() {
          widgets.onTap(
            tapPosition: tap.currentTapPosition,
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
          // Modular.to.navigate(route);
        }
      });

  deconstructor() {
    base.deconstructor();
    widgets.base.deconstructor();
  }
}
