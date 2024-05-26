// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'session_hybrid_notes_widgets_coordinator.dart';
part 'session_hybrid_notes_coordinator.g.dart';

class SessionHybridNotesCoordinator = _SessionHybridNotesCoordinatorBase
    with _$SessionHybridNotesCoordinator;

abstract class _SessionHybridNotesCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionHybridNotesWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;
  final SwipeDetector swipe;
  final TapDetector tap;
  final GyroscopicCoordinator gyroscopic;

  _SessionHybridNotesCoordinatorBase({
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
    await captureScreen(SessionConstants.hybridNotes);
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
        widgets.onCollaboratorJoined(() {
          setBlockPhoneTiltReactor(true);
        });
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
    touchFeedbackStatusReactor();
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

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            ifTouchIsNotDisabled(() {
              widgets.onSwipeUp(onSwipeUp);
            });
          default:
            break;
        }
      });

  @action
  onSwipeUp(String param) async => await presence.addContent(param);
}
