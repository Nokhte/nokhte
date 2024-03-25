// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'irl_nokhte_session_speaking_instructions_widgets_coordinator.dart';
part 'irl_nokhte_session_speaking_instructions_coordinator.g.dart';

class IrlNokhteSessionSpeakingInstructionsCoordinator = _IrlNokhteSessionSpeakingInstructionsCoordinatorBase
    with _$IrlNokhteSessionSpeakingInstructionsCoordinator;

abstract class _IrlNokhteSessionSpeakingInstructionsCoordinatorBase
    extends BaseCoordinator with Store {
  final TapDetector tap;
  final IrlNokhteSessionSpeakingInstructionsWidgetsCoordinator widgets;
  final IrlNokhteSessionPresenceCoordinator presence;
  final GetIrlNokhteSessionMetadataStore sessionMetadata;

  _IrlNokhteSessionSpeakingInstructionsCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await captureScreen(Screens.nokhteSessionSpeakingInstructions);
  }

  initReactors() {
    tapReactor();
    presence.initReactors(
      onCollaboratorJoined: () {
        widgets.setDisableTouchInput(false);
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        widgets.setDisableTouchInput(true);
        widgets.onCollaboratorLeft();
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
            widgets.mirroredText.startBothRotatingText(isResuming: true);
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
