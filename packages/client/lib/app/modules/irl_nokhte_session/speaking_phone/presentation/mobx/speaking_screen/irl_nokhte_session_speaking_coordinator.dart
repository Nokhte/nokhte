// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'irl_nokhte_session_speaking_widgets_coordinator.dart';
part 'irl_nokhte_session_speaking_coordinator.g.dart';

class IrlNokhteSessionSpeakingCoordinator = _IrlNokhteSessionSpeakingCoordinatorBase
    with _$IrlNokhteSessionSpeakingCoordinator;

abstract class _IrlNokhteSessionSpeakingCoordinatorBase extends BaseCoordinator
    with Store {
  final IrlNokhteSessionSpeakingWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final HoldDetector hold;
  final IrlNokhteSessionPresenceCoordinator presence;
  final GyroscopicCoordinator gyroscopic;
  final GetIrlNokhteSessionMetadataStore sessionMetadata;
  _IrlNokhteSessionSpeakingCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.swipe,
    required this.hold,
    required this.gyroscopic,
    required this.presence,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors(sessionMetadata.shouldAdjustToFallbackExitProtocol);
    gyroscopic.listen(NoParams());
    setBlockPhoneTiltReactor(false);
    await captureScreen(Screens.nokhteSessionSpeaking);
  }

  @observable
  bool blockPhoneTiltReactor = false;

  @action
  setBlockPhoneTiltReactor(bool newValue) => blockPhoneTiltReactor = newValue;

  initReactors(bool shouldAdjustToFallbackExitProtocol) {
    holdReactor();
    letGoReactor();
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
        if (hold.holdCount.isGreaterThan(hold.letGoCount)) {
          widgets.onLetGo();
        }
      },
    );
    presence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        setDisableAllTouchFeedback(true);
        if (hold.holdCount.isGreaterThan(hold.letGoCount)) {
          widgets.onLetGo();
        }
        widgets.onCollaboratorLeft();
      },
    );
    if (shouldAdjustToFallbackExitProtocol) {
      swipeReactor();
    } else {
      phoneTiltStateReactor();
    }
    userPhaseReactor();
    collaboratorPhaseReactor();
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.down:
            ifTouchIsNotDisabled(() async {
              await presence.updateCurrentPhase(3);
            });
          default:
            break;
        }
      });

  holdReactor() => reaction((p0) => hold.holdCount, (p0) {
        ifTouchIsNotDisabled(() {
          if (presence.getSessionMetadataStore.collaboratorIsOnline) {
            setBlockPhoneTiltReactor(true);
            widgets.onHold();
            setDisableAllTouchFeedback(true);
          }
        });
      });

  letGoReactor() => reaction((p0) => hold.letGoCount, (p0) {
        if (presence.getSessionMetadataStore.collaboratorIsOnline) {
          widgets.onLetGo();
          Timer(Seconds.get(2), () {
            setDisableAllTouchFeedback(false);
            setBlockPhoneTiltReactor(false);
          });
        }
      });

  phoneTiltStateReactor() =>
      reaction((p0) => gyroscopic.holdingState, (p0) async {
        if (!blockPhoneTiltReactor &&
            sessionMetadata.collaboratorPhase.isGreaterThanOrEqualTo(2)) {
          if (p0 == PhoneHoldingState.isPickedUp) {
            await presence.updateCurrentPhase(3);
          } else if (p0 == PhoneHoldingState.isDown) {
            await presence.updateCurrentPhase(2);
          }
        }
      });

  collaboratorPhaseReactor() => reaction(
        (p0) => sessionMetadata.collaboratorPhase,
        (p0) async {
          if (sessionMetadata.canExitTheSession) {
            await gyroscopic.dispose();
            widgets.onExit();
            setBlockPhoneTiltReactor(true);
          }
        },
      );

  userPhaseReactor() => reaction(
        (p0) => sessionMetadata.userPhase,
        (p0) async {
          if (sessionMetadata.canExitTheSession) {
            await gyroscopic.dispose();
            widgets.onExit();
            setBlockPhoneTiltReactor(true);
          }
        },
      );

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
}
