// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'irl_nokhte_session_notes_instructions_widgets_coordinator.dart';
part 'irl_nokhte_session_notes_instructions_coordinator.g.dart';

class IrlNokhteSessionNotesInstructionsCoordinator = _IrlNokhteSessionNotesInstructionsCoordinatorBase
    with _$IrlNokhteSessionNotesInstructionsCoordinator;

abstract class _IrlNokhteSessionNotesInstructionsCoordinatorBase
    extends BaseCoordinator with Store {
  final IrlNokhteSessionNotesInstructionsWidgetsCoordinator widgets;
  final TapDetector tap;
  final IrlNokhteSessionPresenceCoordinator presence;
  final GetIrlNokhteSessionMetadataStore sessionMetadata;

  _IrlNokhteSessionNotesInstructionsCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @observable
  bool instructionModeIsUnlocked = false;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
  }

  @action
  initReactors() {
    tapReactor();
    presence.initReactors(
      onCollaboratorJoined: () {
        widgets.setDisableTouchInput(false);
      },
      onCollaboratorLeft: () {
        if (instructionModeIsUnlocked) {
          widgets.setDisableTouchInput(true);
        }
      },
    );
    collaboratorPhaseReactor();
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => widgets.setDisableTouchInput(false),
      onLongReConnected: () {
        widgets.setDisableTouchInput(false);
      },
      onDisconnected: () {
        if (instructionModeIsUnlocked) {
          widgets.setDisableTouchInput(true);
        }
      },
    );
  }

  // ok so the tap protocol is basically

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

  collaboratorPhaseReactor() => reaction(
        (p0) => sessionMetadata.collaboratorPhase,
        (p0) {
          if (sessionMetadata.canMoveIntoSecondInstructionsSet) {
            widgets.onInstructionModeUnlocked();
            // widgets.mirroredText.startBothRotatingText(isResuming: true);
          }
        },
      );

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
