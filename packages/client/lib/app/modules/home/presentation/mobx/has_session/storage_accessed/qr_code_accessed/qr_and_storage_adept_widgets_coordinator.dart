// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
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
    primarySmartText.setMessagesData(MessagesData.qrAndStorageAdept);
    primarySmartText.startRotatingText();
    initReactors();
  }

  @action
  onSwipeUp() {
    if (isAllowedToMakeAGesture) {
      if (hasInitiatedBlur && !hasSwipedUp) {
        hasSwipedUp = true;
        canTap = true;
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.top);
        secondaryInstructionalGradientNokhte.setWidgetVisibility(false);
        primarySmartText.setCurrentIndex(2);
        primarySmartText.startRotatingText(isResuming: true);
        currentCenterNokhtePosition = InstructionalNokhtePositions.top;
      } else if (!hasInitiatedBlur && !hasSwipedUp) {
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
  bool hasSwiped = false;

  @observable
  bool canTap = false;

  @observable
  InstructionalNokhtePositions currentCenterNokhtePosition =
      InstructionalNokhtePositions.initial;

  @action
  onSwipeRight() {
    if (isAllowedToMakeAGesture) {
      if (hasInitiatedBlur && !hasSwipedUp) {
        hasSwipedUp = true;
        canTap = true;
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.right);
        primaryInstructionalGradientNokhte.setWidgetVisibility(false);
        primarySmartText.setCurrentIndex(0);
        primarySmartText.startRotatingText(isResuming: true);
        currentCenterNokhtePosition = InstructionalNokhtePositions.right;
      } else if (!hasInitiatedBlur && !hasSwipedUp) {
        hasSwipedUp = true;
        beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToVibrantBlue);
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

  onTap(Offset offset) {
    if (canTap) {
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
      }
      nokhteBlur.reverse();
      beachWaves.currentStore.setControl(Control.mirror);
    }
  }

  @action
  onGestureCrossTap() {
    if (!hasInitiatedBlur && !isEnteringNokhteSession) {
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
    }
  }

  @computed
  bool get isAllowedToMakeAGesture =>
      !isEnteringNokhteSession &&
      !isInErrorMode &&
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
