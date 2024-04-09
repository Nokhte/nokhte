// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'irl_nokhte_session_notes_inactivity_widgets_coordinator.dart';
part 'irl_nokhte_session_notes_inactivity_coordinator.g.dart';

class IrlNokhteSessionNotesInactivityCoordinator = _IrlNokhteSessionNotesInactivityCoordinatorBase
    with _$IrlNokhteSessionNotesInactivityCoordinator;

abstract class _IrlNokhteSessionNotesInactivityCoordinatorBase
    extends BaseCoordinator with Store {
  final IrlNokhteSessionNotesInactivityWidgetsCoordinator widgets;
  final IrlNokhteSessionPresenceCoordinator presence;
  final GetIrlNokhteSessionMetadataStore sessionMetadata;
  final TapDetector tap;

  _IrlNokhteSessionNotesInactivityCoordinatorBase({
    required this.widgets,
    required super.captureScreen,
    required this.tap,
    required this.presence,
  }) : sessionMetadata = presence.getSessionMetadataStore;

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
        Modular.to.navigate("/irl_nokhte_session/notes");
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
    if (sessionMetadata.collaboratorIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
  }

  tapReactor() => reaction((p0) => tap.currentTapPosition, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onTap(p0);
        });
      });
}
