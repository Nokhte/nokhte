// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'short_qr_guide_widgets_coordinator.g.dart';

class ShortQrGuideWidgetsCoordinator = _ShortQrGuideWidgetsCoordinatorBase
    with _$ShortQrGuideWidgetsCoordinator;

abstract class _ShortQrGuideWidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator
    with
        Store,
        Reactions,
        EnRoute,
        EnRouteConsumer,
        HomeScreenWidgetsUtils,
        InstructionalNokhteWidgetUtils,
        // SmartTextPaddingAdjuster,
        SingleInstructionalNokhteWidgetUtils {
  @override
  final InstructionalGradientNokhteStore focusInstructionalNokhte;
  _ShortQrGuideWidgetsCoordinatorBase({
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.primarySmartText,
    required super.touchRipple,
    required super.centerInstructionalNokhte,
    required super.sessionStarterInstructionalNokhte,
    required super.storageInstructionalNokhte,
  }) : focusInstructionalNokhte = sessionStarterInstructionalNokhte;

  @override
  @action
  constructor(Offset center) {
    initHomeUtils();
    initInstructionalNokhteUtils(center);
    setTouchIsDisabled(true);
    gestureCross.fadeIn();
    primarySmartText.setMessagesData(HomeLists.shortQrGuide);
    primarySmartText.startRotatingText();
    focusInstructionalNokhte.setWidgetVisibility(false);
    focusInstructionalNokhte.prepareYellowDiamond(
      center,
      position: InstructionalNokhtePositions.top,
      colorway: GradientNokhteColorways.invertedBeachWave,
    );
    initReactors();
  }

  @action
  initReactors() {
    disposers.add(gestureCrossTapReactor());
    disposers.add(centerCrossNokhteReactor(() {
      focusInstructionalNokhte.setWidgetVisibility(false);
      storageInstructionalNokhte.setWidgetVisibility(false);
    }));
    disposers.add(centerInstructionalNokhteMovieReactor());
  }

  @action
  onSwipeUp() {
    if (!isDisconnected && isAllowedToMakeAGesture) {
      if (primarySmartText.currentIndex == 1) {
        initToTopInstructionalNokhte();
        storageInstructionalNokhte.setWidgetVisibility(false);
      } else if (primarySmartText.currentIndex == 3) {
        prepForNavigation(excludeUnBlur: !hasInitiatedBlur);
      }
    }
  }

  @action
  onTap(Offset offset) {
    if (!isDisconnected &&
        isAllowedToMakeAGesture &&
        primarySmartText.currentIndex == 2 &&
        !touchIsDisabled) {
      dismissInstructionalNokhte(offset,
          colorway: GradientNokhteColorways.invertedBeachWave,
          gradPosition: InstructionalNokhtePositions.top,
          centerPosition: CenterNokhtePositions.top, onDismiss: () {
        storageInstructionalNokhte.setWidgetVisibility(true);
        storageInstructionalNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.vibrantBlue,
            direction: InstructionalGradientDirections.shrink,
            position: InstructionalNokhtePositions.right,
          ),
        );
      });
    }
  }

  centerInstructionalNokhteMovieReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            centerInstructionalNokhte.movieMode ==
                CenterInstructionalNokhteMovieModes.moveBack) {
          gestureCross.centerCrossNokhte.setWidgetVisibility(true);
        }
      });

  @action
  onSwipeLeft() {
    if (!isDisconnected && !hasInitiatedBlur && !hasSwiped()) {
      setSwipeDirection(GestureDirections.left);
      beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToSky);
      beachWaves.currentStore.initMovie(
        beachWaves.currentAnimationValues.first,
      );
      gestureCross.initMoveAndRegenerate(CircleOffsets.right);
      gestureCross.cross.initOutlineFadeIn();
      primarySmartText.setWidgetVisibility(false);
    }
  }

  @action
  onInitInstructionMode() {
    baseOnInitInstructionMode();
    storageInstructionalNokhte.setWidgetVisibility(true);
    storageInstructionalNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.vibrantBlue,
        direction: InstructionalGradientDirections.enlarge,
        position: InstructionalNokhtePositions.right,
      ),
    );
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected && !hasInitiatedBlur) {
      onInitInstructionMode();
    }
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @computed
  bool get isAllowedToMakeAGesture =>
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
