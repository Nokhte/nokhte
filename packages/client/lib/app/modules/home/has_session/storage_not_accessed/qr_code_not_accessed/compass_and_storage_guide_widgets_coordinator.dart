// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:simple_animations/simple_animations.dart';
part 'compass_and_storage_guide_widgets_coordinator.g.dart';

class CompassAndStorageGuideWidgetsCoordinator = _CompassAndStorageGuideWidgetsCoordinatorBase
    with _$CompassAndStorageGuideWidgetsCoordinator;

abstract class _CompassAndStorageGuideWidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _CompassAndStorageGuideWidgetsCoordinatorBase({
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

  @observable
  bool gracePeriodHasExpired = false;

  @action
  toggleGracePeriodHasExpired() =>
      gracePeriodHasExpired = !gracePeriodHasExpired;

  @observable
  bool hasTappedOnGestureCross = false;

  @override
  @action
  constructor(Offset offset) {
    super.constructor(offset);
    gestureCross.fadeInTheCross();
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    primarySmartText.setMessagesData(HomeLists.compassAndStorageGuide);
    sessionStarterInstructionalNokhte.prepareYellowDiamond(
      base.center,
      position: InstructionalNokhtePositions.right,
      colorway: GradientNokhteColorways.vibrantBlue,
    );
    primarySmartText.startRotatingText();
    initReactors();
  }

  @action
  initReactors() {
    base.disposers.add(gestureCrossTapReactor());
    base.disposers.add(centerInstructionalNokhteReactor());
    base.disposers.add(centerCrossNokhteReactor(() {
      sessionStarterInstructionalNokhte.setWidgetVisibility(false);
    }));
  }

  @action
  onTap(Offset offset) async {
    if (!base.isDisconnected && !base.touchIsDisabled) {
      if (primarySmartText.currentIndex == 1) {
        base.setTouchIsDisabled(true);
        primarySmartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveToCenter(base.center);
        touchRipple.onTap(offset);
        setSmartTextPadding(
          subMessagePadding: 80,
          topPadding: 0.1,
          bottomPadding: 0,
        );
        delayedEnableTouchFeedback();
      } else if (primarySmartText.currentIndex == 2) {
        base.setTouchIsDisabled(true);
        primarySmartText.startRotatingText(isResuming: true);
        sessionStarterInstructionalNokhte.setWidgetVisibility(true);
        touchRipple.onTap(offset);
        delayedEnableTouchFeedback();
      } else if (primarySmartText.currentIndex == 4) {
        primarySmartText.startRotatingText(isResuming: true);
        hasSwipedUp = false;
        base.setTouchIsDisabled(true);
        Timer(Seconds.get(1, milli: 500), () {
          sessionStarterInstructionalNokhte.initMovie(
            InstructionalGradientMovieParams(
              center: base.center,
              colorway: GradientNokhteColorways.vibrantBlue,
              direction: InstructionalGradientDirections.shrink,
              position: InstructionalNokhtePositions.right,
            ),
          );
          centerInstructionalNokhte.moveBackToCross(
            startingPosition: CenterNokhtePositions.right,
          );
        });
        hasInitiatedBlur = false;
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

  @action
  onGestureCrossTap() {
    if (!base.isDisconnected &&
        !hasInitiatedBlur &&
        !isEnteringNokhteSession &&
        !isInErrorMode &&
        !hasTappedOnGestureCross) {
      nokhteBlur.init();
      beachWaves.currentStore.setControl(Control.stop);
      toggleHasInitiatedBlur();
      primarySmartText.startRotatingText(isResuming: true);
      setSmartTextPadding(subMessagePadding: 110, bottomPadding: .23);
      delayedEnableTouchFeedback();
      hasTappedOnGestureCross = true;
    }
  }

  @action
  onSwipeRight() {
    if (!base.isDisconnected && isAllowedToMakeAGesture) {
      if (!hasSwipedUp &&
          primarySmartText.currentIndex == 3 &&
          hasInitiatedBlur) {
        hasSwipedUp = true;
        centerInstructionalNokhte.initMovie(
          InstructionalNokhtePositions.right,
        );
        sessionStarterInstructionalNokhte.setControl(Control.playFromStart);
        primarySmartText.startRotatingText(isResuming: true);
        setSmartTextPadding(subMessagePadding: 120, topPadding: .15);
        delayedEnableTouchFeedback();
      } else if (!hasSwipedUp && !hasInitiatedBlur && hasTappedOnGestureCross) {
        hasSwipedUp = true;
        beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToSky);
        beachWaves.currentStore.initMovie(
          beachWaves.currentAnimationValues.first,
        );
        gestureCross.initMoveAndRegenerate(CircleOffsets.right);
        gestureCross.cross.initOutlineFadeIn();
        primarySmartText.setWidgetVisibility(false);
      }
    }
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  centerInstructionalNokhteReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            centerInstructionalNokhte.movieMode ==
                CenterInstructionalNokhteMovieModes.moveBack) {
          gestureCross.fadeIn();
          hasSwipedUp = false;
          Timer(Seconds.get(1), () {
            centerInstructionalNokhte.setWidgetVisibility(false);
            sessionStarterInstructionalNokhte.setWidgetVisibility(false);
            base.setTouchIsDisabled(false);
          });
        }
      });

  @computed
  bool get isAllowedToMakeAGesture =>
      !isEnteringNokhteSession &&
      !isInErrorMode &&
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
