// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:simple_animations/simple_animations.dart';
part 'storage_guide_widgets_coordinator.g.dart';

class StorageGuideWidgetsCoordinator = _StorageGuideWidgetsCoordinatorBase
    with _$StorageGuideWidgetsCoordinator;

abstract class _StorageGuideWidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator
    with Store, Reactions, EnRoute, EnRouteConsumer, HomeScreenWidgetsUtils {
  final SwipeGuideStore swipeGuide;
  _StorageGuideWidgetsCoordinatorBase({
    required this.swipeGuide,
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.primarySmartText,
    required super.touchRipple,
   required super.centerInstructionalNokhte,
    required super.sessionStarterInstructionalNokhte,
    required super.storageInstructionalNokhte,
  });

  @override
  @action
  constructor(Offset offset) {
    initUtils();
    super.constructor(offset);
    swipeGuide.setWidgetVisibility(false);
    gestureCross.fadeIn();
    primarySmartText.setMessagesData(HomeLists.storageGuide);
    primarySmartText.startRotatingText();
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    storageInstructionalNokhte.prepareYellowDiamond(
      center,
      position: InstructionalNokhtePositions.right,
      colorway: GradientNokhteColorways.vibrantBlue,
    );
    initReactors();
  }

  @action
  initReactors() {
    disposers.add(gestureCrossTapReactor());
    disposers.add(centerInstructionalNokhteMovieReactor());
    disposers.add(centerCrossNokhteReactor(() {
      sessionStarterInstructionalNokhte.setWidgetVisibility(false);
      storageInstructionalNokhte.setWidgetVisibility(false);
    }));
  }

  @observable
  GestureCrossConfiguration gestureCrossConfig = GestureCrossConfiguration(
    top: Right(
      NokhteGradientConfig(
        gradientType: NokhteGradientTypes.sessionStarter,
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
    hasInitiatedBlur = true;
    nokhteBlur.init();
    beachWaves.currentStore.setControl(Control.stop);
    primarySmartText.startRotatingText(isResuming: true);
    Timer(const Duration(seconds: 1, milliseconds: 500), () {
      storageInstructionalNokhte.setWidgetVisibility(true);
      setSmartTextBottomPaddingScalar(0);
      setSmartTextTopPaddingScalar(.13);
    });
    gestureCross.gradientNokhte.setWidgetVisibility(false);
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    sessionStarterInstructionalNokhte.setWidgetVisibility(true);
    sessionStarterInstructionalNokhte.initMovie(
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
    if (!isDisconnected &&
        isAllowedToMakeAGesture &&
        !swipeRightIsUnlocked &&
        canTapOnGestureCross) {
      onInitInstructionMode();
      canTapOnGestureCross = false;
    }
  }

  @action
  onSwipeUp() {
    if (!isDisconnected && isAllowedToMakeAGesture) {
      if (!hasInitiatedBlur) {
        centerInstructionalNokhte.setWidgetVisibility(false);
        gestureCross.centerCrossNokhte.setWidgetVisibility(true);
        prepForNavigation(excludeUnBlur: !hasInitiatedBlur);
        canTapOnGestureCross = false;
      }
    }
  }

  @action
  onSwipeLeft() {
    if (!isDisconnected && isAllowedToMakeAGesture) {
      if (hasInitiatedBlur && !hasSwipedUp) {
        hasSwipedUp = true;
        centerNokhtePosition = InstructionalNokhtePositions.right;
        centerInstructionalNokhte.initMovie(centerNokhtePosition);
        storageInstructionalNokhte.setControl(Control.playFromStart);
        sessionStarterInstructionalNokhte.setWidgetVisibility(false);
        primarySmartText.startRotatingText(isResuming: true);
        swipeGuide.setWidgetVisibility(false);
      } else if (!hasInitiatedBlur && !hasSwipedUp && swipeRightIsUnlocked) {
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

  @action
  onTap(Offset tapPosition) {
    if (!isDisconnected && canTap) {
      touchRipple.onTap(tapPosition);
      hasInitiatedBlur = false;
      canTap = false;
      primarySmartText.startRotatingText(isResuming: true);
      centerInstructionalNokhte.moveBackToCross(
        startingPosition: CenterNokhtePositions.right,
      );
      storageInstructionalNokhte.initMovie(
        InstructionalGradientMovieParams(
          center: center,
          colorway: GradientNokhteColorways.vibrantBlue,
          direction: InstructionalGradientDirections.shrink,
          position: InstructionalNokhtePositions.right,
        ),
      );
      swipeRightIsUnlocked = true;
      sessionStarterInstructionalNokhte.setWidgetVisibility(true);
      sessionStarterInstructionalNokhte.initMovie(
        InstructionalGradientMovieParams(
          center: center,
          colorway: GradientNokhteColorways.invertedBeachWave,
          direction: InstructionalGradientDirections.shrink,
          position: InstructionalNokhtePositions.top,
        ),
      );
      toggleHasSwipedUp();
      nokhteBlur.reverse();
      beachWaves.currentStore.setControl(Control.mirror);
    }
  }

  centerInstructionalNokhteMovieReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (centerInstructionalNokhte.movieMode ==
              CenterInstructionalNokhteMovieModes.moveAround) {
            canTap = true;
          } else if (centerInstructionalNokhte.movieMode ==
              CenterInstructionalNokhteMovieModes.moveToCenter) {
            swipeGuide.setWidgetVisibility(true);
          }
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
