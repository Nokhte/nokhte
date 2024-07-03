// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:simple_animations/simple_animations.dart';
part 'compass_and_qr_guide_widgets_coordinator.g.dart';

class CompassAndQrGuideWidgetsCoordinator = _CompassAndQrGuideWidgetsCoordinatorBase
    with _$CompassAndQrGuideWidgetsCoordinator;

abstract class _CompassAndQrGuideWidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _CompassAndQrGuideWidgetsCoordinatorBase({
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.primarySmartText,
    required super.errorSmartText,
    required super.secondaryErrorSmartText,
    required super.touchRipple,
    required super.centerInstructionalNokhte,
    required super.sessionStarterInstructionalNokhte,
    required super.storageInstructionalNokhte,
  });

  @override
  @action
  constructor(Offset centerParam) {
    super.constructor(centerParam);
    primarySmartText.setMessagesData(HomeLists.compassAndQrGuide);
    primarySmartText.startRotatingText();
    gestureCross.fadeInTheCross();
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    sessionStarterInstructionalNokhte.prepareYellowDiamond(
      center,
      position: InstructionalNokhtePositions.top,
      colorway: GradientNokhteColorways.invertedBeachWave,
    );
    initReactors();
  }

  @action
  initReactors() {
    disposers.add(gestureCrossTapReactor());
    disposers.add(centerInstructionalNokhteReactor());
    disposers.add(centerCrossNokhteReactor(() {}));
  }

  @action
  onSwipeUp() {
    if (!isDisconnected && !touchIsDisabled) {
      if (primarySmartText.currentIndex.equals(3)) {
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.top);
        sessionStarterInstructionalNokhte.setControl(Control.playFromStart);
        primarySmartText.startRotatingText(isResuming: true);
        setTouchIsDisabled(true);
        setSmartTextPadding(
          subMessagePadding: 110.0,
          bottomPadding: 0.0,
          topPadding: 0.0,
        );
        Timer(Seconds.get(1, milli: 500), () {
          setTouchIsDisabled(false);
        });
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
  onTap(Offset offset) async {
    if (!isDisconnected && !touchIsDisabled) {
      if (primarySmartText.currentIndex == 1) {
        setTouchIsDisabled(true);
        primarySmartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveToCenter(center);
        touchRipple.onTap(offset);
        setSmartTextPadding(
          subMessagePadding: 80.0,
          topPadding: 0.1,
          bottomPadding: 0.0,
        );
        delayedEnableTouchFeedback();
      } else if (primarySmartText.currentIndex == 2) {
        setTouchIsDisabled(true);
        primarySmartText.startRotatingText(isResuming: true);
        sessionStarterInstructionalNokhte.setWidgetVisibility(true);
        touchRipple.onTap(offset);
        delayedEnableTouchFeedback();
      } else if (primarySmartText.currentIndex == 4) {
        primarySmartText.startRotatingText(isResuming: true);
        setTouchIsDisabled(true);
        Timer(Seconds.get(1, milli: 500), () {
          sessionStarterInstructionalNokhte.initMovie(
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
            sessionStarterInstructionalNokhte.setWidgetVisibility(false);
            setTouchIsDisabled(false);
          });
        }
      });

  @action
  onGestureCrossTap() {
    if (!isDisconnected &&
        !hasInitiatedBlur &&
        !isEnteringNokhteSession &&
        !isInErrorMode) {
      nokhteBlur.init();
      beachWaves.currentStore.setControl(Control.stop);
      toggleHasInitiatedBlur();
      primarySmartText.startRotatingText(isResuming: true);
      setSmartTextPadding(
        subMessagePadding: 110.0,
        bottomPadding: 0.23,
        topPadding: 0.0,
      );
    }
  }
}
