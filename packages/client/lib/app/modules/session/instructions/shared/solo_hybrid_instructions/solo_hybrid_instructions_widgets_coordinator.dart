// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'package:simple_animations/simple_animations.dart';
part 'solo_hybrid_instructions_widgets_coordinator.g.dart';

class SoloHybridInstructionsWidgetsCoordinator = _SoloHybridInstructionsWidgetsCoordinatorBase
    with _$SoloHybridInstructionsWidgetsCoordinator;

abstract class _SoloHybridInstructionsWidgetsCoordinatorBase
    with Store, SmartTextPaddingAdjuster, BaseWidgetsCoordinator, Reactions {
  final SmartTextStore smartText;
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final BorderGlowStore borderGlow;
  final HoldTimerIndicatorStore holdTimerIndicator;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SoloHybridInstructionsWidgetsCoordinatorBase({
    required this.wifiDisconnectOverlay,
    required this.smartText,
    required this.beachWaves,
    required this.touchRipple,
    required this.borderGlow,
    required this.holdTimerIndicator,
  }) {
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
    setSmartTextTopPaddingScalar(.15);
    setSmartTextBottomPaddingScalar(0);
    setSmartTextSubMessagePaddingScalar(.2);
  }

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @observable
  bool disableTouchInput = true;

  @observable
  int tapCount = 0;

  @observable
  bool hasReturnedToHome = true;

  @observable
  bool canHold = false;

  @observable
  int holdCount = 0;

  @observable
  int letGoCount = 0;

  @observable
  bool hasFinishedAllInstructions = false;

  @observable
  bool abortTheTextRotation = false;

  @observable
  bool speakingInstructionsComplete = false;

  @observable
  bool hasTriggeredFinalLetGo = false;

  @observable
  bool isHolding = false;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.invertedHalfAndHalfToDrySand);
    smartText.setMessagesData(SessionLists.soloHybridInstructions);
    initReactors();
    smartText.startRotatingText();
    cooldownStopwatch.start();
    disableTouchInput = false;
    resetSmartTextHoldingPadding();
  }

  initReactors() {
    disposers.add(smartTextIndexReactor());
    disposers.add(beachWavesMovieStatusReactor());
  }

  setDisableTouchInput(bool newValue) => disableTouchInput = newValue;

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) async {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode ==
              BeachWaveMovieModes.skyToInvertedHalfAndHalf) {
            borderGlow.initMovie(NoParams());
            holdTimerIndicator.initMovie(GesturePlacement.topHalf);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.anyToInvertedHalfAndHalf) {
            hasReturnedToHome = true;
            canHold = true;
            smartText.setWidgetVisibility(true);
            if (!speakingInstructionsComplete) {
              Timer.periodic(Seconds.get(0, milli: 550), (timer) {
                if (smartText.control == Control.playFromStart) {
                  resetSmartTextHoldingPadding();

                  smartText.setCurrentIndex(2);
                  smartText.setWidgetVisibility(true);
                  timer.cancel();
                }
              });
            } else {
              setSmartTextTopPaddingScalar(0);
              setSmartTextBottomPaddingScalar(0.4);
              smartText.startRotatingText(isResuming: true);
              smartText.setStaticAltMovie(SessionConstants.blue);
            }
          }
        }
      });

  @action
  adjustSmartTextToNotesPadding() {
    Timer(Seconds.get(0, milli: 500), () {
      setSmartTextTopPaddingScalar(0);
      setSmartTextBottomPaddingScalar(0.4);
    });
  }

  @action
  adjustSmartTextToHoldingPadding() {
    Timer(Seconds.get(0, milli: 500), () {
      setSmartTextTopPaddingScalar(0);
      setSmartTextBottomPaddingScalar(0.2);
    });
  }

  @action
  resetSmartTextHoldingPadding() {
    setSmartTextPadding(
      topPadding: 0.15,
      bottomPadding: 0,
      subMessagePadding: .2,
    );
  }

  @action
  onEmptyCheckPointMessageReached(int index) {
    if (index == 3) {
      adjustSmartTextToHoldingPadding();
    }
    Timer(const Duration(milliseconds: 500), () {
      if (!abortTheTextRotation && !speakingInstructionsComplete) {
        smartText.startRotatingText(isResuming: true);
      }
    });
  }

  smartTextIndexReactor() => reaction((p0) => smartText.currentIndex, (p0) {
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
        smartText.startRotatingText(isResuming: true);
      } else if (index == 6) {
        speakingInstructionsComplete = true;
        canHold = false;
        smartText.startRotatingText(isResuming: true);
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
      touchRipple.onTap(
        tapPosition,
        adjustColorBasedOnPosition: false,
      );
      if (hasTappedOnTheRightSide && textIsDoneFadingInOrOut && tapCount < 2) {
        smartText.startRotatingText(isResuming: true);
        if (tapCount == 1) {
          canHold = true;
        }
        tapCount++;
      } else if (speakingInstructionsComplete &&
          tapCount < 4 &&
          hasTriggeredFinalLetGo) {
        smartText.startRotatingText(isResuming: true);
        if (tapCount == 3) {
          hasFinishedAllInstructions = true;
          beachWaves
              .setMovieMode(BeachWaveMovieModes.deepSeaToInvertedHalfAndHalf);
          beachWaves.currentStore.reverseMovie(NoParams());
        }
        tapCount++;
      } else {
        if (!isHolding) {
          onHold();
        } else {
          onLetGo();
        }
      }
    }
  }

  Stopwatch holdStopwatch = Stopwatch();

  @action
  onHold() {
    if (holdCount == 0) {
      holdStopwatch.reset();
      hasReturnedToHome = false;
      isHolding = true;
      abortTheTextRotation = false;
      holdCount++;
      if (!speakingInstructionsComplete) {
        smartText.startRotatingText(isResuming: true);
        beachWaves.setMovieMode(BeachWaveMovieModes.skyToInvertedHalfAndHalf);
        beachWaves.currentStore.reverseMovie(NoParams());
      }
    }
  }

  @action
  onLetGo() async {
    if (speakingInstructionsComplete && letGoCount == 0) {
      cooldownStopwatch.reset();
      isHolding = false;
      letGoCount++;
      abortTheTextRotation = true;
      borderGlow.initGlowDown();
      holdTimerIndicator.onLetGo();
      beachWaves.setMovieMode(BeachWaveMovieModes.anyToInvertedHalfAndHalf);
      beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
      if (!speakingInstructionsComplete) {
        smartText.setWidgetVisibility(false);
      } else {
        smartText.startRotatingText(isResuming: true);
      }
      Timer(Seconds.get(2), () {
        if (!speakingInstructionsComplete) {
        } else {
          hasTriggeredFinalLetGo = true;
        }
      });
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
      smartText.movieStatus != MovieStatus.inProgress;

  @computed
  bool get isStillInMutualInstructionMode => tapCount.isLessThan(2);
}
