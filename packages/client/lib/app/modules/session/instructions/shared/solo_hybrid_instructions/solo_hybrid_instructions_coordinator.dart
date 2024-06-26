// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'solo_hybrid_instructions_coordinator.g.dart';

class SoloHybridInstructionsCoordinator = _SoloHybridInstructionsCoordinatorBase
    with _$SoloHybridInstructionsCoordinator;

abstract class _SoloHybridInstructionsCoordinatorBase with Store {
  final BaseCoordinator base;
  final TapDetector tap;
  final SoloHybridInstructionsWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;

  _SoloHybridInstructionsCoordinatorBase({
    required CaptureScreen captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
  })  : sessionMetadata = presence.sessionMetadataStore,
        base = BaseCoordinator(captureScreen: captureScreen);

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await base.captureScreen(SessionConstants.speakingHalfInstructions);
  }

  initReactors() {
    base.disposers.add(tapReactor());
    base.disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        widgets.setDisableTouchInput(false);
      },
      onCollaboratorLeft: () {
        widgets.setDisableTouchInput(true);
      },
    ));
    base.disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => base.setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        widgets.setDisableTouchInput(false);
      },
      onDisconnected: () {
        widgets.setDisableTouchInput(true);
      },
    ));
    base.disposers.add(rippleCompletionStatusReactor());
  }

  rippleCompletionStatusReactor() =>
      reaction((p0) => widgets.touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished && widgets.hasFinishedAllInstructions) {
          Modular.to.navigate(SessionConstants.lobby, arguments: {});
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

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => base.ifTouchIsNotDisabled(
          () => widgets.onTap(tap.currentTapPosition),
        ),
      );

  deconstructor() {
    base.deconstructor();
    widgets.deconstructor();
  }
}
