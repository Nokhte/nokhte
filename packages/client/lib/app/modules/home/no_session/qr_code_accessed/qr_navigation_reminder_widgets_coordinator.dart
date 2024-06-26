// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:simple_animations/simple_animations.dart';
part 'qr_navigation_reminder_widgets_coordinator.g.dart';

class QrNavigationReminderWidgetsCoordinator = _QrNavigationReminderWidgetsCoordinatorBase
    with _$QrNavigationReminderWidgetsCoordinator;

abstract class _QrNavigationReminderWidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _QrNavigationReminderWidgetsCoordinatorBase({
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

  @observable
  bool crossHasBeenTapped = false;

  @action
  toggleGracePeriodHasExpired() =>
      gracePeriodHasExpired = !gracePeriodHasExpired;

  @override
  @action
  constructor(Offset offset) {
    super.constructor(offset);
    primarySmartText.setMessagesData(HomeLists.qrNavigationReminder);
    primarySmartText.startRotatingText();
    gestureCross.fadeIn(onFadeIn: Left(() {
      sessionStarterInstructionalNokhte.initMovie(
        InstructionalGradientMovieParams(
          center: base.center,
          colorway: GradientNokhteColorways.invertedBeachWave,
          direction: InstructionalGradientDirections.enlarge,
          position: InstructionalNokhtePositions.top,
        ),
      );
      sessionStarterInstructionalNokhte.setControl(Control.stop);
      centerInstructionalNokhte.setWidgetVisibility(true);
      sessionStarterInstructionalNokhte.setWidgetVisibility(true);
    }));
    initReactors();
  }

  @action
  initReactors() {
    base.disposers.add(gestureCrossTapReactor());
    base.disposers.add(centerInstructionalNokhteReactor());
    base.disposers.add(centerCrossNokhteReactor(() {}));
  }

  @action
  onSwipeUp() {
    if (!base.isDisconnected &&
        centerInstructionalNokhte.movieStatus != MovieStatus.inProgress) {
      if (hasInitiatedBlur) {
        hasInitiatedBlur = false;
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.top);
        hasSwipedUp = true;
        primarySmartText.startRotatingText(isResuming: true);
        base.setSmartTextPadding(topPadding: 0);
      } else if (primarySmartText.currentIndex.isLessThan(1)) {
        gestureCross.centerCrossNokhte.setWidgetVisibility(true);
        gestureCross.gradientNokhte.setWidgetVisibility(true);
        centerInstructionalNokhte.setWidgetVisibility(false);
        sessionStarterInstructionalNokhte.setWidgetVisibility(false);
        prepForNavigation(excludeUnBlur: true);
      }
    }
  }
  //add reactor for re-setting smart text

  @action
  onTap(Offset offset) {
    if (!base.isDisconnected && !base.touchIsDisabled) {
      if (primarySmartText.currentIndex == 2) {
        primarySmartText.startRotatingText(isResuming: true);
        touchRipple.onTap(offset);
        nokhteBlur.reverse();
        base.setTouchIsDisabled(true);
        beachWaves.currentStore.setControl(Control.mirror);
        toggleHasInitiatedBlur();
        Timer(Seconds.get(1, milli: 500), () {
          centerInstructionalNokhte.moveBackToCross(
            startingPosition: CenterNokhtePositions.top,
          );
          sessionStarterInstructionalNokhte.initMovie(
            InstructionalGradientMovieParams(
              center: base.center,
              colorway: GradientNokhteColorways.invertedBeachWave,
              direction: InstructionalGradientDirections.shrink,
              position: InstructionalNokhtePositions.top,
            ),
          );
          primarySmartText.reset();
          primarySmartText.startRotatingText();
        });
        hasInitiatedBlur = false;
      } else if (hasInitiatedBlur && readyToInteract) {
        dismissInstructionalNokhte();
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
          base.setTouchIsDisabled(false);
        }
      });

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @action
  dismissInstructionalNokhte() {
    hasSwipedUp = false;
    centerInstructionalNokhte.moveBackToCross(
      startingPosition: CenterNokhtePositions.center,
    );
    sessionStarterInstructionalNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: base.center,
        colorway: GradientNokhteColorways.invertedBeachWave,
        direction: InstructionalGradientDirections.shrink,
        position: InstructionalNokhtePositions.top,
      ),
    );
    nokhteBlur.reverse();
    beachWaves.currentStore.setControl(Control.mirror);
    hasInitiatedBlur = false;
    primarySmartText.reset();
    primarySmartText.startRotatingText();
    base.setSmartTextPadding();
  }

  @action
  onGestureCrossTap() {
    if (!base.isDisconnected && readyToInteract) {
      if (!hasInitiatedBlur) {
        hasSwipedUp = false;
        nokhteBlur.init();
        beachWaves.currentStore.setControl(Control.stop);
        hasInitiatedBlur = true;
        sessionStarterInstructionalNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: base.center,
            colorway: GradientNokhteColorways.invertedBeachWave,
            direction: InstructionalGradientDirections.enlarge,
            position: InstructionalNokhtePositions.top,
          ),
        );
        gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        gestureCross.gradientNokhte.setWidgetVisibility(false);
        primarySmartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveToCenter(base.center);
        base.setSmartTextPadding(bottomPadding: .14);
      } else if (hasInitiatedBlur) {
        dismissInstructionalNokhte();
      }
    }
  }

  @computed
  bool get readyToInteract =>
      !isEnteringNokhteSession &&
      !hasSwipedUp &&
      !isInErrorMode &&
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
