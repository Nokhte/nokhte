// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_notes_instructions_widgets_coordinator.g.dart';

class SessionNotesInstructionsWidgetsCoordinator = SessionNotesInstructionsWidgetsCoordinatorBase
    with _$SessionNotesInstructionsWidgetsCoordinator;

abstract class SessionNotesInstructionsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final MirroredTextStore mirroredText;
  final TouchRippleStore touchRipple;

  SessionNotesInstructionsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.mirroredText,
    required this.touchRipple,
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

  @action
  constructor() {
    cooldownStopwatch.start();
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
    mirroredText.setMessagesData(
      MirroredTextContent.sessionNotesInstructions,
    );

    mirroredText.startBothRotatingText();
    setDisableTouchInput(false);
  }

  @action
  onTap(Offset tapPosition) async {
    if (!disableTouchInput) {
      if (cooldownStopwatch.elapsedMilliseconds.isLessThan(950)) {
        return;
      } else {
        cooldownStopwatch.reset();
      }
      touchRipple.onTap(tapPosition);
      if (hasTappedOnTheRightSide) {
        if (isStillInMutualInstructionMode) {
          mirroredText.startRotatingRightSideUp(isResuming: true);
          if (isLastTap) {
            mirroredText.setUpsideDownVisibility(false);
            beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToSky);
            beachWaves.currentStore.reverseMovie(NoParams());
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
  MirroredTextOrientations get currentActiveOrientation =>
      MirroredTextOrientations.rightSideUp;

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
