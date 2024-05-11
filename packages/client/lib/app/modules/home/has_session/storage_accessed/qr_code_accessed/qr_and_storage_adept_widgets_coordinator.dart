// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:simple_animations/simple_animations.dart';
part 'qr_and_storage_adept_widgets_coordinator.g.dart';

class QrAndStorageAdeptWidgetsCoordinator = _QrAndStorageAdeptWidgetsCoordinatorBase
    with _$QrAndStorageAdeptWidgetsCoordinator;

abstract class _QrAndStorageAdeptWidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _QrAndStorageAdeptWidgetsCoordinatorBase({
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
    gestureCross.fadeIn();
    primarySmartText.setMessagesData(HomeLists.qrAndStorageAdept);
    primarySmartText.startRotatingText();
    initReactors();
  }

  @action
  onSwipeUp() {
    if (!isDisconnected && isAllowedToMakeAGesture) {
      if (hasInitiatedBlur && !hasSwipedUp) {
        hasSwipedUp = true;
        canTap = true;
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.top);
        secondaryInstructionalGradientNokhte.setWidgetVisibility(false);
        primarySmartText.setCurrentIndex(2);
        primarySmartText.startRotatingText(isResuming: true);
        currentCenterNokhtePosition = InstructionalNokhtePositions.top;
      } else if (!hasInitiatedBlur && !hasSwipedUp) {
        canTapOnGestureCross = false;
        gestureCross.centerCrossNokhte.setWidgetVisibility(true);
        centerInstructionalNokhte.setWidgetVisibility(false);
        primarySmartText.setWidgetVisibility(false);
        prepForNavigation(excludeUnBlur: true);
      }
    }
  }

  @action
  @override
  initReactors() {
    super.initReactors();
    gestureCrossTapReactor();
    centerCrossNokhteReactor(() {
      primaryInstructionalGradientNokhte.setWidgetVisibility(false);
      secondaryInstructionalGradientNokhte.setWidgetVisibility(false);
    });
  }

  @observable
  bool canTapOnGestureCross = true;

  @observable
  bool hasSwiped = false;

  @observable
  bool canTap = false;

  @observable
  InstructionalNokhtePositions currentCenterNokhtePosition =
      InstructionalNokhtePositions.initial;

  @action
  onSwipeRight() {
    if (!isDisconnected && isAllowedToMakeAGesture) {
      if (hasInitiatedBlur && !hasSwipedUp) {
        hasSwipedUp = true;
        canTap = true;
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.right);
        primaryInstructionalGradientNokhte.setWidgetVisibility(false);
        primarySmartText.setCurrentIndex(0);
        primarySmartText.startRotatingText(isResuming: true);
        currentCenterNokhtePosition = InstructionalNokhtePositions.right;
      } else if (!hasInitiatedBlur && !hasSwipedUp) {
        canTapOnGestureCross = false;
        hasSwipedUp = true;
        beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToSky);
        beachWaves.currentStore.initMovie(
          beachWaves.currentAnimationValues.first,
        );
        gestureCross.centerCrossNokhte.setWidgetVisibility(true);
        centerInstructionalNokhte.setWidgetVisibility(false);
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

  @action
  onTap(Offset offset) {
    if (!isDisconnected &&
        canTap &&
        centerInstructionalNokhte.movieStatus == MovieStatus.finished) {
      canTap = false;
      touchRipple.onTap(offset);
      hasInitiatedBlur = false;
      hasSwipedUp = false;
      primarySmartText.startRotatingText(isResuming: true);
      if (currentCenterNokhtePosition == InstructionalNokhtePositions.right) {
        primaryInstructionalGradientNokhte.setWidgetVisibility(true);
        primaryInstructionalGradientNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.invertedBeachWave,
            direction: InstructionalGradientDirections.shrink,
            position: InstructionalNokhtePositions.top,
          ),
        );
        secondaryInstructionalGradientNokhte.setWidgetVisibility(true);
        secondaryInstructionalGradientNokhte.initMovie(
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
        nokhteBlur.reverse();
        beachWaves.currentStore.setControl(Control.mirror);
      } else if (currentCenterNokhtePosition ==
          InstructionalNokhtePositions.top) {
        primaryInstructionalGradientNokhte.setWidgetVisibility(true);
        primaryInstructionalGradientNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.invertedBeachWave,
            direction: InstructionalGradientDirections.shrink,
            position: InstructionalNokhtePositions.top,
          ),
        );
        secondaryInstructionalGradientNokhte.setWidgetVisibility(true);
        secondaryInstructionalGradientNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.vibrantBlue,
            direction: InstructionalGradientDirections.shrink,
            position: InstructionalNokhtePositions.right,
          ),
        );
        centerInstructionalNokhte.moveBackToCross(
          startingPosition: CenterNokhtePositions.top,
        );
        nokhteBlur.reverse();
        beachWaves.currentStore.setControl(Control.mirror);
      }
    } else if (hasInitiatedBlur && isAllowedToMakeAGesture) {
      dismissInstructionalNokhte();
    }
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected &&
        !isEnteringNokhteSession &&
        canTapOnGestureCross &&
        isAllowedToMakeAGesture) {
      if (!hasInitiatedBlur) {
        nokhteBlur.init();
        beachWaves.currentStore.setControl(Control.stop);
        toggleHasInitiatedBlur();
        gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        gestureCross.gradientNokhte.setWidgetVisibility(false);
        centerInstructionalNokhte.moveToCenter(center);
        primaryInstructionalGradientNokhte.setWidgetVisibility(true);
        secondaryInstructionalGradientNokhte.setWidgetVisibility(true);
        primaryInstructionalGradientNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.invertedBeachWave,
            direction: InstructionalGradientDirections.enlarge,
            position: InstructionalNokhtePositions.top,
          ),
        );
        secondaryInstructionalGradientNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.vibrantBlue,
            direction: InstructionalGradientDirections.enlarge,
            position: InstructionalNokhtePositions.right,
          ),
        );
      } else if (hasInitiatedBlur) {
        dismissInstructionalNokhte();
      }
    }
  }

  @action
  dismissInstructionalNokhte() {
    hasSwipedUp = false;
    centerInstructionalNokhte.moveBackToCross(
      startingPosition: CenterNokhtePositions.center,
    );
    primaryInstructionalGradientNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.invertedBeachWave,
        direction: InstructionalGradientDirections.shrink,
        position: InstructionalNokhtePositions.top,
      ),
    );
    primaryInstructionalGradientNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.invertedBeachWave,
        direction: InstructionalGradientDirections.shrink,
        position: InstructionalNokhtePositions.top,
      ),
    );
    secondaryInstructionalGradientNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.vibrantBlue,
        direction: InstructionalGradientDirections.shrink,
        position: InstructionalNokhtePositions.right,
      ),
    );

    nokhteBlur.reverse();
    beachWaves.currentStore.setControl(Control.mirror);
    hasInitiatedBlur = false;
    primarySmartText.reset();
    primarySmartText.startRotatingText();
    setSmartTextPadding();
  }

  @computed
  bool get isAllowedToMakeAGesture =>
      !isEnteringNokhteSession &&
      !isInErrorMode &&
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress &&
      primaryInstructionalGradientNokhte.movieStatus !=
          MovieStatus.inProgress &&
      secondaryInstructionalGradientNokhte.movieStatus !=
          MovieStatus.inProgress;
}