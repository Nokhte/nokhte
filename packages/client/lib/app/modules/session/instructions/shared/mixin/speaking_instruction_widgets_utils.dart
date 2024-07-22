import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:simple_animations/simple_animations.dart';

mixin SpeakingInstructionsWidgetsUtils on SmartTextPaddingAdjuster {
  SmartTextStore get smartText;
  BeachWavesStore get beachWaves;
  BorderGlowStore get borderGlow;
  HoldTimerIndicatorStore get holdTimerIndicator;

  Stopwatch cooldownStopwatch = Stopwatch();

  adjustTextToHoldingPadding() {
    Timer(Seconds.get(0, milli: 500), () {
      setSmartTextPadding(
        excludeTimer: true,
        topPadding: 0,
        bottomPadding: 0.2,
        subMessagePadding: 0,
      );
    });
  }

  resetTextPadding() {
    setSmartTextPadding(
      excludeTimer: true,
      topPadding: .45,
      bottomPadding: 0,
      subMessagePadding: .3,
    );
    // setSmartTextTopPaddingScalar(.4);
    // setSmartTextBottomPaddingScalar(0);
    // setSmartTextSubMessagePaddingScalar(.3);
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
  initSpeakingMode() {
    if (canHold) {
      setCanHold(false);
      setAbortTheTextRotation(false);
      if (!speakingInstructionsComplete) {
        smartText.startRotatingText(isResuming: true);
        beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
        beachWaves.currentStore.initMovie(NoParams());
      }
    }
  }

  @action
  revertSpeakingMode() {
    setAbortTheTextRotation(true);
    borderGlow.initGlowDown();
    holdTimerIndicator.onLetGo();
    beachWaves.setMovieMode(BeachWaveMovieModes.anyToHalfAndHalf);
    beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
    smartText.setWidgetVisibility(false);
  }

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
        setSpeakingInstructionsComplete(true);
      }
    });
  }

  @action
  onEmptyCheckPointMessageReached(int index) {
    if (index == 3) {
      adjustTextToHoldingPadding();
    }
    Timer(const Duration(milliseconds: 500), () {
      if (!abortTheTextRotation && !speakingInstructionsComplete) {
        smartText.startRotatingText(isResuming: true);
      }
    });
  }

  beachWavesMovieStatusReactor({
    Function? onComplete,
    bool hasPostSpeakingInstructions = false,
  }) =>
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
                if (smartText.control == Control.playFromStart) {
                  resetTextPadding();
                  setCanHold(true);
                  smartText.setCurrentIndex(2);
                  smartText.setWidgetVisibility(true);
                  timer.cancel();
                }
              });
            } else {
              if (hasPostSpeakingInstructions) {
                smartText.setWidgetVisibility(true);
                setSmartTextTopPaddingScalar(0);
                setSmartTextBottomPaddingScalar(0.4);
                smartText.startRotatingText(isResuming: true);
                smartText.setStaticAltMovie(SessionConstants.white);
              } else {
                beachWaves
                    .setMovieMode(BeachWaveMovieModes.deepSeaToHalfAndHalf);
                beachWaves.currentStore.reverseMovie(NoParams());
              }
            }
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.deepSeaToHalfAndHalf) {
            onComplete?.call();
          }
        }
      });

  final _speakingInstructionsComplete = Observable(false);
  final _abortTheTextRotation = Observable(false);
  final _canHold = Observable(true);

  bool get speakingInstructionsComplete => _speakingInstructionsComplete.value;
  bool get abortTheTextRotation => _abortTheTextRotation.value;
  bool get canHold => _canHold.value;

  _setCanHold(bool value) => _canHold.value = value;

  _setSpeakingInstructionsComplete(bool value) =>
      _speakingInstructionsComplete.value = value;

  _setAbortTheTextRotation(bool value) => _abortTheTextRotation.value = value;

  Action actionSetSpeakingInstructionsComplete = Action(() {});
  Action actionSetAbortTheTextRotation = Action(() {});
  Action actionSetCanHold = Action(() {});

  initSpeakingInstructionUtils() {
    cooldownStopwatch.start();
    initSmartTextActions();
    actionSetCanHold = Action(_setCanHold);
    actionSetSpeakingInstructionsComplete =
        Action(_setSpeakingInstructionsComplete);
    actionSetAbortTheTextRotation = Action(_setAbortTheTextRotation);
    smartText.startRotatingText();
    smartText.setStaticAltMovie(SessionConstants.blue);
    resetTextPadding();
  }

  setCanHold(bool value) {
    actionSetCanHold([value]);
  }

  setSpeakingInstructionsComplete(bool value) {
    actionSetSpeakingInstructionsComplete([value]);
  }

  setAbortTheTextRotation(bool value) {
    actionSetAbortTheTextRotation([value]);
  }
}
