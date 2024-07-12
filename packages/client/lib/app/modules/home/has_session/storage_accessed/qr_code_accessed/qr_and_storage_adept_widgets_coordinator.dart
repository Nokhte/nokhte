// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:simple_animations/simple_animations.dart';
part 'qr_and_storage_adept_widgets_coordinator.g.dart';

class QrAndStorageAdeptWidgetsCoordinator = _QrAndStorageAdeptWidgetsCoordinatorBase
    with _$QrAndStorageAdeptWidgetsCoordinator;

abstract class _QrAndStorageAdeptWidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator
    with
        Store,
        EnRoute,
        Reactions,
        EnRouteConsumer,
        SwipeNavigationUtils,
        InstructionWidgetsUtils,
        TouchRippleUtils,
        HomeScreenWidgetsUtils,
        InstructionalNokhteWidgetUtils,
        SingleInstructionalNokhteWidgetUtils {
  @override
  InstructionalGradientNokhteStore? focusInstructionalNokhte;
  InstructionalGradientNokhteStore sessionStarterInstructionalNokhte;
  InstructionalGradientNokhteStore storageInstructionalNokhte;

  _QrAndStorageAdeptWidgetsCoordinatorBase({
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.smartText,
    required super.touchRipple,
    required super.centerInstructionalNokhte,
    required this.sessionStarterInstructionalNokhte,
    required this.storageInstructionalNokhte,
  });

  @action
  constructor(Offset center) {
    initHomeUtils();
    initInstructionalNokhteUtils(center);
    gestureCross.fadeIn();
    smartText.setMessagesData(HomeLists.qrAndStorageAdept);
    smartText.startRotatingText();
    initReactors();
  }

  @action
  onSwipeUp() {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (hasInitiatedBlur && !hasSwiped()) {
        smartText.setCurrentIndex(0);
        initToTopInstructionalNokhte(excludePaddingAdjuster: true);
        storageInstructionalNokhte.setWidgetVisibility(false);
      } else if (!hasInitiatedBlur && !hasSwiped()) {
        initSessionStarterTransition();
      }
    }
  }

  @action
  initReactors() {
    disposers.add(gestureCrossTapReactor());
    disposers.add(centerCrossNokhteReactor(() {
      sessionStarterInstructionalNokhte.setWidgetVisibility(false);
      storageInstructionalNokhte.setWidgetVisibility(false);
    }));
  }

  @action
  onSwipeLeft() {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (hasInitiatedBlur && !hasSwiped()) {
        smartText.setCurrentIndex(2);
        initToRightInstructionalNokhte();
        sessionStarterInstructionalNokhte.setWidgetVisibility(false);
      } else if (!hasInitiatedBlur) {
        initStorageTransition();
      }
    }
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @action
  onTap(Offset offset) {
    if (!isDisconnected && hasInitiatedBlur && isAllowedToMakeGesture()) {
      touchRipple.onTap(offset);
      setHasInitiatedBlur(false);
      smartText.startRotatingText(isResuming: true);
      if (swipeDirection == GestureDirections.left) {
        sessionStarterInstructionalNokhte.setWidgetVisibility(true);
        moveGradInstructionalNokhtes(shouldExpand: false);
        storageInstructionalNokhte.setWidgetVisibility(true);
        centerInstructionalNokhte.moveBackToCross(
          startingPosition: CenterNokhtePositions.right,
        );
        nokhteBlur.reverse();
        beachWaves.currentStore.setControl(Control.mirror);
      } else if (swipeDirection == GestureDirections.up) {
        sessionStarterInstructionalNokhte.setWidgetVisibility(true);
        moveGradInstructionalNokhtes(shouldExpand: false);
        storageInstructionalNokhte.setWidgetVisibility(true);
        centerInstructionalNokhte.moveBackToCross(
          startingPosition: CenterNokhtePositions.top,
        );
        nokhteBlur.reverse();
        beachWaves.currentStore.setControl(Control.mirror);
      }
      setSwipeDirection(GestureDirections.initial);
    } else if (hasInitiatedBlur && isAllowedToMakeGesture()) {
      dismissInstructionalNokhte();
    }
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (!hasInitiatedBlur) {
        baseOnInitInstructionMode(
          excldeSmartTextRotation: true,
          excludePaddingAdjuster: true,
        );
        sessionStarterInstructionalNokhte.setWidgetVisibility(true);
        storageInstructionalNokhte.setWidgetVisibility(true);
        moveGradInstructionalNokhtes(shouldExpand: true);
      } else if (hasInitiatedBlur) {
        dismissInstructionalNokhte();
      }
    }
  }

  @action
  dismissInstructionalNokhte() {
    setHasInitiatedBlur(false);
    setSwipeDirection(GestureDirections.initial);
    centerInstructionalNokhte.moveBackToCross(
      startingPosition: CenterNokhtePositions.center,
    );
    moveGradInstructionalNokhtes(shouldExpand: false);
    nokhteBlur.reverse();
    beachWaves.currentStore.setControl(Control.mirror);
    smartText.reset();
    smartText.startRotatingText();
    delayedEnableTouchFeedback();
  }

  moveGradInstructionalNokhtes({required bool shouldExpand}) {
    final dir = shouldExpand
        ? InstructionalGradientDirections.enlarge
        : InstructionalGradientDirections.shrink;
    sessionStarterInstructionalNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.invertedBeachWave,
        direction: dir,
        position: InstructionalNokhtePositions.top,
      ),
    );
    storageInstructionalNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.vibrantBlue,
        direction: dir,
        position: InstructionalNokhtePositions.right,
      ),
    );
  }
}
