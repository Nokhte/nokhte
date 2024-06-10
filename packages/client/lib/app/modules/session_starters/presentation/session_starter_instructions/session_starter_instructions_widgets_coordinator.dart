// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_starter_instructions_widgets_coordinator.g.dart';

class SessionStarterInstructionsWidgetsCoordinator = _SessionStarterInstructionsWidgetsCoordinatorBase
    with _$SessionStarterInstructionsWidgetsCoordinator;

abstract class _SessionStarterInstructionsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore smartText;
  final GestureCrossStore gestureCross;
  final TouchRippleStore touchRipple;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final NokhteBlurStore nokhteBlur;
  final InstructionalGradientNokhteStore homeInstructionalNokhte;
  final InstructionalGradientNokhteStore presetsInstructionalNokhte;

  _SessionStarterInstructionsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.touchRipple,
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
    gestureCross.fadeIn(onFadeIn: Left(() {
      gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
    }));
    smartText.setMessagesData(SessionStartersList.hasNotDoneInstructions);
    beachWaves.setMovieMode(BeachWaveMovieModes.invertedOnShore);
    beachWaves.currentStore.setControl(Control.playFromStart);
    smartText.startRotatingText();
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
        smartText.startRotatingText(isResuming: true);
        gestureCross.cross.initOutlineFadeIn();
        centerInstructionalNokhte.setWidgetVisibility(false);
        gestureCross.initMoveAndRegenerate(CircleOffsets.left);
        beachWaves.setMovieMode(
          BeachWaveMovieModes.invertedOnShoreToInvertedDeeperBlue,
        );
        beachWaves.currentStore.initMovie(
          beachWaves.currentAnimationValues.first,
        );
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
      beachWaves
          .setMovieMode(BeachWaveMovieModes.invertedOnShoreToInvertedOceanDive);
      beachWaves.currentStore
          .initMovie(beachWaves.currentAnimationValues.first);
      await onLeaving();
    }
  }

  @action
  onSwipeCoordinatesChanged(Offset offset) {
    if ((beachWaves.movieStatus != MovieStatus.finished) ||
        smartText.currentIndex == 1) {
      touchRipple.onSwipe(offset);
    }
  }

  initReactors() {
    disposers.add(centerCrossNokhteReactor());
    disposers.add(gestureCrossTapReactor());
    disposers.add(beachWavesMovieStatusReactor());
    disposers.add(centerInstructionalNokhteReactor());
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected && readyToInteract) {
      if (!hasInitiatedBlur && !hasUnlockedSwipeLeft) {
        setTouchIsDisabled(true);
        hasSwipedDown = false;
        nokhteBlur.init();
        beachWaves.currentStore.setControl(Control.stop);
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
        beachWaves.currentStore.setControl(Control.mirror);
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
          homeInstructionalNokhte.setWidgetVisibility(false);
          presetsInstructionalNokhte.setWidgetVisibility(false);
        }
      });

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.invertedOnShore) {
            beachWaves.currentStore.setControl(Control.mirror);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShoreToInvertedOceanDive) {
            Modular.to.navigate(SessionStarterConstants.sessionStarterExit);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShoreToInvertedDeeperBlue) {
            Modular.to.navigate(SessionStarterConstants.presetsInstructions);
          }
        }
      });
  @computed
  bool get readyToInteract =>
      !hasSwipedDown &&
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
