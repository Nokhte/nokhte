// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_half_notes_instructions_widgets_coordinator.g.dart';

class HalfSessionNotesInstructionsWidgetsCoordinator = HalflSessionNotesInstructionsWidgetsCoordinatorBase
    with _$HalfSessionNotesInstructionsWidgetsCoordinator;

abstract class HalflSessionNotesInstructionsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final MirroredTextStore mirroredText;
  final TintStore tint;
  final TouchRippleStore touchRipple;
  final HalfScreenTintStore halfScreenTint;

  HalflSessionNotesInstructionsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.mirroredText,
    required this.halfScreenTint,
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
  int tapCount = 0;

  @observable
  bool instructionsOnTop = true;

  @action
  constructor({
    required bool instructionsOnTop,
  }) {
    this.instructionsOnTop = instructionsOnTop;
    cooldownStopwatch.start();
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
    mirroredText.setMessagesData(
      instructionsOnTop
          ? MirroredTextContent.sessionNotesTopHalfInstructions
          : MirroredTextContent.sessionNotesBottomHalfInstructions,
    );

    if (!instructionsOnTop) {
      halfScreenTint.setShouldCoverBottom(false);
    }
    mirroredText.startBothRotatingText();
    halfScreenTint.initMovie(NoParams());
    setDisableTouchInput(false);
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
      if (hasTappedOnTheRightSide) {
        if (isStillInMutualInstructionMode) {
          if (instructionsOnTop) {
            mirroredText.startRotatingUpsideDown(isResuming: true);
          } else {
            mirroredText.startRotatingRightSideUp(isResuming: true);
          }
          if (isLastTap) {
            halfScreenTint.reverseMovie(NoParams());
            if (instructionsOnTop) {
              mirroredText.setRightSideUpVisibility(false);
            } else {
              mirroredText.setUpsideDownVisibility(false);
            }
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
  MirroredTextOrientations get currentActiveOrientation => instructionsOnTop
      ? MirroredTextOrientations.upsideDown
      : MirroredTextOrientations.rightSideUp;

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
  bool get isStillInMutualInstructionMode => tapCount.isLessThan(2);

  @computed
  bool get isFirstTap => tapCount == 0;

  @computed
  bool get isLastTap => tapCount == 1;

  @computed
  bool get hasCompletedInstructions => tapCount == 2;

  @computed
  bool get textIsDoneFadingInOrOut =>
      mirroredText.textIsDoneAnimating || isFirstTap;
}
