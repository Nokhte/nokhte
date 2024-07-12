import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:simple_animations/simple_animations.dart';

mixin SingleInstructionalNokhteWidgetUtils
    on
        BaseWidgetsCoordinator,
        InstructionalNokhteWidgetUtils,
        HomeScreenWidgetsUtils,
        SmartTextPaddingAdjuster {
  NokhteBlurStore get nokhteBlur;
  SmartTextStore get primarySmartText;
  InstructionalGradientNokhteStore get focusInstructionalNokhte;
  GestureCrossStore get gestureCross;
  CenterInstructionalNokhteStore get centerInstructionalNokhte;
  @override
  TouchRippleStore get touchRipple;

  baseOnInitInstructionMode() {
    setHasInitiatedBlur(true);
    nokhteBlur.init();
    beachWaves.currentStore.setControl(Control.stop);
    primarySmartText.startRotatingText(isResuming: true);
    Timer(const Duration(seconds: 1, milliseconds: 500), () {
      focusInstructionalNokhte.setWidgetVisibility(true);
      setSmartTextBottomPaddingScalar(0);
      setSmartTextTopPaddingScalar(.13);
    });
    gestureCross.gradientNokhte.setWidgetVisibility(false);
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    centerInstructionalNokhte.moveToCenter(center);
  }

  initToTopInstructionalNokhte() {
    centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.top);
    focusInstructionalNokhte.setControl(Control.playFromStart);
    setSmartTextPadding(
      subMessagePadding: 110,
      bottomPadding: 0,
      topPadding: 0,
    );
    delayedEnableTouchFeedback();
    primarySmartText.startRotatingText(isResuming: true);
  }

  dismissInstructionalNokhte(
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
    primarySmartText.startRotatingText(isResuming: true);
    nokhteBlur.reverse();
    beachWaves.currentStore.setControl(Control.mirror);
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
      onDismiss();
    });
    //
    //
  }
}
