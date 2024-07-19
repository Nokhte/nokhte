// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'socratic_notes_instructions_coordinator.g.dart';

class SocraticNotesInstructionsCoordinator = SocraticNotesInstructionsCoordinatorBase
    with _$SocraticNotesInstructionsCoordinator;

abstract class SocraticNotesInstructionsCoordinatorBase
    with Store, BaseCoordinator, Reactions {
  final SocraticNotesInstructionsWidgetsCoordinator widgets;
  final TapDetector tap;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;

  @override
  final CaptureScreen captureScreen;

  SocraticNotesInstructionsCoordinatorBase({
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
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () => setDisableAllTouchFeedback(false),
      onDisconnected: () => setDisableAllTouchFeedback(true),
    ));
  }

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(
          () {
            widgets.onTap(tap.currentTapPosition);
          },
        ),
      );

  deconstructor() {
    widgets.dispose();
    dispose();
  }
}
