// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_notes_coordinator.g.dart';

class SessionNotesCoordinator = _SessionNotesCoordinatorBase
    with _$SessionNotesCoordinator;

abstract class _SessionNotesCoordinatorBase with Store {
  final SessionNotesWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  final SwipeDetector swipe;
  final BaseCoordinator base;

  final TapDetector tap;

  _SessionNotesCoordinatorBase({
    required this.widgets,
    required CaptureScreen captureScreen,
    required this.tap,
    required this.presence,
    required this.swipe,
  })  : sessionMetadata = presence.sessionMetadataStore,
        base = BaseCoordinator(captureScreen: captureScreen);

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await presence.updateCurrentPhase(2.0);
    await base.captureScreen(SessionConstants.notes);
  }

  initReactors() {
    base.disposers.add(swipeReactor());
    base.disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        base.setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        base.setDisableAllTouchFeedback(true);
        widgets.onCollaboratorLeft();
      },
    ));
    base.disposers.addAll(widgets.base.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => base.setDisableAllTouchFeedback(false),
      onLongReConnected: () => base.setDisableAllTouchFeedback(false),
      onDisconnected: () => base.setDisableAllTouchFeedback(true),
    ));
    base.disposers.add(touchFeedbackStatusReactor());
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
      reaction((p0) => base.disableAllTouchFeedback, (p0) {
        if (p0) {
          widgets.textEditor.setIsReadOnly(true);
        } else {
          widgets.textEditor.setIsReadOnly(false);
        }
      });

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            base.ifTouchIsNotDisabled(() {
              widgets.onSwipeUp(onSwipeUp);
            });
          case GestureDirections.down:
            base.ifTouchIsNotDisabled(() async {
              if (widgets.textEditor.controller.text.isNotEmpty) {
                await onSwipeUp(widgets.textEditor.controller.text);
              }
              widgets.onExit();
            });
          default:
            break;
        }
      });

  @action
  onSwipeUp(String param) async => await presence.addContent(param);

  deconstructor() {
    base.deconstructor();
    widgets.base.deconstructor();
  }
}
