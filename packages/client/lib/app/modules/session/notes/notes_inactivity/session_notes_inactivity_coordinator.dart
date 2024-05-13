// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_notes_inactivity_coordinator.g.dart';

class SessionNotesInactivityCoordinator = _SessionNotesInactivityCoordinatorBase
    with _$SessionNotesInactivityCoordinator;

abstract class _SessionNotesInactivityCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionNotesInactivityWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;
  final TapDetector tap;

  _SessionNotesInactivityCoordinatorBase({
    required this.widgets,
    required super.captureScreen,
    required this.tap,
    required this.presence,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors(sessionMetadata.shouldAdjustToFallbackExitProtocol);
  }

  initReactors(bool shouldAdjustToFallbackExitProtocol) {
    presence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined(() {});
      },
      onCollaboratorLeft: () {
        setDisableAllTouchFeedback(true);
        widgets.onCollaboratorLeft();
      },
    );
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () => setDisableAllTouchFeedback(false),
      onDisconnected: () => setDisableAllTouchFeedback(true),
    );
    tapReactor();
    widgets.initBorderGlowReactors(
      onGlowDown: () {
        Modular.to.navigate(SessionConstants.notes);
      },
    );
  }

  @action
  onInactive() async => await presence
      .updateOnlineStatus(UpdatePresencePropertyParams.userNegative());

  @action
  onResumed() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    if (sessionMetadata.everyoneIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
  }

  tapReactor() => reaction((p0) => tap.currentTapPosition, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onTap(p0);
        });
      });
}
