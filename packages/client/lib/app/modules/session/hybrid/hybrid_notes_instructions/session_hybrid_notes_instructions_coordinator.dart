// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_hybrid_notes_instructions_coordinator.g.dart';

class SessionHybridNotesInstructionsCoordinator = _SessionHybridNotesInstructionsCoordinatorBase
    with _$SessionHybridNotesInstructionsCoordinator;

abstract class _SessionHybridNotesInstructionsCoordinatorBase
    extends BaseCoordinator with Store {
  final SessionHybridNotesInstructionsWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;

  _SessionHybridNotesInstructionsCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @observable
  bool instructionModeIsUnlocked = false;

  @action
  constructor() async {
    widgets.constructor(sessionMetadata.shouldAdjustToFallbackExitProtocol);
    initReactors();
    await captureScreen(SessionConstants.hybridNotesInstructions);
  }

  @action
  initReactors() {
    disposers.add(tapReactor());
    disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        if (instructionModeIsUnlocked) {
          widgets.setDisableTouchInput(false);
        }
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        widgets.onCollaboratorLeft();
        if (instructionModeIsUnlocked) {
          widgets.setDisableTouchInput(true);
        }
      },
    ));
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => widgets.setDisableTouchInput(false),
      onLongReConnected: () {
        widgets.setDisableTouchInput(false);
      },
      onDisconnected: () {
        if (instructionModeIsUnlocked) {
          widgets.setDisableTouchInput(true);
        }
      },
    ));
    disposers.add(rippleCompletionStatusReactor());
  }

  rippleCompletionStatusReactor() =>
      reaction((p0) => widgets.touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished && widgets.hasCompletedInstructions) {
          // Modular.to.navigate(SessionConstants.notes);
        }
      });

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
      if (sessionMetadata.userPhase != 2.0) {
        await presence.updateCurrentPhase(2.0);
      } else {
        Timer(
          Seconds.get(2),
          () {
            if (sessionMetadata.canMoveIntoSession) {
              Modular.to.navigate(SessionConstants.hybrid);
            } else {
              Modular.to.navigate(SessionConstants.hybridWaiting);
            }
          },
        );
        timer.cancel();
      }
    });
  }
}
