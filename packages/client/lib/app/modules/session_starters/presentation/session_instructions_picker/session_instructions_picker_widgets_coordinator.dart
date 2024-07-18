// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_instructions_picker_widgets_coordinator.g.dart';

class SessionInstructionsPickerWidgetsCoordinator = _SessionInstructionsPickerWidgetsCoordinatorBase
    with _$SessionInstructionsPickerWidgetsCoordinator;

abstract class _SessionInstructionsPickerWidgetsCoordinatorBase
    with
        Store,
        BaseWidgetsCoordinator,
        Reactions,
        EnRoute,
        EnRouteWidgetsRouter {
  final TintStore tint;
  final ChoiceButtonsStore choiceButtons;
  final GestureCrossStore gestureCross;
  final ChoiceTextStore choiceText;
  @override
  final BeachWavesStore beachWaves;
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
  constructor() {
    setupEnRouteWidgets();
    tint.initMovie(NoParams());
    gestureCross.fadeInTheCross();
    choiceText.fadeIn();
    choiceButtons.fadeIn();
    beachWaves.setMovieMode(BeachWaveMovieModes.invertedOnShore);
    beachWaves.currentStore.initMovie(WaterDirection.down);
    beachWaves.currentStore.setControl(Control.playFromStart);
  }

  choiceButtonReactor(Function(ChoiceButtonType choiceButtonType) onTapped) =>
      reaction((p0) => choiceButtons.choiceButtonType, (p0) {
        tint.reverseMovie(NoParams());
        choiceButtons.setWidgetVisibility(false);
        choiceText.setWidgetVisibility(false);
        Timer(Seconds.get(1), () {
          onTapped(p0);
        });
      });


}
