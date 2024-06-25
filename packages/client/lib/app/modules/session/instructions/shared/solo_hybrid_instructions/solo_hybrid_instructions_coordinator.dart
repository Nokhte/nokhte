// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'solo_hybrid_instructions_coordinator.g.dart';

class SoloHybridInstructionsCoordinator = _SoloHybridInstructionsCoordinatorBase
    with _$SoloHybridInstructionsCoordinator;

abstract class _SoloHybridInstructionsCoordinatorBase extends BaseCoordinator
    with Store {
  final TapDetector tap;
  final SoloHybridInstructionsWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;

  _SoloHybridInstructionsCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
  }) : sessionMetadata = presence.sessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await captureScreen(SessionConstants.speakingHalfInstructions);
  }

  initReactors() {
    disposers.add(tapReactor());
    disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        widgets.setDisableTouchInput(false);
      },
      onCollaboratorLeft: () {
        widgets.setDisableTouchInput(true);
      },
    ));
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        widgets.setDisableTouchInput(false);
      },
      onDisconnected: () {
        widgets.setDisableTouchInput(true);
      },
    ));
    disposers.add(rippleCompletionStatusReactor());
  }

  rippleCompletionStatusReactor() =>
      reaction((p0) => widgets.touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished && widgets.hasFinishedAllInstructions) {
          onComplete();
        }
      });

  @action
  onComplete() {
    print("it's done");
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

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(
          () => widgets.onTap(tap.currentTapPosition),
        ),
      );

  @override
  deconstructor() {
    super.deconstructor();
    widgets.deconstructor();
  }
}
