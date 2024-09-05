import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

mixin SingleInstructionalNokhteWidgetUtils
    on
        BaseWidgetsCoordinator,
        SwipeNavigationUtils,
        InstructionWidgetsUtils,
        SmartTextPaddingAdjuster {
  NokhteBlurStore get nokhteBlur;
  // InstructionalGradientNokhteStore? get focusInstructionalNokhte;
  BeachWavesStore get beachWaves;
  SmartTextStore get smartText;
  GestureCrossStore get gestureCross;
  TouchRippleStore get touchRipple;

  baseOnInitInstructionMode({
    bool excludePaddingAdjuster = false,
    bool excludeSmartTextRotation = false,
  }) {
    setHasInitiatedBlur(true);
    nokhteBlur.init();
    beachWaves.currentStore.setControl(Control.stop);
    if (!excludeSmartTextRotation) {
      smartText.startRotatingText(isResuming: true);
    }
    Timer(const Duration(seconds: 1, milliseconds: 500), () {
      // focusInstructionalNokhte?.setWidgetVisibility(true);
      if (!excludePaddingAdjuster) {
        setSmartTextBottomPaddingScalar(0);
        setSmartTextTopPaddingScalar(.13);
      }
    });
    // gestureCross.gradientNokhte.setWidgetVisibility(false);
    // gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    centerInstructionalNokhte.moveToCenter();
  }

  initToTopInstructionalNokhte({
    bool excludePaddingAdjuster = false,
  }) {
    if (isAllowedToMakeGesture()) {
      setSwipeDirection(GestureDirections.up);
      centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.top);
      // focusInstructionalNokhte?.setControl(Control.playFromStart);
      if (!excludePaddingAdjuster) {
        setSmartTextPadding(
          subMessagePadding: 110,
          bottomPadding: 0,
          topPadding: 0,
        );
      }
      delayedEnableTouchFeedback();
      smartText.startRotatingText(isResuming: true);
    }
  }

  initToBottomInstructionalNokhte() {
    setSwipeDirection(GestureDirections.down);
    setSmartTextBottomPaddingScalar(.1);
    smartText.startRotatingText(isResuming: true);
    setSmartTextTopPaddingScalar(0);
    centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.bottom);
  }

  initToRightInstructionalNokhte() {
    if (isAllowedToMakeGesture()) {
      setSwipeDirection(GestureDirections.left);
      centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.right);
      // focusInstructionalNokhte?.setControl(Control.playFromStart);
      smartText.startRotatingText(isResuming: true);
    }
  }

  initToLeftInstructionalNokhte() {
    if (isAllowedToMakeGesture()) {
      setSwipeDirection(GestureDirections.right);
      centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.left);
      // focusInstructionalNokhte?.setControl(Control.playFromStart);
      smartText.startRotatingText(isResuming: true);
    }
  }

  dismissMovedInstructionalNokhte(
    Offset offset, {
    required Function onDismiss,
    required GradientNokhteColorways colorway,
    required InstructionalNokhtePositions gradPosition,
    required CenterNokhtePositions centerPosition,
  }) {
    touchRipple.onTap(offset);
    setHasInitiatedBlur(false);
    setTouchIsDisabled(true);
    setSwipeDirection(GestureDirections.initial);
    smartText.startRotatingText(isResuming: true);
    nokhteBlur.reverse();
    beachWaves.currentStore.setControl(Control.mirror);
    Timer(Seconds.get(1, milli: 500), () {
      //   focusInstructionalNokhte?.initMovie(
      //        InstructionalGradientDirections.shrink,
      //   );
      centerInstructionalNokhte.moveBackToCross(
        startingPosition: centerPosition,
      );
      onDismiss();
    });
    //
    //
  }
}
