// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/company_presets/queries.dart';
part 'session_speaking_instructions_coordinator.g.dart';

class SessionSpeakingInstructionsCoordinator = _SessionSpeakingInstructionsCoordinatorBase
    with _$SessionSpeakingInstructionsCoordinator;

abstract class _SessionSpeakingInstructionsCoordinatorBase with Store {
  final TapDetector tap;
  final HoldDetector hold;
  final SessionSpeakingInstructionsWidgetsCoordinator widgets;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;

  final BaseCoordinator base;

  _SessionSpeakingInstructionsCoordinatorBase({
    required CaptureScreen captureScreen,
    required this.widgets,
    required this.tap,
    required this.presence,
    required this.hold,
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
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        widgets.setDisableTouchInput(true);
        widgets.onCollaboratorLeft();
      },
    ));
    base.disposers.addAll(widgets.base.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => base.setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        widgets.setDisableTouchInput(false);
      },
      onDisconnected: () {
        widgets.setDisableTouchInput(true);
      },
    ));
    base.disposers.add(holdReactor());
    base.disposers.add(letGoReactor());

    base.disposers.add(widgets.beachWavesMovieStatusReactor(onComplete));
  }

  @action
  onComplete() {
    if (sessionMetadata.presetType == PresetTypes.consultative) {
      //
      Modular.to.navigate(SessionConstants.consultationNotesSymbols);
    } else {
      Modular.to.navigate(SessionConstants.consultationNotesSymbols);
      // Modular.to.navigate(SessionConstants.showGroupGeometry);
      //
    }
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

  holdReactor() => reaction(
        (p0) => hold.holdCount,
        (p0) {
          base.ifTouchIsNotDisabled(() {
            widgets.onHold();
          });
        },
      );

  letGoReactor() => reaction((p0) => hold.letGoCount, (p0) {
        widgets.onLetGo();
        Timer(Seconds.get(2), () {
          base.setDisableAllTouchFeedback(false);
        });
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => base.ifTouchIsNotDisabled(
          () => widgets.onTap(tap.currentTapPosition),
        ),
      );

  deconstructor() {
    base.deconstructor();
    widgets.base.deconstructor();
  }
}
