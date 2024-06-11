// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'presets_widgets_coordinator.g.dart';

class PresetsWidgetsCoordinator = _PresetsWidgetsCoordinatorBase
    with _$PresetsWidgetsCoordinator;

abstract class _PresetsWidgetsCoordinatorBase extends BaseWidgetsCoordinator
    with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore smartText;
  final GestureCrossStore gestureCross;
  final TouchRippleStore touchRipple;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final InstructionalGradientNokhteStore instructionalGradientNokhte;
  final NokhteBlurStore nokhteBlur;

  _PresetsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.touchRipple,
    required this.gestureCross,
    required this.smartText,
    required super.wifiDisconnectOverlay,
    required this.centerInstructionalNokhte,
    required this.instructionalGradientNokhte,
    required this.nokhteBlur,
  }) {
    setSmartTextTopPaddingScalar(.27);
    setSmartTextBottomPaddingScalar(0);
    setSmartTextSubMessagePaddingScalar(110);
  }

  @observable
  bool isEnteringNokhteSession = false;

  @observable
  bool hasSwipedDown = false;

  @observable
  bool showSecondaryBeachWaves = false;

  @observable
  bool hasInitiatedBlur = false;

  @observable
  bool invitationIsSent = false;

  @observable
  bool shouldDisableTouchRipple = false;

  @observable
  bool shouldEnterCollaboratorPool = false;

  @action
  toggleShouldEnterCollaboratorPool() =>
      shouldEnterCollaboratorPool = !shouldEnterCollaboratorPool;

  @action
  toggleInvitationIsSent() => invitationIsSent = !invitationIsSent;

  @action
  constructor(Offset centerParam) {
    center = centerParam;
    beachWaves.setMovieMode(BeachWaveMovieModes.staticInvertedDeeperBlue);
    gestureCross.fadeIn();
    gestureCross.cross.initStaticGlow();
    smartText.setMessagesData(SharedLists.empty);
    initReactors();
  }

  @action
  onSwipeDown(Function onLeaving) async {
    if (centerInstructionalNokhte.movieStatus != MovieStatus.inProgress) {
      if (hasInitiatedBlur) {
        hasInitiatedBlur = false;
        setSmartTextBottomPaddingScalar(.1);
        setSmartTextTopPaddingScalar(0);
        smartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte
            .initMovie(InstructionalNokhtePositions.bottom);
        setSmartTextPadding();
      } else {
        if (!hasSwipedDown) {
          hasSwipedDown = true;
          smartText.setWidgetVisibility(false);
          instructionalGradientNokhte.setWidgetVisibility(false);
          centerInstructionalNokhte.setWidgetVisibility(false);
          gestureCross.fadeIn();
          gestureCross.initMoveAndRegenerate(CircleOffsets.bottom);
          beachWaves.setMovieMode(
              BeachWaveMovieModes.invertedOnShoreToInvertedOceanDive);
          beachWaves.currentStore
              .initMovie(beachWaves.currentAnimationValues.first);
          await onLeaving();
        }
      }
    }
  }

  @action
  onSwipeCoordinatesChanged(Offset offset) {
    if (!shouldDisableTouchRipple) {
      if ((beachWaves.movieStatus != MovieStatus.finished) ||
          smartText.currentIndex == 1) {
        touchRipple.onSwipe(offset);
      }
    }
  }

  initReactors() {
    disposers.add(beachWavesMovieStatusReactor());
    disposers.add(centerInstructionalNokhteReactor());
    disposers.add(centerCrossNokhteReactor());
    disposers.add(gestureCrossTapReactor());
  }

  centerInstructionalNokhteReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            centerInstructionalNokhte.movieMode ==
                CenterInstructionalNokhteMovieModes.moveBack) {
          gestureCross.centerCrossNokhte.setWidgetVisibility(true);
          gestureCross.gradientNokhte.setWidgetVisibility(true);
          setSmartTextTopPaddingScalar(.27);
          setSmartTextBottomPaddingScalar(0);
          setSmartTextSubMessagePaddingScalar(110);
          // smartText.reset();
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

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.anyToOnShore) {
            beachWaves.setMovieMode(BeachWaveMovieModes.invertedOnShore);
            beachWaves.currentStore.setControl(Control.playFromStart);
            smartText.startRotatingText();
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShore) {
            beachWaves.currentStore.setControl(Control.mirror);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShoreToInvertedOceanDive) {
            // secondaryBeachWaves.currentStore.callsOnCompleteTwice = false;
            // secondaryBeachWaves.currentStore.reverseMovie(0);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShoreToInvertedDeepSea) {
            // Modular.to.navigate("/session/core/lobby", arguments: {
            //   "qrCodeData": qrCode.qrCodeData,
            // });
          }
        }
      });

  @action
  initTransition() {
    isEnteringNokhteSession = true;
    shouldDisableTouchRipple = true;
    hasSwipedDown = true;
    beachWaves
        .setMovieMode(BeachWaveMovieModes.invertedOnShoreToInvertedDeepSea);
    beachWaves.currentStore.initMovie(beachWaves.currentAnimationValues.first);
    smartText.setWidgetVisibility(false);
    gestureCross.fadeAllOut();
    centerInstructionalNokhte.setWidgetVisibility(false);
    instructionalGradientNokhte.setWidgetVisibility(false);
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @action
  dismissInstructionalNokhte() {
    hasSwipedDown = false;
    // qrCode.setWidgetVisibility(false);
    centerInstructionalNokhte.moveBackToCross(
      startingPosition: CenterNokhtePositions.center,
    );
    gestureCross.gradientNokhte.setWidgetVisibility(false);
    gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
    instructionalGradientNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.beachWave,
        direction: InstructionalGradientDirections.shrink,
        position: InstructionalNokhtePositions.bottom,
      ),
    );
    nokhteBlur.reverse();
    beachWaves.currentStore.setControl(Control.mirror);
    hasInitiatedBlur = false;
    smartText.reset();
    smartText.startRotatingText();
    setSmartTextPadding();
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected && readyToInteract) {
      if (!hasInitiatedBlur) {
        setTouchIsDisabled(true);
        hasSwipedDown = false;
        nokhteBlur.init();
        beachWaves.currentStore.setControl(Control.stop);
        // qrCode.setWidgetVisibility(false);

        hasInitiatedBlur = true;
        instructionalGradientNokhte.setWidgetVisibility(true);
        instructionalGradientNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.beachWave,
            direction: InstructionalGradientDirections.enlarge,
            position: InstructionalNokhtePositions.bottom,
          ),
        );
        gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        gestureCross.gradientNokhte.setWidgetVisibility(false);
        smartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveToCenter(center);
      } else if (hasInitiatedBlur) {
        dismissInstructionalNokhte();
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
        hasInitiatedBlur = false;
        smartText.startRotatingText(isResuming: true);

        Timer(Seconds.get(1, milli: 500), () {
          smartText.reset();
          centerInstructionalNokhte.moveBackToCross(
            startingPosition: CenterNokhtePositions.bottom,
          );
          instructionalGradientNokhte.initMovie(
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
    } else if (hasInitiatedBlur && readyToInteract) {
      dismissInstructionalNokhte();
      hasSwipedDown = false;
    }
  }

  @computed
  bool get readyToInteract =>
      !isEnteringNokhteSession &&
      !hasSwipedDown &&
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
