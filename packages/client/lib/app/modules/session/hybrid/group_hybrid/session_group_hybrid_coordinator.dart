// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'session_group_hybrid_widgets_coordinator.dart';
part 'session_group_hybrid_coordinator.g.dart';

class SessionGroupHybridCoordinator = _SessionGroupHybridCoordinatorBase
    with _$SessionGroupHybridCoordinator;

abstract class _SessionGroupHybridCoordinatorBase with Store {
  final SessionGroupHybridWidgetsCoordinator widgets;
  final TapDetector tap;
  final SwipeDetector swipe;
  final HoldDetector hold;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  final BaseCoordinator base;

  _SessionGroupHybridCoordinatorBase({
    required this.widgets,
    required this.swipe,
    required this.hold,
    required this.tap,
    required CaptureScreen captureScreen,
    required this.presence,
  })  : sessionMetadata = presence.sessionMetadataStore,
        base = BaseCoordinator(captureScreen: captureScreen);

  @action
  constructor() async {
    widgets.constructor(sessionMetadata.userCanSpeak);
    initReactors();
    await presence.updateCurrentPhase(2.0);
    await base.captureScreen(SessionConstants.groupHybrid);
  }

  @observable
  bool userIsSpeaking = false;

  @action
  setUserIsSpeaking(bool newValue) => userIsSpeaking = newValue;

  initReactors() {
    base.disposers.add(holdReactor());
    base.disposers.add(letGoReactor());
    base.disposers.addAll(widgets.base.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => base.setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        base.setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        base.setDisableAllTouchFeedback(true);
        if (hold.holdCount.isGreaterThan(hold.letGoCount)) {
          widgets.onLetGo();
        }
      },
    ));
    base.disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        base.setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        base.setDisableAllTouchFeedback(true);
        if (hold.holdCount.isGreaterThan(hold.letGoCount)) {
          widgets.onLetGo();
        }
        widgets.onCollaboratorLeft();
      },
    ));
    base.disposers.add(swipeReactor());
    base.disposers.add(tapReactor());
    base.disposers.add(userIsSpeakingReactor());
    base.disposers.add(userCanSpeakReactor());
  }

  userIsSpeakingReactor() =>
      reaction((p0) => sessionMetadata.userIsSpeaking, (p0) async {
        if (p0) {
          setUserIsSpeaking(true);
          widgets.adjustSpeakLessSmileMoreRotation(hold.placement);
          widgets.onHold(hold.placement);
          base.setDisableAllTouchFeedback(true);
          await presence.updateCurrentPhase(2);
        }
      });

  userCanSpeakReactor() => reaction((p0) => sessionMetadata.userCanSpeak, (p0) {
        if (p0 && userIsSpeaking) {
          widgets.onLetGo();
          setUserIsSpeaking(false);
          Timer(Seconds.get(2), () {
            base.setDisableAllTouchFeedback(false);
          });
        } else if (p0 && !userIsSpeaking) {
          widgets.othersAreTalkingTint.reverseMovie(NoParams());
        } else if (!p0 && !userIsSpeaking) {
          widgets.othersAreTalkingTint.initMovie(NoParams());
        }
      });

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.down:
            base.ifTouchIsNotDisabled(() {
              widgets.onExit();
            });
          default:
            break;
        }
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => base.ifTouchIsNotDisabled(
          () async {
            widgets.onTap(tap.currentTapPosition);
          },
        ),
      );

  holdReactor() => reaction((p0) => hold.holdCount, (p0) {
        base.ifTouchIsNotDisabled(() async {
          if (sessionMetadata.everyoneIsOnline) {
            await presence
                .updateWhoIsTalking(UpdateWhoIsTalkingParams.setUserAsTalker);
          }
        });
      });

  letGoReactor() => reaction((p0) => hold.letGoCount, (p0) async {
        if (sessionMetadata.everyoneIsOnline) {
          await presence.updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
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

  deconstructor() {
    base.deconstructor();
    widgets.base.deconstructor();
  }
}
