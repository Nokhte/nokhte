// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
part 'home_screen_phase1_widgets_coordinator.g.dart';

class HomeScreenPhase1WidgetsCoordinator = _HomeScreenPhase1WidgetsCoordinatorBase
    with _$HomeScreenPhase1WidgetsCoordinator;

abstract class _HomeScreenPhase1WidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  final CenterInstructionalNokhteStore centerInstructionalNokhte =
      CenterInstructionalNokhteStore();
  final InstructionalGradientNokhteStore virginInstructionalGradientNokhte =
      InstructionalGradientNokhteStore();
  _HomeScreenPhase1WidgetsCoordinatorBase({
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.primarySmartText,
    required super.errorSmartText,
    required super.secondaryErrorSmartText,
    required super.touchRipple,
  });

  @observable
  Offset center = Offset.zero;

  @override
  @action
  constructor(Offset centerParam) {
    center = centerParam;
    super.constructor(centerParam);
    primarySmartText.setMessagesData(MessagesData.firstTimeHomeList);
    primarySmartText.startRotatingText();
    gestureCross.fadeInTheCross();
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    virginInstructionalGradientNokhte.setPosition(center);
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
    if (primarySmartText.currentIndex.equals(3)) {
      centerInstructionalNokhte.moveUp();
      virginInstructionalGradientNokhte.initTransformation();
      primarySmartText.startRotatingText(isResuming: true);
      setTouchIsDisabled(true);
      Timer(Seconds.get(1, milli: 500), () {
        setSmartTextSubMessagePaddingScalar(110);
        setSmartTextTopPaddingScalar(0);
        setSmartTextBottomPaddingScalar(0);
        setTouchIsDisabled(false);
      });
    } else if (primarySmartText.currentIndex.equals(5) && !touchIsDisabled) {
      prepForNavigation(excludeUnBlur: true);
    }
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @observable
  bool touchIsDisabled = false;

  @action
  setTouchIsDisabled(bool value) => touchIsDisabled = value;

  @action
  onTap(Offset offset) {
    if (!touchIsDisabled) {
      if (primarySmartText.currentIndex == 1) {
        setTouchIsDisabled(true);
        primarySmartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveToCenter(center);
        touchRipple.onTap(offset);
        Timer(Seconds.get(1, milli: 500), () {
          setSmartTextTopPaddingScalar(.1);
          setSmartTextBottomPaddingScalar(0);
          setSmartTextSubMessagePaddingScalar(80);
          setTouchIsDisabled(false);
        });
      } else if (primarySmartText.currentIndex == 2) {
        setTouchIsDisabled(true);
        primarySmartText.startRotatingText(isResuming: true);
        virginInstructionalGradientNokhte.setWidgetVisibility(true);
        touchRipple.onTap(offset);
      } else if (primarySmartText.currentIndex == 4) {
        primarySmartText.startRotatingText(isResuming: true);
        setTouchIsDisabled(true);
        Timer(Seconds.get(1, milli: 500), () {
          virginInstructionalGradientNokhte.moveBack();
          centerInstructionalNokhte.moveBack();
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
            virginInstructionalGradientNokhte.setWidgetVisibility(false);
            setTouchIsDisabled(false);
          });
        }
      });

  @action
  onGestureCrossTap() {
    if (!hasInitiatedBlur && !isEnteringNokhteSession) {
      nokhteBlur.init();
      beachWaves.currentStore.setControl(Control.stop);
      toggleHasInitiatedBlur();
      primarySmartText.startRotatingText(isResuming: true);
      Timer(Seconds.get(1, milli: 500), () {
        setSmartTextTopPaddingScalar(0);
        setSmartTextBottomPaddingScalar(.3);
        setSmartTextSubMessagePaddingScalar(110);
      });
    }
  }
}
