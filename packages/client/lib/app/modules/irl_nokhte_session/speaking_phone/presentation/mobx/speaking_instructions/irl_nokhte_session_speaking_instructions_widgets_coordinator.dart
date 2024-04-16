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
import 'package:simple_animations/simple_animations.dart';
part 'irl_nokhte_session_speaking_instructions_widgets_coordinator.g.dart';

class IrlNokhteSessionSpeakingInstructionsWidgetsCoordinator = _IrlNokhteSessionSpeakingInstructionsWidgetsCoordinatorBase
    with _$IrlNokhteSessionSpeakingInstructionsWidgetsCoordinator;

abstract class _IrlNokhteSessionSpeakingInstructionsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final MirroredTextStore mirroredText;
  final SmartTextStore errorSmartText;
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final BorderGlowStore borderGlow;
  final HoldTimerIndicatorStore holdTimerIndicator;
  final TintStore tint;
  _IrlNokhteSessionSpeakingInstructionsWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.errorSmartText,
    required this.borderGlow,
    required this.holdTimerIndicator,
    required this.tint,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    beachWaves.currentStore.initMovie(NoParams());
    mirroredText.setMessagesData(
      MirroredTextContentOptions.irlNokhteSessionSpeakingInstructions,
    );
    errorSmartText.setWidgetVisibility(false);
    errorSmartText.setMessagesData(MessagesData.speakingInstructionsErrorList);
    errorSmartText.startRotatingText();
    initReactors();
  }

  @action
  initReactors() {
    beachWavesMovieStatusReactor();
    upsideDownIndexReactor();
    rightSideUpIndexReactor();
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
  bool topHalfIsDone = false;

  @observable
  bool bottomHalfIsDone = false;

  @observable
  bool bottomHalfHasStarted = false;

  @observable
  MirroredTextOrientations currentActiveOrientation =
      MirroredTextOrientations.rightSideUp;

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
      primaryUpsideDownTopPadding: .12,
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
    mirroredText.setRightsideUpVisibility(
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
      DurationAndGradient params = DurationAndGradient.initial();
      if (holdPosition == GesturePlacement.topHalf &&
          bottomHalfIsDone &&
          !topHalfIsDone) {
        mirroredText.startRotatingUpsideDown(isResuming: true);
        params = DurationAndGradient(
          gradient: beachWaves.currentColorsAndStops,
          duration: const Duration(seconds: 2),
        );
        beachWaves.setMovieMode(BeachWaveMovieModes.anyToVibrantBlueGrad);
        beachWaves.currentStore.initMovie(params);
      } else if (holdPosition == GesturePlacement.bottomHalf &&
          !bottomHalfIsDone) {
        beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
        beachWaves.currentStore.initMovie(NoParams());
        mirroredText.startRotatingRightSideUp(isResuming: true);
      }
      if (!bottomHalfIsDone) {
      } else if (bottomHalfIsDone && !topHalfIsDone) {}
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
      beachWaves.setMovieMode(BeachWaveMovieModes.dynamicPointToHalfAndHalf);
      beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
      if (!bottomHalfIsDone) {
        mirroredText.setWidgetVisibility(false);
      } else if (bottomHalfIsDone && !topHalfIsDone) {
        mirroredText.setUpsideDownVisibility(false);
      } else if (bottomHalfIsDone && topHalfIsDone) {
        await onFlowFinished();
      }
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
      touchRipple.onTap(tapPosition, adjustColorBasedOnPosition: true);
      if (hasTappedOnTheRightSide && textIsDoneFadingInOrOut) {
        toggleCurrentActiveOrientation();
        if (isFirstTap) {
          mirroredText.startRotatingUpsideDown();
          mirroredText.startRotatingRightSideUp(isResuming: true);
        } else if (isStillInMutualInstructionMode) {
          mirroredText.startBothRotatingText(isResuming: true);
        }
        tapCount++;
      }
    }
  }

  @action
  onEmptyCheckPointMessageReached(int index) {
    if (index == 5 && !bottomHalfIsDone) {
      adjustRightSideToHoldingPadding();
    }
    if (index == 11) {
      Timer(
        Seconds.get(1),
        () => Modular.to.navigate('/irl_nokhte_session/speaking'),
      );
      return;
    }
    Timer(const Duration(milliseconds: 500), () {
      if (!abortTheTextRotation) {
        if (!bottomHalfIsDone) {
          mirroredText.startRotatingRightSideUp(isResuming: true);
        } else if (bottomHalfIsDone && !topHalfIsDone && bottomHalfHasStarted) {
          adjustUpsideDownToHoldingPadding();
          mirroredText.startRotatingUpsideDown(isResuming: true);
        }
      }
    });
  }

  @action
  onNextMessageReached(int index) {
    Duration onScreenTime = Duration.zero;
    if (index == 6) {
      onScreenTime = const Duration(seconds: 2, milliseconds: 500);
    } else if (index == 8) {
      onScreenTime = const Duration(seconds: 1);
    }
    Timer(onScreenTime, () {
      if (!abortTheTextRotation || index == 8) {
        if (!bottomHalfIsDone) {
          mirroredText.startRotatingRightSideUp(isResuming: true);
          if (index == 8) {
            bottomHalfIsDone = true;
          }
        } else if (bottomHalfIsDone && !topHalfIsDone) {
          mirroredText.startRotatingUpsideDown(isResuming: true);
          if (index == 8) {
            canHold = false;
            topHalfIsDone = true;
          }
        }
      }
    });
  }

  upsideDownIndexReactor() =>
      reaction((p0) => mirroredText.primaryUpsideDownText.currentIndex, (p0) {
        if (p0.isGreaterThan(4)) {
          if (p0.isOdd) {
            onEmptyCheckPointMessageReached(p0);
          } else if (p0.isEven) {
            onNextMessageReached(p0);
          }
        }
      });

  rightSideUpIndexReactor() =>
      reaction((p0) => mirroredText.primaryRightSideUpText.currentIndex, (p0) {
        if (p0.isGreaterThan(4)) {
          if (p0.isOdd) {
            onEmptyCheckPointMessageReached(p0);
          } else if (p0.isEven) {
            onNextMessageReached(p0);
          }
        }
      });

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode ==
              BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf) {
            if (!topHalfIsDone) {
              mirroredText.startRotatingRightSideUp();
              cooldownStopwatch.start();
              disableTouchInput = false;
            }
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.anyToVibrantBlueGrad) {
            if (!phoneIsPickedUp) {
              borderGlow.initMovie(NoParams());
              holdTimerIndicator.initMovie(GesturePlacement.topHalf);
            }
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.halfAndHalfToDrySand) {
            if (!phoneIsPickedUp) {
              borderGlow.initMovie(NoParams());
              holdTimerIndicator.initMovie(GesturePlacement.bottomHalf);
            }
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.dynamicPointToHalfAndHalf) {
            if (!bottomHalfIsDone) {
              mirroredText.prepForSplitScreen();
              Timer.periodic(Seconds.get(0, milli: 550), (timer) {
                if (mirroredText.primaryRightSideUpText.control ==
                        Control.playFromStart &&
                    !phoneIsPickedUp) {
                  resetRightSideHoldingPadding();
                  mirroredText.setRightsideUpCurrentIndex(3);
                  mirroredText.startRotatingRightSideUp(isResuming: true);
                  mirroredText.setRightsideUpVisibility(true);
                  canHold = true;
                  timer.cancel();
                }
              });
            } else if (bottomHalfIsDone && !topHalfIsDone) {
              canHold = true;
              if (!bottomHalfHasStarted) {
                resetRightSideHoldingPadding();
                bottomHalfHasStarted = true;
                holdCount = 0;
                letGoCount = 0;
                mirroredText.setUpsideDownVisibility(true);
                mirroredText.startRotatingUpsideDown(isResuming: true);
              } else {
                Timer.periodic(Seconds.get(0, milli: 550), (timer) {
                  if (mirroredText.primaryUpsideDownText.control ==
                          Control.playFromStart &&
                      !phoneIsPickedUp) {
                    resetUpsideDownHoldingPadding();
                    mirroredText.setUpsideDownCurrentIndex(3);
                    mirroredText.startRotatingUpsideDown(isResuming: true);
                    mirroredText.setUpsideDownVisibility(true);
                    timer.cancel();
                  }
                });
              }
            } else if (bottomHalfIsDone && topHalfIsDone) {
              Modular.to.navigate("/irl_nokhte_session/speaking_waiting");
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
  bool get isStillInMutualInstructionMode => tapCount.isLessThan(4);

  @computed
  bool get isFirstTap => tapCount == 0;

  @computed
  bool get isLastTap => tapCount == 3;

  @computed
  bool get textIsDoneFadingInOrOut =>
      mirroredText.textIsDoneAnimating || isFirstTap;
}
