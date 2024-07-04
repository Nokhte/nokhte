// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_speaking_instructions_widgets_coordinator.g.dart';

class SessionSpeakingInstructionsWidgetsCoordinator = _SessionSpeakingInstructionsWidgetsCoordinatorBase
    with _$SessionSpeakingInstructionsWidgetsCoordinator;

abstract class _SessionSpeakingInstructionsWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator, Reactions {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final BorderGlowStore borderGlow;
  final HoldTimerIndicatorStore holdTimerIndicator;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionSpeakingInstructionsWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.borderGlow,
    required this.holdTimerIndicator,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @observable
  bool disableTouchInput = true;

  @observable
  int tapCount = 0;

  @observable
  bool canHold = true;

  @observable
  int holdCount = 0;

  @observable
  int letGoCount = 0;

  @observable
  bool abortTheTextRotation = false;

  @observable
  bool speakingInstructionsComplete = false;

  @observable
  bool isHolding = false;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
    mirroredText.setMessagesData(
      MirroredTextContent.sessionSpeakingInstructions,
    );
    initReactors();
    mirroredText.startBothRotatingText();
    cooldownStopwatch.start();
    disableTouchInput = false;
  }

  initReactors() {
    disposers.add(rightSideUpIndexReactor());
    disposers.add(upsideDownIndexReactor());
  }

  setDisableTouchInput(bool newValue) => disableTouchInput = newValue;

  beachWavesMovieStatusReactor(Function onComplete) =>
      reaction((p0) => beachWaves.movieStatus, (p0) async {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode ==
              BeachWaveMovieModes.halfAndHalfToDrySand) {
            borderGlow.initMovie(NoParams());
            holdTimerIndicator.initMovie(GesturePlacement.bottomHalf);
          } else if (beachWaves.movieMode == BeachWaveMovieModes.anyToSky) {
            borderGlow.initMovie(NoParams());
            holdTimerIndicator.initMovie(GesturePlacement.topHalf);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.anyToHalfAndHalf) {
            if (!speakingInstructionsComplete) {
              Timer.periodic(Seconds.get(0, milli: 550), (timer) {
                if (mirroredText.primaryUpsideDownText.control ==
                    Control.playFromStart) {
                  resetRightSideHoldingPadding();
                  resetUpsideDownHoldingPadding();
                  mirroredText.setRightSideUpVisibility(true); //
                  canHold = true;
                  mirroredText.setUpsideDownCurrentIndex(2);
                  mirroredText.setWidgetVisibility(true);
                  timer.cancel();
                  //
                }
              });
            } else {
              beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToHalfAndHalf);
              beachWaves.currentStore.reverseMovie(NoParams());
            }
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.deepSeaToHalfAndHalf) {
            onComplete();
          }
        }
      });

  @action
  adjustRightSideToHoldingPadding() {
    mirroredText.setPadding(
      primaryRightSideUpTopPadding: 0,
      primaryRightSideUpBottomPadding: .2,
    );
  }

  @action
  adjustUpsideDownToHoldingPadding() {
    mirroredText.setPadding(
      primaryUpsideDownTopPadding: 0,
      primaryUpsideDownBottomPadding: .25,
    );
  }

  @action
  resetRightSideHoldingPadding() {
    mirroredText.setPadding(
      primaryRightSideUpTopPadding: 0.15,
      primaryRightSideUpBottomPadding: 0,
    );
  }

  @action
  resetUpsideDownHoldingPadding() {
    mirroredText.setPadding(
      primaryUpsideDownTopPadding: .15,
      primaryUpsideDownBottomPadding: 0,
    );
  }

  @action
  onCollaboratorLeft() {
    mirroredText.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined() {
    mirroredText.setRightSideUpVisibility(
      mirroredText.primaryRightSideUpText.pastShowWidget,
    );
    mirroredText.setUpsideDownVisibility(
      mirroredText.primaryUpsideDownText.pastShowWidget,
    );
  }

  @action
  onEmptyCheckPointMessageReached(int index) {
    if (index == 3) {
      adjustRightSideToHoldingPadding();
    }
    Timer(const Duration(milliseconds: 500), () {
      if (!abortTheTextRotation && !speakingInstructionsComplete) {
        mirroredText.startRotatingRightSideUp(isResuming: true);
      }
    });
  }

  upsideDownIndexReactor() =>
      reaction((p0) => mirroredText.primaryUpsideDownText.currentIndex, (p0) {
        if (p0.isGreaterThan(2)) {
          if (p0.isOdd) {
            onEmptyCheckPointMessageReached(p0);
          } else {
            onNextMessageReached(p0);
          }
        }
      });

  rightSideUpIndexReactor() =>
      reaction((p0) => mirroredText.primaryRightSideUpText.currentIndex, (p0) {
        if (p0.isGreaterThan(2)) {
          if (p0.isOdd) {
            onEmptyCheckPointMessageReached(p0);
          } else {
            onNextMessageReached(p0);
          }
        }
      });

  @action
  onNextMessageReached(int index) {
    Duration onScreenTime = Duration.zero;
    if (index == 4) {
      onScreenTime = Seconds.get(2);
    }
    Timer(onScreenTime, () {
      if (index == 4) {
        mirroredText.startRotatingRightSideUp(isResuming: true);
      } else if (index == 6) {
        speakingInstructionsComplete = true;
      }
    });
  }

  @action
  onTap(Offset tapPosition) async {
    if (!disableTouchInput) {
      if (cooldownStopwatch.elapsedMilliseconds.isLessThan(950)) {
        return;
      } else {
        cooldownStopwatch.reset();
      }
      touchRipple.onTap(tapPosition, adjustColorBasedOnPosition: true);
      if (hasTappedOnTheRightSide && textIsDoneFadingInOrOut && tapCount < 2) {
        mirroredText.startRotatingRightSideUp(isResuming: true);
        tapCount++;
      }
    }
  }

  @action
  onHold() {
    if (!isStillInMutualInstructionMode && canHold) {
      isHolding = true;
      mirroredText.setUpsideDownVisibility(false);
      canHold = false;
      abortTheTextRotation = false;
      holdCount++;
      if (!speakingInstructionsComplete) {
        mirroredText.startRotatingRightSideUp(isResuming: true);
        beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
        beachWaves.currentStore.initMovie(NoParams());
      }
    }
  }

  @action
  onLetGo() async {
    if (!isStillInMutualInstructionMode) {
      isHolding = false;
      letGoCount++;
      abortTheTextRotation = true;
      borderGlow.initGlowDown();
      holdTimerIndicator.onLetGo();
      beachWaves.setMovieMode(BeachWaveMovieModes.anyToHalfAndHalf);
      beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
      mirroredText.setWidgetVisibility(false);
    }
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
  MirroredTextOrientations get currentActiveOrientation =>
      MirroredTextOrientations.rightSideUp;

  @computed
  bool get isFirstTap => tapCount == 0;

  @computed
  bool get textIsDoneFadingInOrOut =>
      mirroredText.upsideDownIsDoneAnimating || isFirstTap;

  @computed
  bool get isStillInMutualInstructionMode => tapCount.isLessThan(2);
}
