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
import 'package:nokhte/app/modules/session_joiner/session_joiner.dart';
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
        SmartTextPaddingAdjuster,
        BaseWidgetsCoordinator {
  InstructionalGradientNokhteStore sessionStarterInstructionalNokhte;
  InstructionalGradientNokhteStore storageInstructionalNokhte;
  InstructionalGradientNokhteStore sessionJoinerInstructionalNokhte;
  SwipeGuideStore swipeGuides;
  final NokhteBlurStore nokhteBlur;
  final GestureCrossStore gestureCross;
  final SmartTextStore smartText;
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
    required this.centerInstructionalNokhte,
    required this.swipeGuides,
    required this.sessionStarterInstructionalNokhte,
    required this.sessionJoinerInstructionalNokhte,
    required this.storageInstructionalNokhte,
  }) {
    initSwipeNavigationUtils();
    initInstructionWidgetsUtils();
    initSmartTextActions();
    initBaseWidgetsCoordinatorActions();
  }

  @action
  constructor() {
    gestureCross.fadeInTheCross();
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
    smartText.setMessagesData(HomeList.list);
    smartText.startRotatingText();
    initReactors();
  }

  @action
  onSwipeUp() {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (hasInitiatedBlur && !hasSwiped()) {
        setSwipeDirection(GestureDirections.up);
        nokhteBlur.reverse();
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.top);
        sessionJoinerInstructionalNokhte.disappear();
        storageInstructionalNokhte.disappear();
        smartText.setWidgetVisibility(false);
        setSwipeGuideVisibilities(false);
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
        smartText.setWidgetVisibility(false);
        setSwipeGuideVisibilities(false);
      }
    }
  }

  @action
  onSwipeRight() {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (hasInitiatedBlur && !hasSwiped()) {
        setSwipeDirection(GestureDirections.down);
        smartText.setWidgetVisibility(false);
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.right);
        sessionStarterInstructionalNokhte.disappear();
        sessionJoinerInstructionalNokhte.disappear();
        setSwipeGuideVisibilities(false);
      }
    }
  }

  @action
  initReactors() {
    disposers.add(smartTextIndexReactor());
    disposers.add(gestureCrossTapReactor());
    disposers.add(sessionJoinerInstructionalNokhteReactor());
    disposers.add(centerInstructionalNokhteReactor());
    disposers.add(storageInstructionalNokhteReactor());
    disposers.add(sessionStarterInstructionalNokhteReactor());
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
          Modular.to.navigate(SessionJoinerConstants.sessionJoiner);
        }
      });

  sessionStarterInstructionalNokhteReactor() =>
      reaction((p0) => sessionStarterInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            sessionStarterInstructionalNokhte.movieMode ==
                GradientNokhteMovieModes.explode) {
          Modular.to.navigate(SessionStarterConstants.sessionStarterEntry);
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
            } else if (centerInstructionalNokhte.position ==
                InstructionalNokhtePositions.top) {
              sessionStarterInstructionalNokhte.explode();
            }
          }
        },
      );

  @action
  onTap(Offset offset) {
    if (!isDisconnected &&
        hasInitiatedBlur &&
        isAllowedToMakeGesture() &&
        !hasSwiped()) {
      dismissInstructionalNokhte();
    }
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected &&
        isAllowedToMakeGesture() &&
        beachWaves.movieMode == BeachWaveMovieModes.onShore) {
      if (!hasInitiatedBlur) {
        setHasInitiatedBlur(true);
        nokhteBlur.init();
        beachWaves.currentStore.setControl(Control.stop);
        smartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveToCenter();
        Timer(const Duration(seconds: 0, milliseconds: 500), () {
          setSmartTextTopPaddingScalar(.6);
        });

        Timer(Seconds.get(1), () {
          setSwipeGuideVisibilities(true);
        });
        sessionStarterInstructionalNokhte.setWidgetVisibility(true);
        storageInstructionalNokhte.setWidgetVisibility(true);
        moveGradInstructionalNokhtes(shouldExpand: true);
      } else if (hasInitiatedBlur && !hasSwiped()) {
        dismissInstructionalNokhte();
      }
    }
  }

  smartTextIndexReactor() => reaction((p0) => smartText.currentIndex, (p0) {
        if (p0 == 2) {
          setSmartTextTopPaddingScalar(0.0);
          smartText.reset();
        }
      });

  // add a smartText index reactor

  @action
  dismissInstructionalNokhte() {
    setSwipeGuideVisibilities(false);
    setHasInitiatedBlur(false);
    smartText.startRotatingText(isResuming: true);
    setSwipeDirection(GestureDirections.initial);
    centerInstructionalNokhte.moveBackToCross(
      startingPosition: CenterNokhtePositions.center,
    );
    moveGradInstructionalNokhtes(shouldExpand: false);
    nokhteBlur.reverse();
    beachWaves.currentStore.setControl(Control.mirror);
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
