import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:simple_animations/simple_animations.dart';

mixin CompassInstructionUtils
    on
        SmartTextPaddingAdjuster,
        BaseWidgetsCoordinator,
        HomeScreenWidgetsUtils {
  SmartTextStore get primarySmartText;
  CenterInstructionalNokhteStore get centerInstructionalNokhte;
  InstructionalGradientNokhteStore get focusInstructionalNokhte;
  TouchRippleStore get touchRipple;
  SwipeGuideStore? get swipeGuide;
  NokhteBlurStore get nokhteBlur;

  //

  onTap(
    Offset offset, {
    required GradientNokhteColorways colorway,
    required InstructionalNokhtePositions gradPosition,
    required CenterNokhtePositions centerPosition,
  }) async {
    if (!isDisconnected && !touchIsDisabled) {
      if (primarySmartText.currentIndex == 1) {
        setTouchIsDisabled(true);
        primarySmartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveToCenter(center);
        touchRipple.onTap(offset);
        setSmartTextPadding(
          subMessagePadding: 80,
          topPadding: 0.1,
          bottomPadding: 0,
        );
        delayedEnableTouchFeedback();
      } else if (primarySmartText.currentIndex == 2) {
        setTouchIsDisabled(true);
        primarySmartText.startRotatingText(isResuming: true);
        focusInstructionalNokhte.setWidgetVisibility(true);
        swipeGuide?.setWidgetVisibility(true);
        touchRipple.onTap(offset);
        delayedEnableTouchFeedback();
      } else if (primarySmartText.currentIndex == 4) {
        primarySmartText.startRotatingText(isResuming: true);
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
        // await onFlowCompleted();
      }
    }
  }
}
