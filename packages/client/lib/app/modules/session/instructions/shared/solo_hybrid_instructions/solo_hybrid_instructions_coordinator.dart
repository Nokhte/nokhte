// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'solo_hybrid_instructions_coordinator.g.dart';

class SoloHybridInstructionsCoordinator = _SoloHybridInstructionsCoordinatorBase
    with _$SoloHybridInstructionsCoordinator;

abstract class _SoloHybridInstructionsCoordinatorBase
    with Store, BaseCoordinator, Reactions, SessionPresence {
  final TapDetector tap;
  final SoloHybridInstructionsWidgetsCoordinator widgets;
  final SessionMetadataStore sessionMetadata;
  @override
  final SessionPresenceCoordinator presence;
  @override
  final CaptureScreen captureScreen;

  _SoloHybridInstructionsCoordinatorBase({
    required this.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
  }) : sessionMetadata = presence.sessionMetadataStore {
    initBaseCoordinatorActions();
  }

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await captureScreen(SessionConstants.soloHybridInstructions);
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
          Modular.to.navigate(SessionConstants.lobby, arguments: {});
        }
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(
          () => widgets.onTap(tap.currentTapPosition),
        ),
      );

  deconstructor() {
    dispose();
    widgets.dispose();
  }
}
