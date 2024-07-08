// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
part 'session_instructions_picker_coordinator.g.dart';

class SessionInstructionsPickerCoordinator = _SessionInstructionsPickerCoordinatorBase
    with _$SessionInstructionsPickerCoordinator;

abstract class _SessionInstructionsPickerCoordinatorBase
    with Store, BaseCoordinator, Reactions {
  final SessionInstructionsPickerWidgetsCoordinator widgets;
  @override
  final CaptureScreen captureScreen;

  _SessionInstructionsPickerCoordinatorBase({
    required this.widgets,
    required this.captureScreen,
  }) {
    initBaseCoordinatorActions();
  }

  @action
  constructor(Offset center) async {
    widgets.constructor(center);
    widgets.initReactors();
    initReactors();
    await captureScreen(SessionStarterConstants.sessionStarterInstructions);
  }

  initReactors() {
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
        widgets.setIsDisconnected(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
        widgets.setIsDisconnected(true);
      },
    ));
  }

  deconstructor() {
    widgets.dispose();
    dispose();
  }
}
