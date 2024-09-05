// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
import 'package:simple_animations/simple_animations.dart';
part 'home_widgets_coordinator.g.dart';

class HomeWidgetsCoordinator = _HomeWidgetsCoordinatorBase
    with _$HomeWidgetsCoordinator;

abstract class _HomeWidgetsCoordinatorBase
    with
        Store,
        EnRoute,
        Reactions,
        EnRouteConsumer,
        SwipeNavigationUtils,
        InstructionWidgetsUtils,
        TouchRippleUtils,
        SmartTextPaddingAdjuster,
        HomeScreenWidgetsUtils,
        BaseWidgetsCoordinator,
        SingleInstructionalNokhteWidgetUtils {
  InstructionalGradientNokhteStore sessionStarterInstructionalNokhte;
  InstructionalGradientNokhteStore storageInstructionalNokhte;
  InstructionalGradientNokhteStore sessionJoinerInstructionalNokhte;
  SwipeGuideStore swipeGuides;
  @override
  final NokhteBlurStore nokhteBlur;
  @override
  final GestureCrossStore gestureCross;
  @override
  final SmartTextStore smartText;
  @override
  final TouchRippleStore touchRipple;
  @override
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  @override
  final BeachWavesStore beachWaves;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _HomeWidgetsCoordinatorBase({
    required this.nokhteBlur,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.smartText,
    required this.touchRipple,
    required this.centerInstructionalNokhte,
    required this.swipeGuides,
    required this.sessionStarterInstructionalNokhte,
    required this.sessionJoinerInstructionalNokhte,
    required this.storageInstructionalNokhte,
  });

  @action
  constructor() {
    initHomeUtils();
    gestureCross.fadeIn();
    swipeGuides.setWidgetVisibility(false);
    centerInstructionalNokhte.fadeIn();
    sessionStarterInstructionalNokhte.setAndFadeIn(
      InstructionalNokhtePositions.top,
      GradientNokhteColorways.invertedBeachWave,
    );
    sessionJoinerInstructionalNokhte.setAndFadeIn(
      InstructionalNokhtePositions.bottom,
      GradientNokhteColorways.orangeSand,
    );
    storageInstructionalNokhte.setAndFadeIn(
      InstructionalNokhtePositions.right,
      GradientNokhteColorways.vibrantBlue,
    );
    smartText.setMessagesData(HomeLists.qrAndStorageAdept);
    smartText.startRotatingText();
    initReactors();
  }

  @action
  onSwipeUp() {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (hasInitiatedBlur && !hasSwiped()) {
        initToTopInstructionalNokhte(excludePaddingAdjuster: true);
        storageInstructionalNokhte.setWidgetVisibility(false);
      }
    }
  }

  onSwipeDown() {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (hasInitiatedBlur && !hasSwiped()) {
        setSwipeDirection(GestureDirections.down);
        centerInstructionalNokhte
            .initMovie(InstructionalNokhtePositions.bottom);
        sessionStarterInstructionalNokhte.disappear();
        storageInstructionalNokhte.disappear();
        setSwipeGuideVisibilities(false);
      }
    }
  }

  @action
  onSwipeRight() {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (hasInitiatedBlur && !hasSwiped()) {
        setSwipeDirection(GestureDirections.down);
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.right);
        sessionStarterInstructionalNokhte.disappear();
        sessionJoinerInstructionalNokhte.disappear();
        setSwipeGuideVisibilities(false);
      }
    }
  }

  @action
  initReactors() {
    disposers.add(gestureCrossTapReactor());
    disposers.add(sessionJoinerInstructionalNokhteReactor());
    disposers.add(centerInstructionalNokhteReactor());
    disposers.add(storageInstructionalNokhteReactor());

    // sessionStarterInstructionalNokhte.setWidgetVisibility(false);
    // storageInstructionalNokhte.setWidgetVisibility(false);
    // }));
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  sessionJoinerInstructionalNokhteReactor() =>
      reaction((p0) => sessionJoinerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            sessionJoinerInstructionalNokhte.movieMode ==
                GradientNokhteMovieModes.explode) {
          Modular.to.navigate(SessionStarterConstants.sessionJoiner);
        }
      });
  storageInstructionalNokhteReactor() =>
      reaction((p0) => storageInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            storageInstructionalNokhte.movieMode ==
                GradientNokhteMovieModes.explode) {
          Modular.to.navigate(StorageConstants.root);
        }
      });

  centerInstructionalNokhteReactor() => reaction(
        (p0) => centerInstructionalNokhte.movieStatus,
        (p0) {
          if (p0 == MovieStatus.finished &&
              centerInstructionalNokhte.movieMode ==
                  CenterInstructionalNokhteMovieModes.moveAround) {
            if (centerInstructionalNokhte.position ==
                InstructionalNokhtePositions.bottom) {
              sessionJoinerInstructionalNokhte.explode();
            } else if (centerInstructionalNokhte.position ==
                InstructionalNokhtePositions.right) {
              storageInstructionalNokhte.explode();
            }
            // Modular.to.navigate(SessionStarterConstants.sessionJoiner);
          }
        },
      );

  @action
  onTap(Offset offset) {
    if (!isDisconnected && hasInitiatedBlur && isAllowedToMakeGesture()) {
      if (hasSwiped()) {
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
      } else {
        dismissInstructionalNokhte();
      }
    }
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected &&
        isAllowedToMakeGesture() &&
        beachWaves.movieMode == BeachWaveMovieModes.onShore) {
      if (!hasInitiatedBlur) {
        baseOnInitInstructionMode(
          excludeSmartTextRotation: true,
          excludePaddingAdjuster: true,
        );
        Timer(Seconds.get(1), () {
          setSwipeGuideVisibilities(true);
        });
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
    setSwipeGuideVisibilities(false);
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

  setSwipeGuideVisibilities(bool shouldShow) {
    swipeGuides.setWidgetVisibility(shouldShow);
  }

  moveGradInstructionalNokhtes({required bool shouldExpand}) {
    final dir = shouldExpand
        ? InstructionalGradientDirections.enlarge
        : InstructionalGradientDirections.shrink;
    sessionStarterInstructionalNokhte.initMovie(dir);
    sessionJoinerInstructionalNokhte.initMovie(dir);
    storageInstructionalNokhte.initMovie(dir);
  }
}
