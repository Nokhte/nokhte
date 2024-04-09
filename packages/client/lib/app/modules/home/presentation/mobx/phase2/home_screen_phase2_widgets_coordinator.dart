// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
part 'home_screen_phase2_widgets_coordinator.g.dart';

class HomeScreenPhase2WidgetsCoordinator = _HomeScreenPhase2WidgetsCoordinatorBase
    with _$HomeScreenPhase2WidgetsCoordinator;

abstract class _HomeScreenPhase2WidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _HomeScreenPhase2WidgetsCoordinatorBase({
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

  @observable
  bool gracePeriodHasExpired = false;

  @observable
  bool crossHasBeenTapped = false;

  @action
  toggleGracePeriodHasExpired() =>
      gracePeriodHasExpired = !gracePeriodHasExpired;

  @override
  @action
  constructor(Offset offset) {
    super.constructor(offset);
    primarySmartText
        .setMessagesData(MessagesData.hasDoneSessionInformationFlow);
    primarySmartText.startRotatingText();
    gestureCross.fadeIn(onFadeIn: Left(() {
      instructionalGradientNokhte.initMovie(
        InstructionalGradientMovieParams(
          center: center,
          colorway: GradientNokhteColorways.invertedBeachWave,
          direction: InstructionalGradientDirections.enlarge,
          position: GradientNokhtePositions.top,
        ),
      );
      instructionalGradientNokhte.setControl(Control.stop);
      centerInstructionalNokhte.setWidgetVisibility(true);
      instructionalGradientNokhte.setWidgetVisibility(true);
    }));
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
    if (centerInstructionalNokhte.movieStatus != MovieStatus.inProgress) {
      if (hasInitiatedBlur) {
        centerInstructionalNokhte.initMovie(GradientNokhtePositions.top);
        hasSwipedUp = true;
        primarySmartText.startRotatingText(isResuming: true);
        setSmartTextPadding(topPadding: 0);
      } else if (primarySmartText.currentIndex.isLessThan(1)) {
        gestureCross.centerCrossNokhte.setWidgetVisibility(true);
        gestureCross.gradientNokhte.setWidgetVisibility(true);
        centerInstructionalNokhte.setWidgetVisibility(false);
        instructionalGradientNokhte.setWidgetVisibility(false);
        prepForNavigation(excludeUnBlur: true);
      }
    }
  }
  //add reactor for re-setting smart text

  @action
  onTap(Offset offset) {
    if (!touchIsDisabled) {
      if (primarySmartText.currentIndex == 2) {
        primarySmartText.startRotatingText(isResuming: true);
        touchRipple.onTap(offset);
        nokhteBlur.reverse();
        setTouchIsDisabled(true);
        beachWaves.currentStore.setControl(Control.mirror);
        toggleHasInitiatedBlur();
        Timer(Seconds.get(1, milli: 500), () {
          centerInstructionalNokhte.moveBackToCross(
            startingPosition: CenterNokhtePositions.top,
          );
          instructionalGradientNokhte.initMovie(
            InstructionalGradientMovieParams(
              center: center,
              colorway: GradientNokhteColorways.invertedBeachWave,
              direction: InstructionalGradientDirections.shrink,
              position: GradientNokhtePositions.top,
            ),
          );
          primarySmartText.reset();
          primarySmartText.startRotatingText();
        });
        hasInitiatedBlur = false;
      }
    }
  }

  centerInstructionalNokhteReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            centerInstructionalNokhte.movieMode ==
                CenterInstructionalNokhteMovieModes.moveBack) {
          gestureCross.centerCrossNokhte.setWidgetVisibility(true);
          gestureCross.gradientNokhte.setWidgetVisibility(true);
          hasSwipedUp = false;
          setTouchIsDisabled(false);
        }
      });

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @action
  onGestureCrossTap() {
    if (canTapOnGestureCross) {
      if (!hasInitiatedBlur) {
        hasSwipedUp = false;
        nokhteBlur.init();
        beachWaves.currentStore.setControl(Control.stop);
        hasInitiatedBlur = true;
        instructionalGradientNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.invertedBeachWave,
            direction: InstructionalGradientDirections.enlarge,
            position: GradientNokhtePositions.top,
          ),
        );
        gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        gestureCross.gradientNokhte.setWidgetVisibility(false);
        primarySmartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveToCenter(center);
        setSmartTextPadding(bottomPadding: .14);
      } else if (hasInitiatedBlur) {
        hasSwipedUp = false;
        centerInstructionalNokhte.moveBackToCross(
          startingPosition: CenterNokhtePositions.center,
        );
        instructionalGradientNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.invertedBeachWave,
            direction: InstructionalGradientDirections.shrink,
            position: GradientNokhtePositions.top,
          ),
        );
        nokhteBlur.reverse();
        beachWaves.currentStore.setControl(Control.mirror);
        hasInitiatedBlur = false;
        primarySmartText.reset();
        primarySmartText.startRotatingText();
        setSmartTextPadding();
      }
    }
  }

  @computed
  bool get canTapOnGestureCross =>
      !isEnteringNokhteSession &&
      !hasSwipedUp &&
      !isInErrorMode &&
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
