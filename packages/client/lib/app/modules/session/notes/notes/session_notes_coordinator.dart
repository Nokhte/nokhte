// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_notes_coordinator.g.dart';

class SessionNotesCoordinator = _SessionNotesCoordinatorBase
    with _$SessionNotesCoordinator;

abstract class _SessionNotesCoordinatorBase extends BaseCoordinator with Store {
  final SessionNotesWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;
  final SwipeDetector swipe;
  final TapDetector tap;
  final GyroscopicCoordinator gyroscopic;

  _SessionNotesCoordinatorBase({
    required this.widgets,
    required super.captureScreen,
    required this.tap,
    required this.presence,
    required this.swipe,
    required this.gyroscopic,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors(sessionMetadata.shouldAdjustToFallbackExitProtocol);
    gyroscopic.listen(NoParams());
    setBlockPhoneTiltReactor(false);
    await presence.updateCurrentPhase(2.0);
    await captureScreen(SessionConstants.notes);
  }

  @observable
  bool blockPhoneTiltReactor = false;

  @action
  setBlockPhoneTiltReactor(bool newValue) => blockPhoneTiltReactor = newValue;

  initReactors(bool shouldAdjustToFallbackExitProtocol) {
    disposers.add(swipeReactor());
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
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () => setDisableAllTouchFeedback(false),
      onDisconnected: () => setDisableAllTouchFeedback(true),
    ));
    if (!shouldAdjustToFallbackExitProtocol) {
      disposers.add(phoneTiltStateReactor());
    }
    disposers.add(userPhaseReactor());
    disposers.add(touchFeedbackStatusReactor());
    disposers.add(collaboratorPhaseReactor());
  }

  @action
  onGlowInitiated() async {
    await presence.updateCurrentPhase(2);
    setBlockPhoneTiltReactor(true);
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

  touchFeedbackStatusReactor() =>
      reaction((p0) => disableAllTouchFeedback, (p0) {
        if (p0) {
          widgets.textEditor.setIsReadOnly(true);
        } else {
          widgets.textEditor.setIsReadOnly(false);
        }
      });

  phoneTiltStateReactor() =>
      reaction((p0) => gyroscopic.holdingState, (p0) async {
        if (!blockPhoneTiltReactor) {
          if (p0 == PhoneHoldingState.isPickedUp) {
            await presence.updateCurrentPhase(3);
          } else if (p0 == PhoneHoldingState.isDown) {
            await presence.updateCurrentPhase(2);
          }
        }
      });

  collaboratorPhaseReactor() => reaction(
        (p0) => sessionMetadata.currentPhases,
        (p0) async {
          if (sessionMetadata.canExitTheSession) {
            if (widgets.textEditor.controller.text.isNotEmpty) {
              await onSwipeUp(widgets.textEditor.controller.text);
            }
            await gyroscopic.dispose();
            setBlockPhoneTiltReactor(true);
            widgets.onExit();
          }
        },
      );

  userPhaseReactor() => reaction(
        (p0) => sessionMetadata.userPhase,
        (p0) async {
          if (sessionMetadata.canExitTheSession) {
            if (widgets.textEditor.controller.text.isNotEmpty) {
              await onSwipeUp(widgets.textEditor.controller.text);
            }
            setBlockPhoneTiltReactor(true);
            await gyroscopic.dispose();
            widgets.onExit();
          }
        },
      );

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            ifTouchIsNotDisabled(() {
              widgets.onSwipeUp(onSwipeUp);
            });
          case GestureDirections.down:
            ifTouchIsNotDisabled(() async {
              if (sessionMetadata.shouldAdjustToFallbackExitProtocol) {
                await presence.updateCurrentPhase(3);
              }
            });
          default:
            break;
        }
      });

  @action
  onSwipeUp(String param) async => await presence.addContent(param);
}
