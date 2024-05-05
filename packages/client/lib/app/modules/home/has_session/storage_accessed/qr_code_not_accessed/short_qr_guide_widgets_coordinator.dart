// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:simple_animations/simple_animations.dart';
part 'short_qr_guide_widgets_coordinator.g.dart';

class ShortQrGuideWidgetsCoordinator = _ShortQrGuideWidgetsCoordinatorBase
    with _$ShortQrGuideWidgetsCoordinator;

abstract class _ShortQrGuideWidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _ShortQrGuideWidgetsCoordinatorBase({
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.primarySmartText,
    required super.errorSmartText,
    required super.secondaryErrorSmartText,
    required super.touchRipple,
    required super.centerInstructionalNokhte,
    required super.primaryInstructionalGradientNokhte,
    required super.secondaryInstructionalGradientNokhte,
  });

  @observable
  bool gracePeriodHasExpired = false;

  @observable
  bool hasTappedOnCross = false;

  @action
  toggleGracePeriodHasExpired() =>
      gracePeriodHasExpired = !gracePeriodHasExpired;

  @override
  @action
  constructor(Offset offset) {
    super.constructor(offset);
    touchIsDisabled = true;
    gestureCross.fadeIn();
    primarySmartText.setMessagesData(HomeLists.shortQrGuide);
    primarySmartText.startRotatingText();
    primaryInstructionalGradientNokhte.setWidgetVisibility(false);
    primaryInstructionalGradientNokhte.prepareYellowDiamond(
      center,
      position: InstructionalNokhtePositions.top,
      colorway: GradientNokhteColorways.invertedBeachWave,
    );
    initReactors();
  }

  @action
  @override
  initReactors() {
    super.initReactors();
    gestureCrossTapReactor();
    centerCrossNokhteReactor(() {
      primaryInstructionalGradientNokhte.setWidgetVisibility(false);
      secondaryInstructionalGradientNokhte.setWidgetVisibility(false);
    });
    centerInstructionalNokhteMovieReactor();
  }

  @action
  onSwipeUp() {
    if (!isDisconnected && isAllowedToMakeAGesture) {
      if (hasInitiatedBlur && !hasSwipedUp) {
        hasSwipedUp = true;
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.top);
        primaryInstructionalGradientNokhte.setControl(Control.playFromStart);
        secondaryInstructionalGradientNokhte.setWidgetVisibility(false);
        setSmartTextPadding(
          subMessagePadding: 110,
          bottomPadding: 0,
          topPadding: 0,
        );
        touchIsDisabled = false;
        primarySmartText.startRotatingText(isResuming: true);
      } else if (!hasInitiatedBlur && !hasSwipedUp && hasTappedOnCross) {
        prepForNavigation(excludeUnBlur: !hasInitiatedBlur);
      }
    }
  }

  @action
  onTap(Offset offset) {
    if (!isDisconnected && isAllowedToMakeAGesture) {
      if (!touchIsDisabled) {
        touchRipple.onTap(offset);
        hasInitiatedBlur = false;
        touchIsDisabled = true;
        hasSwipedUp = false;
        primarySmartText.startRotatingText(isResuming: true);
        nokhteBlur.reverse();
        beachWaves.currentStore.setControl(Control.mirror);
        Timer(Seconds.get(1, milli: 500), () {
          primaryInstructionalGradientNokhte.initMovie(
            InstructionalGradientMovieParams(
              center: center,
              colorway: GradientNokhteColorways.invertedBeachWave,
              direction: InstructionalGradientDirections.shrink,
              position: InstructionalNokhtePositions.top,
            ),
          );
          centerInstructionalNokhte.moveBackToCross(
            startingPosition: CenterNokhtePositions.top,
          );
          secondaryInstructionalGradientNokhte.setWidgetVisibility(true);
          secondaryInstructionalGradientNokhte.initMovie(
            InstructionalGradientMovieParams(
              center: center,
              colorway: GradientNokhteColorways.vibrantBlue,
              direction: InstructionalGradientDirections.shrink,
              position: InstructionalNokhtePositions.right,
            ),
          );
        });
        //
      }
    }
    //
  }

  centerInstructionalNokhteMovieReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            centerInstructionalNokhte.movieMode ==
                CenterInstructionalNokhteMovieModes.moveBack) {
          gestureCross.centerCrossNokhte.setWidgetVisibility(true);
          //
        }
      });

  @action
  onSwipeRight() {
    if (!isDisconnected && !hasInitiatedBlur && !hasSwipedUp) {
      hasSwipedUp = true;
      beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToVibrantBlue);
      beachWaves.currentStore.initMovie(
        beachWaves.currentAnimationValues.first,
      );
      hasTappedOnCross = true;
      gestureCross.initMoveAndRegenerate(CircleOffsets.right);
      gestureCross.cross.initOutlineFadeIn();
      primarySmartText.setWidgetVisibility(false);
    }
  }

  @action
  onInitInstructionMode() {
    hasInitiatedBlur = true;
    nokhteBlur.init();
    beachWaves.currentStore.setControl(Control.stop);
    primarySmartText.startRotatingText(isResuming: true);

    Timer(const Duration(seconds: 1, milliseconds: 500), () {
      setSmartTextBottomPaddingScalar(0);
      setSmartTextTopPaddingScalar(.13);
      primaryInstructionalGradientNokhte.setWidgetVisibility(true);
    });

    secondaryInstructionalGradientNokhte.setWidgetVisibility(true);
    secondaryInstructionalGradientNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.vibrantBlue,
        direction: InstructionalGradientDirections.enlarge,
        position: InstructionalNokhtePositions.right,
      ),
    );
    gestureCross.gradientNokhte.setWidgetVisibility(false);
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    centerInstructionalNokhte.moveToCenter(center);
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected &&
        isAllowedToMakeAGesture &&
        !hasInitiatedBlur &&
        !hasTappedOnCross) {
      onInitInstructionMode();
      hasTappedOnCross = true;
    }
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @computed
  bool get isAllowedToMakeAGesture =>
      !isEnteringNokhteSession &&
      !isInErrorMode &&
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
