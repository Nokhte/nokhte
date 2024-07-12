// ignore_for_file: must_be_immutable, library_private_types_in_public_api
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
    with
        Store,
        Reactions,
        EnRoute,
        InstructionalNokhteWidgetUtils,
        EnRouteConsumer,
        HomeScreenWidgetsUtils,
        SingleInstructionalNokhteWidgetUtils {
  @override
  final InstructionalGradientNokhteStore focusInstructionalNokhte;
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
  }) : focusInstructionalNokhte = storageInstructionalNokhte;

  @override
  @action
  constructor(Offset center) {
    initHomeUtils();
    initInstructionalNokhteUtils(center);
    swipeGuide.setWidgetVisibility(false);
    gestureCross.fadeIn();
    primarySmartText.setMessagesData(HomeLists.storageGuide);
    primarySmartText.startRotatingText();
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    focusInstructionalNokhte.prepareYellowDiamond(
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
      focusInstructionalNokhte.setWidgetVisibility(false);
    }));
  }

  @action
  onInitInstructionMode() {
    baseOnInitInstructionMode();
    sessionStarterInstructionalNokhte.setWidgetVisibility(true);
    sessionStarterInstructionalNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.invertedBeachWave,
        direction: InstructionalGradientDirections.enlarge,
        position: InstructionalNokhtePositions.top,
      ),
    );
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected && !hasInitiatedBlur) {
      onInitInstructionMode();
    }
  }

  @action
  onSwipeUp() {
    if (!isDisconnected && isAllowedToMakeAGesture) {
      if ((!hasInitiatedBlur && !hasSwiped()) ||
          primarySmartText.currentIndex == 3) {
        centerInstructionalNokhte.setWidgetVisibility(false);
        gestureCross.centerCrossNokhte.setWidgetVisibility(true);
        prepForNavigation(excludeUnBlur: !hasInitiatedBlur);
        setSwipeDirection(GestureDirections.up);
      }
    }
  }

  @action
  onSwipeLeft() {
    if (!isDisconnected && isAllowedToMakeAGesture) {
      if (primarySmartText.currentIndex == 1) {
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.right);
        focusInstructionalNokhte.setControl(Control.playFromStart);
        sessionStarterInstructionalNokhte.setWidgetVisibility(false);
        primarySmartText.startRotatingText(isResuming: true);
        swipeGuide.setWidgetVisibility(false);
      } else if (primarySmartText.currentIndex == 3 && !hasSwiped()) {
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

      setSwipeDirection(GestureDirections.left);
    }
  }

  @action
  onTap(Offset tapPosition) {
    if (!isDisconnected && primarySmartText.currentIndex == 2 && hasSwiped()) {
      setSwipeDirection(GestureDirections.initial);
      dismissInstructionalNokhte(tapPosition,
          colorway: GradientNokhteColorways.vibrantBlue,
          gradPosition: InstructionalNokhtePositions.right,
          centerPosition: CenterNokhtePositions.right, onDismiss: () {
        sessionStarterInstructionalNokhte.setWidgetVisibility(true);
        sessionStarterInstructionalNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.invertedBeachWave,
            direction: InstructionalGradientDirections.shrink,
            position: InstructionalNokhtePositions.top,
          ),
        );
      });
    }
  }

  centerInstructionalNokhteMovieReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (centerInstructionalNokhte.movieMode ==
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
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
