// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'irl_nokhte_session_speaking_instructions_widgets_coordinator.g.dart';

class IrlNokhteSessionSpeakingInstructionsWidgetsCoordinator = _IrlNokhteSessionSpeakingInstructionsWidgetsCoordinatorBase
    with _$IrlNokhteSessionSpeakingInstructionsWidgetsCoordinator;

abstract class _IrlNokhteSessionSpeakingInstructionsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final BorderGlowStore borderGlow;
  _IrlNokhteSessionSpeakingInstructionsWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.borderGlow,
  });

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @observable
  bool disableTouchInput = true;

  @observable
  int holdCount = 0;

  @observable
  Stopwatch letGoStopwatch = Stopwatch();

  @observable
  Stopwatch holdStopwatch = Stopwatch();

  @observable
  bool topHalfIsDone = false;

  @observable
  bool bottomHalfIsDone = false;

  @observable
  bool bottomHalfHasStarted = false;

  @action
  setDisableTouchInput(bool newValue) => disableTouchInput = newValue;

  @observable
  MirroredTextOrientations currentActiveOrientation =
      MirroredTextOrientations.rightSideUp;

  @observable
  int tapCount = 0;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    beachWaves.currentStore.initMovie(NoParams());
    mirroredText.setMessagesData(
      MirroredTextContentOptions.irlNokhteSessionSpeakingInstructions,
    );
    initReactors();
  }

  @action
  initReactors() {
    beachWavesMovieStatusReactor();
    upsideDownIndexReactor();
    rightSideUpIndexReactor();
  }

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

  rightSideUpIndexReactor() =>
      reaction((p0) => mirroredText.primaryRightSideUpText.currentIndex, (p0) {
        if (p0 == 3) {
          mirroredText.setRightSideUpColor(Colors.white);
        } else if (p0 == 4) {
          bottomHalfIsDone = true;
        } else if (p0 == 5) {
          mirroredText.setRightsideUpVisibility(false);
        } else if (p0 == 7) {
          Modular.to.navigate("/irl_nokhte_session/speaking");
        }
      });

  upsideDownIndexReactor() =>
      reaction((p0) => mirroredText.primaryUpsideDownText.currentIndex, (p0) {
        if (p0 == 4) {
          topHalfIsDone = true;
          mirroredText.prepForSplitScreen();
        } else if (p0 == 5) {
          mirroredText.setRightsideUpVisibility(true);
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
            borderGlow.initMovie(NoParams());
            if (!bottomHalfIsDone) {
              mirroredText.setRightSideUpColor(Colors.white);
            }
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.dynamicPointToHalfAndHalf) {
            if (!bottomHalfIsDone && !topHalfIsDone) {
              mirroredText.prepForSplitScreen();
              mirroredText.setRightsideUpCurrentIndex(1);
              mirroredText.setRightsideUpVisibility(true);
            } else if (bottomHalfIsDone && !topHalfIsDone) {
              mirroredText.setUpsideDownCurrentIndex(1);
              mirroredText.setUpsideDownVisibility(true);
              if (!bottomHalfHasStarted) {
                mirroredText.startRotatingUpsideDown(isResuming: true);
                bottomHalfHasStarted = true;
              }
            } else if (bottomHalfIsDone && topHalfIsDone) {
              mirroredText.setWidgetVisibility(true);
            }
          }
        }
      });

  @action
  onHold() {
    holdCount++;
    DurationAndGradient params = DurationAndGradient.initial();
    params = DurationAndGradient(
      gradient: beachWaves.currentColorsAndStops,
      duration: const Duration(seconds: 2),
    );

    beachWaves.setMovieMode(BeachWaveMovieModes.anyToVibrantBlueGrad);
    beachWaves.currentStore.initMovie(params);
    if (!bottomHalfIsDone) {
      mirroredText.resumeRightsideUp();
      mirroredText.startRotatingRightSideUp(isResuming: true);
    } else if (bottomHalfIsDone && !topHalfIsDone) {
      mirroredText.resumeUpsideDown();
      mirroredText.startRotatingUpsideDown(isResuming: true);
    }
  }

  @action
  onLetGo({
    required Function onFlowFinished,
  }) async {
    borderGlow.initGlowDown();
    beachWaves.setMovieMode(BeachWaveMovieModes.dynamicPointToHalfAndHalf);
    beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
    if (!bottomHalfIsDone) {
      mirroredText.setWidgetVisibility(false);
      mirroredText.pauseRightsideUp();
    } else if (bottomHalfIsDone && !topHalfIsDone) {
      mirroredText.setUpsideDownVisibility(false);
      mirroredText.pauseUpsideDown();
    } else if (bottomHalfIsDone && topHalfIsDone) {
      await onFlowFinished();
    }
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
  bool get isStillInMutualInstructionMode => tapCount.isLessThan(2);

  @computed
  bool get isFirstTap => tapCount == 0;

  @computed
  bool get isLastTap => tapCount == 3;

  @computed
  bool get textIsDoneFadingInOrOut =>
      mirroredText.textIsDoneAnimating || isFirstTap;
}
