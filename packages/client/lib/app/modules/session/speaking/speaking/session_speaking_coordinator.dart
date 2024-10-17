// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/utilities/utilities.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_speaking_coordinator.g.dart';

class SessionSpeakingCoordinator = _SessionSpeakingCoordinatorBase
    with _$SessionSpeakingCoordinator;

abstract class _SessionSpeakingCoordinatorBase
    with Store, BaseCoordinator, Reactions {
  final SessionSpeakingWidgetsCoordinator widgets;
  final HoldDetector hold;
  @override
  final CaptureScreen captureScreen;
  final TapDetector tap;
  _SessionSpeakingCoordinatorBase({
    required this.captureScreen,
    required this.widgets,
    required this.hold,
    required this.tap,
  }) {
    initBaseCoordinatorActions();
  }

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await captureScreen(SessionConstants.speaking);
  }

  initReactors() {
    disposers.add(holdReactor());
    disposers.add(letGoReactor());
    disposers.add(tapReactor());
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        if (p0 == 3) {
          widgets.goHome();
        }
      });

  holdReactor() => reaction((p0) => hold.holdCount, (p0) {
        widgets.adjustSpeakLessSmileMoreRotation(hold.placement);
        widgets.onHold(hold.placement);
        setDisableAllTouchFeedback(true);
      });

  letGoReactor() => reaction((p0) => hold.letGoCount, (p0) async {
        widgets.onLetGo();
        Timer(Seconds.get(2), () {
          setDisableAllTouchFeedback(false);
        });
      });

  deconstructor() {
    dispose();
    widgets.dispose();
  }
}
