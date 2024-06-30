// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_notes_instructions_coordinator.g.dart';

class SessionNotesInstructionsCoordinator = SessionNotesInstructionsCoordinatorBase
    with _$SessionNotesInstructionsCoordinator;

abstract class SessionNotesInstructionsCoordinatorBase
    with Store, BaseCoordinator {
  final SessionNotesInstructionsWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;

  @override
  final CaptureScreen captureScreen;

  SessionNotesInstructionsCoordinatorBase({
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
    await captureScreen(SessionConstants.notesInstructions);
  }

  @action
  initReactors() {
    disposers.add(tapReactor());
    disposers.addAll(widgets.base.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => widgets.setDisableTouchInput(false),
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
        if (p0 == MovieStatus.finished && widgets.hasCompletedInstructions) {
          Modular.to.navigate(SessionConstants.showGroupGeometry);
        }
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(
          () async {
            widgets.onTap(tap.currentTapPosition);
          },
        ),
      );
  updateCurrentPhase() async {
    Timer.periodic(Seconds.get(0, milli: 500), (timer) async {
      if (sessionMetadata.userPhase != 2.0) {
        await presence.updateCurrentPhase(2.0);
      } else {
        timer.cancel();
      }
    });
  }

  deconstructor() {
    dispose();
    widgets.base.deconstructor();
  }
}
