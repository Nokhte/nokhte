// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'irl_nokhte_session_speaking_instructions_screen_widgets_coordinator.dart';
part 'irl_nokhte_session_speaking_instructions_screen_coordinator.g.dart';

class IrlNokhteSessionSpeakingInstructionsScreenCoordinator = _IrlNokhteSessionSpeakingInstructionsScreenCoordinatorBase
    with _$IrlNokhteSessionSpeakingInstructionsScreenCoordinator;

abstract class _IrlNokhteSessionSpeakingInstructionsScreenCoordinatorBase
    extends BaseCoordinator with Store {
  final TapDetector tap;
  final IrlNokhteSessionSpeakingInstructionsScreenWidgetsCoordinator widgets;
  final IrlNokhteSessionPresenceCoordinator presence;
  final GetIrlNokhteSessionMetadataStore sessionMetadata;

  _IrlNokhteSessionSpeakingInstructionsScreenCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @action
  constructor() {
    widgets.constructor();
    initReactors();
  }

  initReactors() {
    tapReactor();
    presence.initReactors(
      onCollaboratorJoined: () {
        widgets.setDisableTouchInput(false);
      },
      onCollaboratorLeft: () {
        widgets.setDisableTouchInput(true);
      },
    );
    collaboratorPhaseReactor();
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        widgets.setDisableTouchInput(false);
      },
      onDisconnected: () {
        widgets.setDisableTouchInput(true);
      },
    );
  }

  @action
  onInactive() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userNegative());
    // await presence.updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
  }

  @action
  onResumed() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    if (sessionMetadata.collaboratorIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
  }

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(
          () async {
            widgets.onTap(
              tap.currentTapPosition,
              onFlowFinished: () async => await updateCurrentPhase(),
            );
          },
        ),
      );

  collaboratorPhaseReactor() => reaction(
        (p0) => sessionMetadata.collaboratorPhase,
        (p0) {
          if (sessionMetadata.canMoveIntoSession) {
            // Modular.to.navigate("/irl_nokhte_session/speaking_screen")
          }
        },
      );

  updateCurrentPhase() async {
    Timer.periodic(Seconds.get(0, milli: 500), (timer) async {
      if (presence.getSessionMetadataStore.userPhase != 2.0) {
        await presence.updateCurrentPhase(2.0);
      } else {
        timer.cancel();
      }
    });
  }
}
