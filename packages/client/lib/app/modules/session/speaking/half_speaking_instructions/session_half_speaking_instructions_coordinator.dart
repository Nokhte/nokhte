// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_half_speaking_instructions_coordinator.g.dart';

class HalfSessionSpeakingInstructionsCoordinator = _HalfSessionSpeakingInstructionsCoordinatorBase
    with _$HalfSessionSpeakingInstructionsCoordinator;

abstract class _HalfSessionSpeakingInstructionsCoordinatorBase
    extends BaseCoordinator with Store {
  final TapDetector tap;
  final HoldDetector hold;
  final HalfSessionSpeakingInstructionsWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;
  final GyroscopicCoordinator gyroscopic;

  _HalfSessionSpeakingInstructionsCoordinatorBase({
    required super.captureScreen,
    required this.gyroscopic,
    required this.widgets,
    required this.tap,
    required this.presence,
    required this.hold,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor(
      instructionsOnTop: sessionMetadata.userShouldSkipInstructions,
    );
    gyroscopic.listen(NoParams());
    initReactors();
    await captureScreen(SessionConstants.speakingHalfInstructions);
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
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        widgets.setDisableTouchInput(false);
      },
      onDisconnected: () {
        widgets.setDisableTouchInput(true);
      },
    );
    phoneTiltStateReactor();
    holdReactor();
    letGoReactor();
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

  phoneTiltStateReactor() =>
      reaction((p0) => gyroscopic.holdingState, (p0) async {
        if (p0 == PhoneHoldingState.isPickedUp) {
          widgets.onPhonePickup();
        } else if (p0 == PhoneHoldingState.isDown) {
          widgets.onPutDown();
        }
      });

  holdReactor() => reaction(
        (p0) => hold.holdCount,
        (p0) {
          ifTouchIsNotDisabled(() {
            widgets.onHold(hold.placement);
          });
        },
      );

  letGoReactor() => reaction((p0) => hold.letGoCount, (p0) {
        widgets.onLetGo(
          onFlowFinished: () async => await gyroscopic.dispose(),
        );
        Timer(Seconds.get(2), () {
          setDisableAllTouchFeedback(false);
        });
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(
          () => widgets.onTap(tap.currentTapPosition),
        ),
      );
}
