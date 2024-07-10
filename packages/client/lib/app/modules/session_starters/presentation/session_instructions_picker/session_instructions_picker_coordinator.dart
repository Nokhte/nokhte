// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
part 'session_instructions_picker_coordinator.g.dart';

class SessionInstructionsPickerCoordinator = _SessionInstructionsPickerCoordinatorBase
    with _$SessionInstructionsPickerCoordinator;

abstract class _SessionInstructionsPickerCoordinatorBase
    with Store, BaseCoordinator, Reactions, EnRoute, EnRouteRouter {
  final SessionInstructionsPickerWidgetsCoordinator widgets;
  @override
  final CaptureScreen captureScreen;

  _SessionInstructionsPickerCoordinatorBase({
    required this.widgets,
    required this.captureScreen,
  }) {
    initEnRouteActions();
    initBaseCoordinatorActions();
  }

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await captureScreen(SessionStarterConstants.sessionStarterInstructions);
  }

  @action
  setRoutingParams() {
    setParams(
      ResumeOnShoreParams(
        isInverted: true,
        direction: widgets.waterDirecton,
        position: widgets.beachWaves.currentAnimationValues.first,
      ),
    );
  }

  @action
  onComplete(ChoiceButtonType buttonType) {
    final path = buttonType == ChoiceButtonType.joining
        ? SessionStarterConstants.sessionJoinerInstructions
        : SessionStarterConstants.sessionStarterInstructions;
    setRoutingParams();
    Modular.to.navigate(path, arguments: getModularArgs(params));
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
    disposers.add(widgets.choiceButtonReactor(onComplete));
  }

  deconstructor() {
    widgets.dispose();
    dispose();
  }
}
