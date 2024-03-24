// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';
import 'package:nokhte/app/core/modules/posthog/constants/screens.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'irl_nokhte_session_notes_widgets_coordinator.dart';
part 'irl_nokhte_session_notes_coordinator.g.dart';

class IrlNokhteSessionNotesCoordinator = _IrlNokhteSessionNotesCoordinatorBase
    with _$IrlNokhteSessionNotesCoordinator;

abstract class _IrlNokhteSessionNotesCoordinatorBase extends BaseCoordinator
    with Store {
  final IrlNokhteSessionNotesWidgetsCoordinator widgets;
  final IrlNokhteSessionPresenceCoordinator presence;
  final GetIrlNokhteSessionMetadataStore sessionMetadata;
  final SwipeDetector swipe;
  final GyroscopicCoordinator gyroscopic;

  _IrlNokhteSessionNotesCoordinatorBase({
    required this.widgets,
    required super.captureScreen,
    required this.presence,
    required this.swipe,
    required this.gyroscopic,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors(sessionMetadata.shouldAdjustToFallbackExitProtocol);
    gyroscopic.listen(NoParams());
    setBlockPhoneTiltReactor(false);
    await presence.updateCurrentPhase(2.0);
    await captureScreen(Screens.nokhteSessionNotes);
  }

  @observable
  bool blockPhoneTiltReactor = false;

  @action
  setBlockPhoneTiltReactor(bool newValue) => blockPhoneTiltReactor = newValue;

  initReactors(bool shouldAdjustToFallbackExitProtocol) {
    swipeReactor();
    presence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined();
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
    if (!shouldAdjustToFallbackExitProtocol) {
      phoneTiltStateReactor();
    }
    userPhaseReactor();
    touchFeedbackStatusReactor();
    collaboratorPhaseReactor();
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
        (p0) => sessionMetadata.collaboratorPhase,
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
