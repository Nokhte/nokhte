// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
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

  _IrlNokhteSessionNotesCoordinatorBase({
    required this.widgets,
    required super.captureScreen,
    required this.presence,
    required this.swipe,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await presence.listen();
  }

  initReactors() {
    swipeReactor();
    presence.initReactors(
      onCollaboratorJoined: () => setDisableAllTouchFeedback(false),
      onCollaboratorLeft: () => setDisableAllTouchFeedback(true),
    );
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () => setDisableAllTouchFeedback(false),
      onDisconnected: () => setDisableAllTouchFeedback(true),
    );
    touchFeedbackStatusReactor();
  }

  touchFeedbackStatusReactor() =>
      reaction((p0) => disableAllTouchFeedback, (p0) {
        if (p0) {
          widgets.textEditor.setIsReadOnly(true);
        } else {
          widgets.textEditor.setIsReadOnly(false);
        }
      });

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
