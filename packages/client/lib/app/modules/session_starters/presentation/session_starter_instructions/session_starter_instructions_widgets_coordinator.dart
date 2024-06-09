// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_starter_instructions_widgets_coordinator.g.dart';

class SessionStarterInstructionsWidgetsCoordinator = _SessionStarterInstructionsWidgetsCoordinatorBase
    with _$SessionStarterInstructionsWidgetsCoordinator;

abstract class _SessionStarterInstructionsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore primaryBeachWaves;
  final BeachWavesStore secondaryBeachWaves;
  final SmartTextStore smartText;
  final GestureCrossStore gestureCross;
  final TouchRippleStore touchRipple;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final NokhteBlurStore nokhteBlur;
  final InstructionalGradientNokhteStore homeInstructionalNokhte;
  final InstructionalGradientNokhteStore presetsInstructionalNokhte;

  _SessionStarterInstructionsWidgetsCoordinatorBase({
    required this.primaryBeachWaves,
    required this.touchRipple,
    required this.secondaryBeachWaves,
    required this.gestureCross,
    required this.smartText,
    required super.wifiDisconnectOverlay,
    required this.centerInstructionalNokhte,
    required this.nokhteBlur,
    required this.homeInstructionalNokhte,
    required this.presetsInstructionalNokhte,
  }) {
    setSmartTextTopPaddingScalar(0);
    setSmartTextBottomPaddingScalar(.27);
    setSmartTextSubMessagePaddingScalar(110);
  }

  @observable
  bool hasSwipedDown = false;

  @observable
  bool showSecondaryBeachWaves = false;

  @observable
  bool hasInitiatedBlur = false;

  @action
  setShowSecondaryBeachWaves(bool value) => showSecondaryBeachWaves = value;

  @observable
  bool hasUnlockedSwipeLeft = false;

  @action
  bool setHasUnlockedSwipeLeft(bool val) => hasUnlockedSwipeLeft = val;

  @action
  constructor(Offset centerParam) {
    center = centerParam;
    secondaryBeachWaves.setMovieMode(BeachWaveMovieModes.onShoreToOceanDive);
    gestureCross.fadeIn(onFadeIn: Left(() {
      gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
    }));
    smartText.setMessagesData(SessionStartersList.hasNotDoneInstructions);
    primaryBeachWaves.setMovieMode(BeachWaveMovieModes.anyToOnShore);
    primaryBeachWaves.currentStore.initMovie(
      const AnyToOnShoreParams(
        startingColors: WaterColorsAndStops.oceanDiveWater,
        endingColors: WaterColorsAndStops.invertedBeachWater,
      ),
    );
    homeInstructionalNokhte;
    presetsInstructionalNokhte.prepareYellowDiamond(
      center,
      position: InstructionalNokhtePositions.left,
      colorway: GradientNokhteColorways.deeperBlue,
    );
    initReactors();
  }

  @action
  onSwipeLeft() {
    if (centerInstructionalNokhte.movieStatus != MovieStatus.inProgress) {
      if (hasInitiatedBlur) {
        smartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.left);
        presetsInstructionalNokhte.setControl(Control.play);
        homeInstructionalNokhte.setWidgetVisibility(false);
        setSmartTextPadding();
      } else if (hasUnlockedSwipeLeft) {
        // TODO implement presets transition
      }
    }
  }

  @action
  onSwipeDown(Function onLeaving) async {
    if (!hasInitiatedBlur && !hasUnlockedSwipeLeft) {
      hasSwipedDown = true;
      smartText.setWidgetVisibility(false);
      homeInstructionalNokhte.setWidgetVisibility(false);
      centerInstructionalNokhte.setWidgetVisibility(false);
      gestureCross.fadeIn();
      gestureCross.initMoveAndRegenerate(CircleOffsets.bottom);
      primaryBeachWaves
          .setMovieMode(BeachWaveMovieModes.invertedOnShoreToInvertedOceanDive);
      primaryBeachWaves.currentStore
          .initMovie(primaryBeachWaves.currentAnimationValues.first);
      await onLeaving();
    }
  }

  @action
  onSwipeCoordinatesChanged(Offset offset) {
    if ((primaryBeachWaves.movieStatus != MovieStatus.finished) ||
        smartText.currentIndex == 1) {
      touchRipple.onSwipe(offset);
    }
  }

  initReactors() {
    disposers.add(primaryBeachWavesMovieStatusReactor());
    disposers.add(centerInstructionalNokhteReactor());
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected && readyToInteract) {
      if (!hasInitiatedBlur && !hasUnlockedSwipeLeft) {
        setTouchIsDisabled(true);
        hasSwipedDown = false;
        nokhteBlur.init();
        primaryBeachWaves.currentStore.setControl(Control.stop);
        homeInstructionalNokhte.setWidgetVisibility(true);
        homeInstructionalNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.beachWave,
            direction: InstructionalGradientDirections.enlarge,
            position: InstructionalNokhtePositions.bottom,
          ),
        );
        presetsInstructionalNokhte.setWidgetVisibility(true);
        hasInitiatedBlur = true;
        gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        gestureCross.gradientNokhte.setWidgetVisibility(false);
        smartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveToCenter(center);
      }
    }
  }

  @action
  onTap(Offset offset) {
    if (!touchIsDisabled) {
      if (smartText.currentIndex == 2) {
        touchRipple.onTap(offset);
        nokhteBlur.reverse();
        setTouchIsDisabled(true);
        primaryBeachWaves.currentStore.setControl(Control.mirror);
        setHasUnlockedSwipeLeft(true);

        Timer(Seconds.get(1, milli: 500), () {
          smartText.startRotatingText(isResuming: true);
          centerInstructionalNokhte.moveBackToCross(
            startingPosition: CenterNokhtePositions.left,
          );
          presetsInstructionalNokhte.initMovie(
            InstructionalGradientMovieParams(
              center: center,
              colorway: GradientNokhteColorways.deeperBlue,
              direction: InstructionalGradientDirections.shrink,
              position: InstructionalNokhtePositions.left,
            ),
          );
          homeInstructionalNokhte.setWidgetVisibility(true);
          homeInstructionalNokhte.initMovie(
            InstructionalGradientMovieParams(
              center: center,
              colorway: GradientNokhteColorways.beachWave,
              direction: InstructionalGradientDirections.shrink,
              position: InstructionalNokhtePositions.bottom,
            ),
          );
        });
        hasInitiatedBlur = false;
      }
    }
  }

  centerInstructionalNokhteReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            centerInstructionalNokhte.movieMode ==
                CenterInstructionalNokhteMovieModes.moveBack) {
          gestureCross.centerCrossNokhte.setWidgetVisibility(true);
          gestureCross.gradientNokhte.setWidgetVisibility(true);
          smartText.startRotatingText();
          hasSwipedDown = false;
          setTouchIsDisabled(false);
        }
      });

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        }
      });

  secondaryBeachWavesMovieStatusReactor(Function onNavigationHome) =>
      reaction((p0) => secondaryBeachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          onNavigationHome();
        }
      });

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  primaryBeachWavesMovieStatusReactor() =>
      reaction((p0) => primaryBeachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (primaryBeachWaves.movieMode == BeachWaveMovieModes.anyToOnShore) {
            primaryBeachWaves.setMovieMode(BeachWaveMovieModes.invertedOnShore);
            primaryBeachWaves.currentStore.setControl(Control.playFromStart);
            smartText.startRotatingText();
            centerCrossNokhteReactor();
            gestureCrossTapReactor();
          } else if (primaryBeachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShore) {
            primaryBeachWaves.currentStore.setControl(Control.mirror);
          } else if (primaryBeachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShoreToInvertedOceanDive) {
            setShowSecondaryBeachWaves(true);
            secondaryBeachWaves.currentStore.callsOnCompleteTwice = false;
            secondaryBeachWaves.currentStore.reverseMovie(0);
          }
        }
      });
  @computed
  bool get readyToInteract =>
      !hasSwipedDown &&
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
