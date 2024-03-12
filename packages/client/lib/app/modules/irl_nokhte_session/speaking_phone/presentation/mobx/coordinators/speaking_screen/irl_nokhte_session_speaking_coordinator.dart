// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';
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
  final GetTiltStreamStore getTiltStream;
  final GetIrlNokhteSessionMetadataStore sessionMetadata;
  _IrlNokhteSessionSpeakingCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.swipe,
    required this.hold,
    required this.getTiltStream,
    required this.presence,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    getTiltStream(NoParams());
  }

  initReactors() {
    holdReactor();
    letGoReactor();
    widgets.beachWavesMovieStatusReactor(() {
      setDisableAllTouchFeedback(false);
    });
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
    phoneTiltStateReactor();
    collaboratorPhaseReactor();
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
            setDisableAllTouchFeedback(true);
          }
        });
      });

  phoneTiltStateReactor() =>
      reaction((p0) => getTiltStream.holdingState, (p0) async {
        if (p0 == PhoneHoldingState.isPickedUp) {
          await presence.updateCurrentPhase(3);
        } else if (p0 == PhoneHoldingState.isDown) {
          await presence.updateCurrentPhase(2);
        }
      });

  collaboratorPhaseReactor() => reaction(
        (p0) => sessionMetadata.collaboratorPhase,
        (p0) {
          if (sessionMetadata.canExitTheSession) {
            print("You can exit");
            // widgets.onExit();
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
