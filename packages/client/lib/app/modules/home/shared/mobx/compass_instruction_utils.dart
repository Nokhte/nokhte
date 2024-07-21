import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:simple_animations/simple_animations.dart';

mixin CompassInstructionUtils
    on
        SmartTextPaddingAdjuster,
        BaseWidgetsCoordinator,
        HomeScreenWidgetsUtils,
        Reactions {
  InstructionalGradientNokhteStore get focusInstructionalNokhte;
  SwipeGuideStore? get swipeGuide;
  NokhteBlurStore get nokhteBlur;

  onTap(
    Offset offset, {
    required GradientNokhteColorways colorway,
    required InstructionalNokhtePositions gradPosition,
    required CenterNokhtePositions centerPosition,
  }) async {
    if (!isDisconnected && !touchIsDisabled) {
      if (smartText.currentIndex == 1) {
        setTouchIsDisabled(true);
        smartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveToCenter(center);
        touchRipple.onTap(offset);
        setSmartTextPadding(
          topPadding: 0.15,
          bottomPadding: 0,
        );
        delayedEnableTouchFeedback();
      } else if (smartText.currentIndex == 2) {
        setTouchIsDisabled(true);
        smartText.startRotatingText(isResuming: true);
        focusInstructionalNokhte.setWidgetVisibility(true);
        swipeGuide?.setWidgetVisibility(true);
        touchRipple.onTap(offset);
        delayedEnableTouchFeedback();
      } else if (smartText.currentIndex == 4) {
        smartText.startRotatingText(isResuming: true);
        setSwipeDirection(GestureDirections.initial);
        setTouchIsDisabled(true);
        Timer(Seconds.get(1, milli: 500), () {
          focusInstructionalNokhte.initMovie(
            InstructionalGradientMovieParams(
              center: center,
              colorway: colorway,
              direction: InstructionalGradientDirections.shrink,
              position: gradPosition,
            ),
          );
          centerInstructionalNokhte.moveBackToCross(
            startingPosition: centerPosition,
          );
        });
        setHasInitiatedBlur(false);
        beachWaves.currentStore.setControl(Control.mirror);
        nokhteBlur.reverse();
        touchRipple.onTap(offset);
        setSmartTextPadding(
          bottomPadding: .2,
          topPadding: 0,
        );
        delayedEnableTouchFeedback();
      }
    }
  }

  initCompassInstructionUtils() {
    disposers.add(gestureCrossTapReactor());
    disposers.add(centerInstructionalNokhteReactor());
  }

  onGestureCrossTap() {
    if (!isDisconnected && !hasInitiatedBlur) {
      nokhteBlur.init();
      beachWaves.currentStore.setControl(Control.stop);
      setHasInitiatedBlur(true);
      smartText.startRotatingText(isResuming: true);
      setSmartTextPadding(subMessagePadding: 110);
      delayedEnableTouchFeedback();
    }
  }

  centerInstructionalNokhteReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            centerInstructionalNokhte.movieMode ==
                CenterInstructionalNokhteMovieModes.moveBack) {
          gestureCross.fadeIn();
          Timer(Seconds.get(1), () {
            centerInstructionalNokhte.setWidgetVisibility(false);
            focusInstructionalNokhte.setWidgetVisibility(false);
            setTouchIsDisabled(false);
          });
        }
      });

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );
}
