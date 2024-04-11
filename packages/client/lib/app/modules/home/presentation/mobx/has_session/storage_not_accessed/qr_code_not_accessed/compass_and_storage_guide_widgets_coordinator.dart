// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
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
    required super.primaryInstructionalGradientNokhte,
    required super.secondaryInstructionalGradientNokhte,
  });

  @observable
  bool gracePeriodHasExpired = false;

  @action
  toggleGracePeriodHasExpired() =>
      gracePeriodHasExpired = !gracePeriodHasExpired;

  @override
  @action
  constructor(Offset offset) {
    super.constructor(offset);
    gestureCross.fadeInTheCross();
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    primarySmartText.setMessagesData(MessagesData.compassAndStorageGuideList);
    primaryInstructionalGradientNokhte.prepareYellowDiamond(
      center,
      position: InstructionalNokhtePositions.right,
      colorway: GradientNokhteColorways.vibrantBlue,
    );
    primarySmartText.startRotatingText();
    initReactors();
  }

  @action
  @override
  initReactors() {
    super.initReactors();
    gestureCrossTapReactor();
    centerInstructionalNokhteReactor();
    centerCrossNokhteReactor(() {
      primaryInstructionalGradientNokhte.setWidgetVisibility(false);
    });
  }

  @action
  onTap(Offset offset) async {
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
        primaryInstructionalGradientNokhte.setWidgetVisibility(true);
        touchRipple.onTap(offset);
        setSmartTextPadding();
      } else if (primarySmartText.currentIndex == 4) {
        primarySmartText.startRotatingText(isResuming: true);
        hasSwipedUp = false;
        setTouchIsDisabled(true);
        Timer(Seconds.get(1, milli: 500), () {
          primaryInstructionalGradientNokhte.initMovie(
            InstructionalGradientMovieParams(
              center: center,
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
        // await onFlowCompleted();
      }
    }
  }

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

  @action
  onSwipeRight() {
    if (isAllowedToMakeAGesture &&
        !hasSwipedUp &&
        primarySmartText.currentIndex == 3 &&
        hasInitiatedBlur) {
      hasSwipedUp = true;
      centerInstructionalNokhte.initMovie(
        InstructionalNokhtePositions.right,
      );
      primaryInstructionalGradientNokhte.setControl(Control.playFromStart);
      primarySmartText.startRotatingText(isResuming: true);
      setSmartTextPadding(subMessagePadding: 120, topPadding: .15);
    } else if (!hasSwipedUp && !hasInitiatedBlur) {
      beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToVibrantBlue);
      beachWaves.currentStore.initMovie(
        beachWaves.currentAnimationValues.first,
      );
      gestureCross.initMoveAndRegenerate(CircleOffsets.right);
      gestureCross.cross.initOutlineFadeIn();
      primarySmartText.setWidgetVisibility(false);
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
          Timer(Seconds.get(1), () {
            centerInstructionalNokhte.setWidgetVisibility(false);
            primaryInstructionalGradientNokhte.setWidgetVisibility(false);
            setTouchIsDisabled(false);
          });
        }
      });

  @computed
  bool get isAllowedToMakeAGesture =>
      !isEnteringNokhteSession &&
      !isInErrorMode &&
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
