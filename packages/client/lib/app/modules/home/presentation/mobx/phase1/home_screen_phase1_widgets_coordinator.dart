// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
part 'home_screen_phase1_widgets_coordinator.g.dart';

class HomeScreenPhase1WidgetsCoordinator = _HomeScreenPhase1WidgetsCoordinatorBase
    with _$HomeScreenPhase1WidgetsCoordinator;

abstract class _HomeScreenPhase1WidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _HomeScreenPhase1WidgetsCoordinatorBase({
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.primarySmartText,
    required super.errorSmartText,
    required super.secondaryErrorSmartText,
    required super.touchRipple,
    required super.centerInstructionalNokhte,
    required super.instructionalGradientNokhte,
  });

  @override
  @action
  constructor(Offset centerParam) {
    super.constructor(centerParam);
    primarySmartText.setMessagesData(MessagesData.firstTimeHomeList);
    primarySmartText.startRotatingText();
    gestureCross.fadeInTheCross();
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    instructionalGradientNokhte.prepareYellowDiamond(center);
    initReactors();
  }

  @action
  @override
  initReactors() {
    gestureCrossTapReactor();
    centerInstructionalNokhteReactor();
    super.initReactors();
  }

  @action
  onSwipeUp() {
    print("hi this registered");
    if (!touchIsDisabled) {
      if (primarySmartText.currentIndex.equals(3)) {
        centerInstructionalNokhte.moveUp();
        instructionalGradientNokhte.initMovie(NoParams());
        primarySmartText.startRotatingText(isResuming: true);
        setTouchIsDisabled(true);
        setSmartTextPadding(
          subMessagePadding: 110,
          bottomPadding: 0,
          topPadding: 0,
        );
      } else if (primarySmartText.currentIndex.equals(5)) {
        prepForNavigation(excludeUnBlur: true);
      }
    }
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @action
  @override
  onError(String errorMessage) {
    super.onError(errorMessage);
    gestureCross.gradientNokhte.setWidgetVisibility(false);
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
  }

  @action
  onTap(Offset offset) {
    if (!touchIsDisabled) {
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
      } else if (primarySmartText.currentIndex == 2) {
        setTouchIsDisabled(true);
        primarySmartText.startRotatingText(isResuming: true);
        instructionalGradientNokhte.setWidgetVisibility(true);
        touchRipple.onTap(offset);
        setSmartTextPadding();
      } else if (primarySmartText.currentIndex == 4) {
        primarySmartText.startRotatingText(isResuming: true);
        setTouchIsDisabled(true);
        Timer(Seconds.get(1, milli: 500), () {
          instructionalGradientNokhte.moveBack();
          centerInstructionalNokhte.moveBackFromTop();
        });
        beachWaves.currentStore.setControl(Control.mirror);
        nokhteBlur.reverse();
        touchRipple.onTap(offset);
      }
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
            instructionalGradientNokhte.setWidgetVisibility(false);
            setTouchIsDisabled(false);
          });
        }
      });

  @action
  onGestureCrossTap() {
    if (!hasInitiatedBlur && !isEnteringNokhteSession && !isInErrorMode) {
      nokhteBlur.init();
      beachWaves.currentStore.setControl(Control.stop);
      toggleHasInitiatedBlur();
      primarySmartText.startRotatingText(isResuming: true);
      setSmartTextPadding(subMessagePadding: 110, bottomPadding: .23);
    }
  }
}
