// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'irl_nokhte_session_notes_instructions_widgets_coordinator.g.dart';

class IrlNokhteSessionNotesInstructionsWidgetsCoordinator = _IrlNokhteSessionNotesInstructionsWidgetsCoordinatorBase
    with _$IrlNokhteSessionNotesInstructionsWidgetsCoordinator;

abstract class _IrlNokhteSessionNotesInstructionsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final MirroredTextStore mirroredText;
  final TouchRippleStore touchRipple;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _IrlNokhteSessionNotesInstructionsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.mirroredText,
    required this.touchRipple,
    required this.wifiDisconnectOverlay,
  });

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @observable
  bool disableTouchInput = true;

  @action
  setDisableTouchInput(bool newValue) => disableTouchInput = newValue;

  @observable
  MirroredTextOrientations currentActiveOrientation =
      MirroredTextOrientations.rightSideUp;

  @observable
  int tapCount = 0;

  @action
  constructor() {
    cooldownStopwatch.start();
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    mirroredText.setMessagesData(
      MirroredTextContentOptions.irlNokhteSessionNotesInstructions,
    );
    mirroredText.startBothRotatingText();
    setDisableTouchInput(true);
  }

  @action
  toggleCurrentActiveOrientation() {
    switch (currentActiveOrientation) {
      case MirroredTextOrientations.rightSideUp:
        currentActiveOrientation = MirroredTextOrientations.upsideDown;
      case MirroredTextOrientations.upsideDown:
        currentActiveOrientation = MirroredTextOrientations.rightSideUp;
      default:
        break;
    }
  }

  @action
  onTap(Offset tapPosition, {required Function onFlowFinished}) async {
    if (!disableTouchInput) {
      if (cooldownStopwatch.elapsedMilliseconds.isLessThan(950)) {
        return;
      } else {
        cooldownStopwatch.reset();
      }
      touchRipple.onTap(tapPosition);
      if (hasTappedOnTheRightSide && textIsDoneFadingInOrOut) {
        toggleCurrentActiveOrientation();
        if (isStillInMutualInstructionMode) {
          mirroredText.startBothRotatingText(isResuming: true);
          if (isLastTap) {
            await onFlowFinished();
          }
        }
        tapCount++;
      }
    }
  }

  @action
  onInstructionModeUnlocked() {
    mirroredText.startBothRotatingText(isResuming: true);
    setDisableTouchInput(false);
  }

  @computed
  bool get hasTappedOnTheRightSide =>
      rightSideUpTextIsVisible && hasTappedOnTheBottomHalf ||
      upsideDownTextIsVisible && hasTappedOnTheTopHalf;

  @computed
  bool get rightSideUpTextIsVisible =>
      currentActiveOrientation == MirroredTextOrientations.rightSideUp;

  @computed
  bool get hasTappedOnTheBottomHalf =>
      touchRipple.tapPlacement == TapPlacement.bottomHalf;

  @computed
  bool get upsideDownTextIsVisible =>
      currentActiveOrientation == MirroredTextOrientations.upsideDown;

  @computed
  bool get hasTappedOnTheTopHalf =>
      touchRipple.tapPlacement == TapPlacement.topHalf;

  @computed
  bool get isStillInMutualInstructionMode => tapCount.isLessThan(4);

  @computed
  bool get isFirstTap => tapCount == 0;

  @computed
  bool get isLastTap => tapCount == 3;

  @computed
  bool get textIsDoneFadingInOrOut =>
      mirroredText.textIsDoneAnimating || isFirstTap;
}
