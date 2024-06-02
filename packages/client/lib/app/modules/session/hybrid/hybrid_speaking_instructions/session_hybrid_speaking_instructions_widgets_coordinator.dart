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
part 'session_hybrid_speaking_instructions_widgets_coordinator.g.dart';

class SessionHybridSpeakingInstructionsWidgetsCoordinator = _SessionHybridSpeakingInstructionsWidgetsCoordinatorBase
    with _$SessionHybridSpeakingInstructionsWidgetsCoordinator;

abstract class _SessionHybridSpeakingInstructionsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final MirroredTextStore mirroredText;
  final SmartTextStore errorSmartText;
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final BorderGlowStore borderGlow;
  final HoldTimerIndicatorStore holdTimerIndicator;
  final HalfScreenTintStore halfScreenTint;
  final TintStore tint;
  _SessionHybridSpeakingInstructionsWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required this.halfScreenTint,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.errorSmartText,
    required this.borderGlow,
    required this.holdTimerIndicator,
    required this.tint,
  });

  @action
  constructor() {
    resetUpsideDownHoldingPadding();
    beachWaves.setMovieMode(BeachWaveMovieModes.invertedHalfAndHalfToDrySand);
    mirroredText.setMessagesData(
      MirroredTextContent.sessionSpeakingHybridInstructions,
    );
    errorSmartText.setWidgetVisibility(false);
    errorSmartText.setMessagesData(SessionLists.speakingInstructionsError);
    errorSmartText.startRotatingText();
    halfScreenTint.setControl(Control.play);
    mirroredText.startBothRotatingText();
    cooldownStopwatch.start();
    disableTouchInput = false;
    initReactors();
  }

  @action
  initReactors() {
    disposers.add(upsideDownIndexReactor());
  }

  @observable
  bool phoneIsPickedUp = false;

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

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @observable
  bool disableTouchInput = true;

  @observable
  int holdCount = 0;

  @observable
  int letGoCount = 0;

  @observable
  bool speakingInstructionsComplete = false;

  @observable
  MirroredTextOrientations currentActiveOrientation =
      MirroredTextOrientations.upsideDown;

  @observable
  int tapCount = 0;

  @observable
  bool abortTheTextRotation = false;

  @observable
  bool canHold = true;

  setDisableTouchInput(bool newValue) => disableTouchInput = newValue;

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
  toggleCurrentActiveOrientation() => currentActiveOrientation =
      currentActiveOrientation == MirroredTextOrientations.rightSideUp
          ? MirroredTextOrientations.upsideDown
          : MirroredTextOrientations.rightSideUp;

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
  onHold(GesturePlacement holdPosition) {
    if (!isStillInMutualInstructionMode && canHold) {
      canHold = false;
      abortTheTextRotation = false;
      holdCount++;
      if (holdPosition == GesturePlacement.topHalf &&
          !speakingInstructionsComplete) {
        mirroredText.startRotatingUpsideDown(isResuming: true);
        beachWaves
            .setMovieMode(BeachWaveMovieModes.invertedHalfAndHalfToDrySand);
        beachWaves.currentStore.initMovie(NoParams());
        halfScreenTint.setControl(Control.playReverse);
        mirroredText.setRightSideUpVisibility(false);
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
      beachWaves.setMovieMode(BeachWaveMovieModes.anyToInvertedHalfAndHalf);
      beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
      mirroredText.setUpsideDownVisibility(false);
    }
    if (speakingInstructionsComplete) {
      await onFlowFinished();
    }
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
        overridedColor: SessionConstants.blue,
      );
      if (hasTappedOnTheRightSide && textIsDoneFadingInOrOut && tapCount < 2) {
        mirroredText.startRotatingUpsideDown(isResuming: true);
        tapCount++;
      }
    }
  }

  @action
  onEmptyCheckPointMessageReached(int index) {
    if (index == 3) {
      adjustUpsideDownToHoldingPadding();
    }
    Timer(const Duration(milliseconds: 500), () {
      //
      if (!abortTheTextRotation && !speakingInstructionsComplete) {
        mirroredText.startRotatingUpsideDown(isResuming: true);
        //
      }
    });
  }

  @action
  onNextMessageReached(int index) {
    Duration onScreenTime = Duration.zero;
    if (index == 4) {
      onScreenTime = Seconds.get(2);
    }
    Timer(onScreenTime, () {
      if (index == 4) {
        mirroredText.startRotatingUpsideDown(isResuming: true);
      } else if (index == 6) {
        speakingInstructionsComplete = true;
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

  beachWavesMovieStatusReactor(Function onFlowCompleted) =>
      reaction((p0) => beachWaves.movieStatus, (p0) async {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode ==
              BeachWaveMovieModes.invertedHalfAndHalfToDrySand) {
            borderGlow.initMovie(NoParams());
            holdTimerIndicator.initMovie(GesturePlacement.bottomHalf);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.anyToInvertedHalfAndHalf) {
            if (!speakingInstructionsComplete) {
              Timer.periodic(Seconds.get(0, milli: 550), (timer) {
                if (mirroredText.primaryUpsideDownText.control ==
                        Control.playFromStart &&
                    !phoneIsPickedUp) {
                  canHold = true;
                  mirroredText.setUpsideDownCurrentIndex(2);
                  mirroredText.setWidgetVisibility(true);
                  halfScreenTint.setControl(Control.play);
                  mirroredText.setPadding(
                    primaryUpsideDownTopPadding: .5,
                  );
                  timer.cancel();
                }
              });
            } else {
              await onFlowCompleted();
            }
          }
        }
      });

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
  bool get isLastTap => tapCount == 3;

  @computed
  bool get textIsDoneFadingInOrOut =>
      mirroredText.upsideDownIsDoneAnimating || isFirstTap;
}
