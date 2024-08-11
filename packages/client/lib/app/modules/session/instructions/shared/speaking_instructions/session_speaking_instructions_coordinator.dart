// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/company_presets/queries.dart';
part 'session_speaking_instructions_coordinator.g.dart';

class SessionSpeakingInstructionsCoordinator = _SessionSpeakingInstructionsCoordinatorBase
    with _$SessionSpeakingInstructionsCoordinator;

abstract class _SessionSpeakingInstructionsCoordinatorBase
    with Store, BaseCoordinator, Reactions, SessionPresence {
  final TapDetector tap;
  final HoldDetector hold;
  final SessionSpeakingInstructionsWidgetsCoordinator widgets;
  final SessionMetadataStore sessionMetadata;
  @override
  final SessionPresenceCoordinator presence;
  @override
  final CaptureScreen captureScreen;

  _SessionSpeakingInstructionsCoordinatorBase({
    required this.captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
    required this.hold,
  }) : sessionMetadata = presence.sessionMetadataStore {
    initBaseCoordinatorActions();
  }

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await captureScreen(SessionConstants.speakingInstructions);
  }

  initReactors() {
    disposers.add(tapReactor());
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
      },
    ));
    disposers.add(holdReactor());
    disposers.add(letGoReactor());

    disposers.add(widgets.beachWavesMovieStatusReactor(onComplete: onComplete));
  }

  @action
  onComplete() {
    if (sessionMetadata.presetType == PresetTypes.consultative) {
      Modular.to.navigate(SessionConstants.consultationNotesSymbols);
    } else {
      Modular.to.navigate(SessionConstants.socraticNotesSymbols);
    }
  }

  holdReactor() => reaction(
        (p0) => hold.holdCount,
        (p0) {
          ifTouchIsNotDisabled(() {
            widgets.onHold();
          });
        },
      );

  letGoReactor() => reaction((p0) => hold.letGoCount, (p0) {
        widgets.onLetGo();
        Timer(Seconds.get(2), () {
          setDisableAllTouchFeedback(false);
        });
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(
          () => widgets.onTap(tap.currentTapPosition),
        ),
      );

  deconstructor() {
    dispose();
  }
}
