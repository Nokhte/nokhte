// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
part 'storage_guide_widgets_coordinator.g.dart';

class StorageGuideWidgetsCoordinator = _StorageGuideWidgetsCoordinatorBase
    with _$StorageGuideWidgetsCoordinator;

abstract class _StorageGuideWidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _StorageGuideWidgetsCoordinatorBase({
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

  @override
  @action
  constructor(Offset offset) {
    super.constructor(offset);
    gestureCross.fadeIn();
    primarySmartText.setMessagesData(MessagesData.storageGuideList);
    primarySmartText.startRotatingText();
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    secondaryInstructionalGradientNokhte.prepareYellowDiamond(
      center,
      position: InstructionalNokhtePositions.right,
      colorway: GradientNokhteColorways.vibrantBlue,
    );
    initReactors();
  }

  @action
  @override
  initReactors() {
    super.initReactors();
    gestureCrossTapReactor();
    centerInstructionalNokhteMovieReactor();
    centerCrossNokhteReactor(() {
      primaryInstructionalGradientNokhte.setWidgetVisibility(false);
      secondaryInstructionalGradientNokhte.setWidgetVisibility(false);
    });
  }

  @observable
  GestureCrossConfiguration gestureCrossConfig = GestureCrossConfiguration(
    top: Right(
      NokhteGradientConfig(
        gradientType: NokhteGradientTypes.invertedShore,
      ),
    ),
  );

  @observable
  InstructionalNokhtePositions centerNokhtePosition =
      InstructionalNokhtePositions.initial;

  @observable
  bool canTapOnGestureCross = true;

  @observable
  bool swipeRightIsUnlocked = false;

  @observable
  bool canTap = false;

  @action
  onInitInstructionMode() {
    toggleHasInitiatedBlur();
    nokhteBlur.init();
    beachWaves.currentStore.setControl(Control.stop);
    toggleHasInitiatedBlur();
    primarySmartText.startRotatingText(isResuming: true);
    Timer(const Duration(seconds: 1, milliseconds: 500), () {
      setSmartTextBottomPaddingScalar(0);
      setSmartTextTopPaddingScalar(.13);
    });
    gestureCross.gradientNokhte.setWidgetVisibility(false);
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    primaryInstructionalGradientNokhte.setWidgetVisibility(true);
    primaryInstructionalGradientNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.invertedBeachWave,
        direction: InstructionalGradientDirections.enlarge,
        position: InstructionalNokhtePositions.top,
      ),
    );
    centerInstructionalNokhte.moveToCenter(center);
  }

  @action
  onGestureCrossTap() {
    if (isAllowedToMakeAGesture && !swipeRightIsUnlocked) {
      onInitInstructionMode();
    }
  }

  @action
  onSwipeUp() {
    if (isAllowedToMakeAGesture) {
      if (!hasInitiatedBlur) {
        centerInstructionalNokhte.setWidgetVisibility(false);
        primaryInstructionalGradientNokhte.setWidgetVisibility(false);
        secondaryInstructionalGradientNokhte.setWidgetVisibility(false);
        prepForNavigation(excludeUnBlur: !hasInitiatedBlur);
      }
    }
  }

  @action
  onSwipeRight() {
    if (isAllowedToMakeAGesture) {
      if (hasInitiatedBlur && !hasSwipedUp) {
        hasSwipedUp = true;
        centerNokhtePosition = InstructionalNokhtePositions.right;
        centerInstructionalNokhte.initMovie(centerNokhtePosition);
        secondaryInstructionalGradientNokhte.setControl(Control.playFromStart);
        primaryInstructionalGradientNokhte.setWidgetVisibility(false);
      } else if (!hasInitiatedBlur && !hasSwipedUp && swipeRightIsUnlocked) {
        hasSwipedUp = true;
        beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToVibrantBlue);
        beachWaves.currentStore.initMovie(
          beachWaves.currentAnimationValues.first,
        );

        centerInstructionalNokhte.setWidgetVisibility(false);
        gestureCross.initMoveAndRegenerate(CircleOffsets.right);
        gestureCross.cross.initOutlineFadeIn();
        primarySmartText.setWidgetVisibility(false);
      }
    }
  }

  @action
  onTap(Offset tapPosition) {
    if (canTap) {
      canTap = false;
      primarySmartText.startRotatingText(isResuming: true);
      centerInstructionalNokhte.moveBackToCross(
        startingPosition: CenterNokhtePositions.right,
      );
      secondaryInstructionalGradientNokhte.initMovie(
        InstructionalGradientMovieParams(
          center: center,
          colorway: GradientNokhteColorways.vibrantBlue,
          direction: InstructionalGradientDirections.shrink,
          position: InstructionalNokhtePositions.right,
        ),
      );
      swipeRightIsUnlocked = true;
      primaryInstructionalGradientNokhte.setWidgetVisibility(true);
      primaryInstructionalGradientNokhte.initMovie(
        InstructionalGradientMovieParams(
          center: center,
          colorway: GradientNokhteColorways.invertedBeachWave,
          direction: InstructionalGradientDirections.shrink,
          position: InstructionalNokhtePositions.top,
        ),
      );
      toggleHasSwipedUp();
      toggleHasInitiatedBlur();
      nokhteBlur.reverse();
      beachWaves.currentStore.setControl(Control.mirror);
    }
  }

  centerInstructionalNokhteMovieReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        // todo test this out to make sure it works
        if (p0 == MovieStatus.finished &&
            centerInstructionalNokhte.movieMode ==
                CenterInstructionalNokhteMovieModes.moveAround) {
          // if (centerNokhtePosition == InstructionalNokhtePositions.right) {
          canTap = true;
          primarySmartText.startRotatingText(isResuming: true);
          // }
        }
      });

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @computed
  bool get isAllowedToMakeAGesture =>
      !isEnteringNokhteSession &&
      !isInErrorMode &&
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
