// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_notes_instructions_widgets_coordinator.g.dart';

class SessionNotesInstructionsWidgetsCoordinator = _SessionNotesInstructionsWidgetsCoordinatorBase
    with _$SessionNotesInstructionsWidgetsCoordinator;

abstract class _SessionNotesInstructionsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final MirroredTextStore mirroredText;
  final TintStore tint;
  final TouchRippleStore touchRipple;

  _SessionNotesInstructionsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.mirroredText,
    required this.touchRipple,
    required this.tint,
    required super.wifiDisconnectOverlay,
  });

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @observable
  bool disableTouchInput = false;

  @action
  setDisableTouchInput(bool newValue) => disableTouchInput = newValue;

  @observable
  MirroredTextOrientations currentActiveOrientation =
      MirroredTextOrientations.rightSideUp;

  @observable
  int tapCount = 0;

  @action
  constructor(bool shouldAdjustToFallbackExitProtocol) {
    cooldownStopwatch.start();
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
    mirroredText.setMessagesData(
      MirroredTextContent.sessionNotesInstructions,
      shouldAdjustToFallbackExitProtocol: shouldAdjustToFallbackExitProtocol,
    );
    mirroredText.startBothRotatingText();
    setDisableTouchInput(false);
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
    tint.setControl(Control.playReverseFromEnd);
    mirroredText.startBothRotatingText(isResuming: true);
    setDisableTouchInput(false);
  }

  @action
  onCollaboratorLeft() {
    mirroredText.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined() {
    mirroredText.setWidgetVisibility(mirroredText.pastShowWidget);
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
      touchRipple.tapPlacement == GesturePlacement.bottomHalf;

  @computed
  bool get upsideDownTextIsVisible =>
      currentActiveOrientation == MirroredTextOrientations.upsideDown;

  @computed
  bool get hasTappedOnTheTopHalf =>
      touchRipple.tapPlacement == GesturePlacement.topHalf;

  @computed
  bool get isStillInMutualInstructionMode => tapCount.isLessThan(4);

  @computed
  bool get isFirstTap => tapCount == 0;

  @computed
  bool get isLastTap => tapCount == 3;

  @computed
  bool get hasCompletedInstructions => tapCount == 4;

  @computed
  bool get textIsDoneFadingInOrOut =>
      mirroredText.textIsDoneAnimating || isFirstTap;
}
