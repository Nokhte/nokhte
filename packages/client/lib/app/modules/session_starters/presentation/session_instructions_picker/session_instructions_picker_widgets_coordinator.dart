// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_instructions_picker_widgets_coordinator.g.dart';

class SessionInstructionsPickerWidgetsCoordinator = _SessionInstructionsPickerWidgetsCoordinatorBase
    with _$SessionInstructionsPickerWidgetsCoordinator;

abstract class _SessionInstructionsPickerWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator, Reactions {
  final BeachWavesStore beachWaves;
  final TintStore tint;
  final ChoiceButtonsStore choiceButtons;
  final GestureCrossStore gestureCross;
  final ChoiceTextStore choiceText;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionInstructionsPickerWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.choiceButtons,
    required this.gestureCross,
    required this.tint,
    required this.choiceText,
    required this.wifiDisconnectOverlay,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @action
  constructor(Offset centerParam) {
    setCenter(centerParam);
    tint.initMovie(NoParams());
    gestureCross.fadeInTheCross();
    choiceText.fadeIn();
    choiceButtons.fadeIn();
    beachWaves.setMovieMode(BeachWaveMovieModes.invertedOnShore);
    initReactors();
  }

  initReactors() {
    disposers.add(choiceButtonReactor());
  }

  @observable
  int tapCount = 0;

  Stopwatch transitionTimer = Stopwatch();

  choiceButtonReactor() =>
      reaction((p0) => choiceButtons.choiceButtonType, (p0) {
        transitionTimer.start();
        tint.reverseMovie(NoParams());
        choiceButtons.setWidgetVisibility(false);
        choiceText.setWidgetVisibility(false);
        beachWaves.currentStore.setControl(Control.playReverse);
      });
}
