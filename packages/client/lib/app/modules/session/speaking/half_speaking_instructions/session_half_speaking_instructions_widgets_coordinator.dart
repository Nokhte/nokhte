// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_half_speaking_instructions_widgets_coordinator.g.dart';

class HalfSessionSpeakingInstructionsWidgetsCoordinator = _HalfSessionSpeakingInstructionsWidgetsCoordinatorBase
    with _$HalfSessionSpeakingInstructionsWidgetsCoordinator;

abstract class _HalfSessionSpeakingInstructionsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final MirroredTextStore mirroredText;
  final SmartTextStore errorSmartText;
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final BorderGlowStore borderGlow;
  final HalfScreenTintStore halfScreenTint;
  final HoldTimerIndicatorStore holdTimerIndicator;
  final TintStore tint;
  _HalfSessionSpeakingInstructionsWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.halfScreenTint,
    required this.touchRipple,
    required this.errorSmartText,
    required this.borderGlow,
    required this.holdTimerIndicator,
    required this.tint,
  });

  @observable
  bool instructionsOnTop = true;

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
  bool phoneIsPickedUp = false;

  @action
  constructor({
    required bool instructionsOnTop,
  }) {
    this.instructionsOnTop = instructionsOnTop;
    if (!instructionsOnTop) {
      halfScreenTint.setShouldCoverBottom(false);
    }
    beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
    mirroredText.setMessagesData(
      instructionsOnTop
          ? MirroredTextContent.sessionSpeakingTopHalfInstructions
          : MirroredTextContent.sessionSpeakingBottomHalfInstructions,
    );
    errorSmartText.setWidgetVisibility(false);
    errorSmartText.setMessagesData(SessionLists.speakingInstructionsError);
    errorSmartText.startRotatingText();
    initReactors();
    mirroredText.startBothRotatingText();
    halfScreenTint.initMovie(NoParams());
    cooldownStopwatch.start();
    disableTouchInput = false;
  }

  initReactors() {
    disposers.add(beachWavesMovieStatusReactor());
    disposers.add(rightSideUpIndexReactor());
    disposers.add(upsideDownIndexReactor());
  }

  setDisableTouchInput(bool newValue) => disableTouchInput = newValue;

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) async {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode ==
              BeachWaveMovieModes.halfAndHalfToDrySand) {
            borderGlow.initMovie(NoParams());
            holdTimerIndicator.initMovie(GesturePlacement.bottomHalf);
          } else if (beachWaves.movieMode == BeachWaveMovieModes.anyToSky) {
            if (!phoneIsPickedUp) {
              borderGlow.initMovie(NoParams());
              holdTimerIndicator.initMovie(GesturePlacement.topHalf);
            }
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.anyToHalfAndHalf) {
            if (!speakingInstructionsComplete) {
              Timer.periodic(Seconds.get(0, milli: 550), (timer) {
                if (!instructionsOnTop) {
                  if (mirroredText.primaryRightSideUpText.control ==
                          Control.playFromStart &&
                      !phoneIsPickedUp) {
                    resetRightSideHoldingPadding();
                    resetUpsideDownHoldingPadding();
                    mirroredText.setUpsideDownVisibility(true); //
                    halfScreenTint.initMovie(NoParams());
                    canHold = true;
                    mirroredText.setRightsideUpCurrentIndex(2);
                    mirroredText.setWidgetVisibility(true);
                    resetRightSideHoldingPadding();
                    timer.cancel();
                  }
                } else {
                  if (mirroredText.primaryUpsideDownText.control ==
                          Control.playFromStart &&
                      !phoneIsPickedUp) {
                    resetRightSideHoldingPadding();
                    resetUpsideDownHoldingPadding();
                    mirroredText.setRightSideUpVisibility(true); //
                    halfScreenTint.initMovie(NoParams());
                    canHold = true;
                    mirroredText.setUpsideDownCurrentIndex(2);
                    mirroredText.setWidgetVisibility(true);
                    timer.cancel();
                    //
                  }
                }
              });
            } else {
              Modular.to.navigate(SessionConstants.speakingWaiting);
            }
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
      // if (instructionsOnTop) {
      adjustUpsideDownToHoldingPadding();
      // } else {
      adjustRightSideToHoldingPadding();
      // }
    }
    Timer(const Duration(milliseconds: 500), () {
      if (!abortTheTextRotation && !speakingInstructionsComplete) {
        if (!instructionsOnTop) {
          mirroredText.startRotatingRightSideUp(isResuming: true);
        } else {
          mirroredText.startRotatingUpsideDown(isResuming: true);
        }
      }
    });
  }

  @action
  onPhonePickup() {
    phoneIsPickedUp = true;
    mirroredText.setWidgetVisibility(false);
    holdTimerIndicator.setWidgetVisibility(false);
    errorSmartText.setWidgetVisibility(true);
    tint.setControl(Control.play);
    canHold = false;
    disableTouchInput = true;
    if (holdCount.isGreaterThan(letGoCount)) {
      onLetGo(onFlowFinished: () {});
    }
  }

  @action
  onPutDown() {
    phoneIsPickedUp = false;
    tint.setControl(Control.playReverse);
    errorSmartText.setWidgetVisibility(false);
    if (holdCount == 0) {
      mirroredText.setWidgetVisibility(mirroredText.pastShowWidget);
    }
    canHold = true;
    disableTouchInput = false;
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
        if (!instructionsOnTop) {
          mirroredText.startRotatingRightSideUp(isResuming: true);
        } else {
          mirroredText.startRotatingUpsideDown(isResuming: true);
        }
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
        if (instructionsOnTop) {
          mirroredText.startRotatingUpsideDown(isResuming: true);
        } else {
          mirroredText.startRotatingRightSideUp(isResuming: true);
        }
        tapCount++;
      }
    }
  }

  @action
  onHold(GesturePlacement holdPosition) {
    if (!isStillInMutualInstructionMode && canHold) {
      halfScreenTint.reverseMovie(NoParams());
      if (instructionsOnTop) {
        mirroredText.setRightSideUpVisibility(false);
      } else {
        mirroredText.setUpsideDownVisibility(false);
      }
      canHold = false;
      abortTheTextRotation = false;
      holdCount++;
      if (holdPosition == GesturePlacement.bottomHalf &&
          !speakingInstructionsComplete) {
        mirroredText.startRotatingRightSideUp(isResuming: true);
        beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
        beachWaves.currentStore.initMovie(NoParams());
      } else {
        mirroredText.startRotatingUpsideDown(isResuming: true);
        beachWaves.setMovieMode(BeachWaveMovieModes.anyToSky);
        beachWaves.currentStore.initMovie(DurationAndGradient(
          gradient: beachWaves.currentColorsAndStops,
          duration: const Duration(seconds: 2),
        ));
      }
    }
  }

  @action
  onLetGo({
    required Function onFlowFinished,
  }) async {
    if (!isStillInMutualInstructionMode) {
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
  MirroredTextOrientations get currentActiveOrientation => instructionsOnTop
      ? MirroredTextOrientations.upsideDown
      : MirroredTextOrientations.rightSideUp;

  @computed
  bool get isFirstTap => tapCount == 0;

  @computed
  bool get textIsDoneFadingInOrOut =>
      mirroredText.upsideDownIsDoneAnimating || isFirstTap;

  @computed
  bool get isStillInMutualInstructionMode => tapCount.isLessThan(2);
}
