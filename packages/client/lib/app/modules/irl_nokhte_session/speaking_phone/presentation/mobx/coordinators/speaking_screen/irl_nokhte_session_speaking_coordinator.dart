// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
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
  final GetIrlNokhteSessionMetadataStore sessionMetadata;
  _IrlNokhteSessionSpeakingCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.swipe,
    required this.hold,
    required this.presence,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @action
  constructor() {
    widgets.constructor();
    initReactors();
  }

  initReactors() {
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
      },
      onCollaboratorLeft: () {
        setDisableAllTouchFeedback(true);
        if (hold.holdCount.isGreaterThan(hold.letGoCount)) {
          widgets.onLetGo();
        }
      },
    );
  }

  holdReactor() => reaction((p0) => hold.holdCount, (p0) {
        ifTouchIsNotDisabled(() {
          if (presence.getSessionMetadataStore.collaboratorIsOnline) {
            widgets.onHold();
          }
        });
      });

  letGoReactor() => reaction((p0) => hold.letGoCount, (p0) {
        ifTouchIsNotDisabled(() {
          if (presence.getSessionMetadataStore.collaboratorIsOnline) {
            widgets.onLetGo();
          }
        });
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
    if (sessionMetadata.collaboratorIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
  }
}
