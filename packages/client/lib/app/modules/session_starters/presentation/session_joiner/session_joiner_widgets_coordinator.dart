// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
part 'session_joiner_widgets_coordinator.g.dart';

class SessionJoinerWidgetsCoordinator = _SessionJoinerWidgetsCoordinatorBase
    with _$SessionJoinerWidgetsCoordinator;

abstract class _SessionJoinerWidgetsCoordinatorBase
    with
        Store,
        SmartTextPaddingAdjuster,
        BaseWidgetsCoordinator,
        Reactions,
        SwipeNavigationUtils,
        EnRoute,
        EnRouteConsumer,
        TouchRippleUtils,
        InstructionWidgetsUtils,
        HomeNavigation {
  final SmartTextStore smartText;
  final TintStore tint;
  final GestureCrossStore gestureCross;
  final NokhteBlurStore nokhteBlur;
  final QrScannerStore qrScanner;
  @override
  final BeachWavesStore beachWaves;
  @override
  final TouchRippleStore touchRipple;
  @override
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  @override
  final InstructionalGradientNokhteStore homeInstructionalNokhte;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  @override
  final SwipeGuideStore swipeGuide;

  _SessionJoinerWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.tint,
    required this.gestureCross,
    required this.nokhteBlur,
    required this.qrScanner,
    required this.touchRipple,
    required this.smartText,
    required this.wifiDisconnectOverlay,
    required this.centerInstructionalNokhte,
    required this.homeInstructionalNokhte,
    required this.swipeGuide,
  }) {
    initSwipeNavigationUtils();
    initEnRouteActions();
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
    initInstructionWidgetsUtils();
    setSmartTextTopPaddingScalar(0);
    setSmartTextBottomPaddingScalar(.27);
    setSmartTextSubMessagePaddingScalar(110);
  }

  @action
  constructor(Offset center) {
    gestureCross.cross.initStaticGlow();
    centerInstructionalNokhte.setWidgetVisibility(false);
    tint.initMovie(NoParams());
    smartText.setMessagesData(
      [SharedLists.emptyItem, InstructionItems.sessionStarterExplanation],
    );
    smartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.emptyTheOcean);
    initReactors();
  }

  initReactors() {
    disposers.add(qrScannerReactor());
    disposers.add(gestureCrossTapReactor());
    initHomeNavigationReactions();
  }

  @action
  enterSession() {
    nokhteBlur.reverse();
    beachWaves.setMovieMode(BeachWaveMovieModes.emptyOceanToInvertedDeepSea);
    beachWaves.currentStore.initMovie(NoParams());
    gestureCross.fadeAllOut();
    centerInstructionalNokhte.setWidgetVisibility(false);
    homeInstructionalNokhte.setWidgetVisibility(false);
    qrScanner.fadeOut();
  }

  @action
  onTap(Offset offset) {
    if (hasInitiatedBlur && isAllowedToMakeGesture()) {
      dismissInstructionalNokhtes();
    }
  }

  beachWavesReactor({
    required bool hasAccessedQrCode,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (hasSwiped()) {
            if (hasAccessedQrCode) {
              Modular.to.navigate(SessionStarterConstants.sessionStarter);
            } else {
              Modular.to
                  .navigate(SessionStarterConstants.sessionStarterInstructions);
            }
          } else {
            Modular.to.navigate(SessionConstants.preview);
          }
        }
      });

  @action
  onSwipeUp() {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (hasInitiatedBlur && !hasSwiped()) {
        setSwipeDirection(GestureDirections.up);
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.top);
        swipeGuide.setWidgetVisibility(false);
      }
    }
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @action
  onGestureCrossTap() {
    if (!isDisconnected && isAllowedToMakeGesture() && !hasSwiped()) {
      if (!hasInitiatedBlur) {
        swipeGuide.fadeIn();
        centerInstructionalNokhte.moveToCenter();
        setHasInitiatedBlur(true);
        // baseOnInitInstructionMode(
        //   excludeSmartTextRotation: true,
        //   excludePaddingAdjuster: true,
        // );
        qrScanner.fadeOut();
        homeInstructionalNokhte.setWidgetVisibility(true);
        moveSessionStarterInstructionalNokhte(true);
      } else {
        dismissInstructionalNokhtes();
      }
    }
  }

  dismissInstructionalNokhtes() {
    if (hasInitiatedBlur) {
      setHasInitiatedBlur(false);
      qrScanner.fadeIn();
      moveSessionStarterInstructionalNokhte(false);
      final position = hasSwiped()
          ? CenterNokhtePositions.left
          : CenterNokhtePositions.center;
      centerInstructionalNokhte.moveBackToCross(startingPosition: position);
      smartText.setWidgetVisibility(false);
      nokhteBlur.reverse();
      setSwipeDirection(GestureDirections.initial);
    }
  }

  moveSessionStarterInstructionalNokhte(bool shouldExpand) {
    homeInstructionalNokhte.initMovie(
      shouldExpand
          ? InstructionalGradientDirections.enlarge
          : InstructionalGradientDirections.shrink,
    );
  }

  qrScannerReactor() => reaction((p0) => qrScanner.showWidget, (p0) {
        if (p0) {
          if (!gestureCross.cross.showWidget) {
            gestureCross.fadeInTheCross();
            centerInstructionalNokhte.fadeIn();
            homeInstructionalNokhte.setAndFadeIn(
              InstructionalNokhtePositions.top,
              GradientNokhteColorways.beachWave,
            );
          }
          beachWaves.currentStore.setWidgetVisibility(false);
        } else {
          beachWaves.currentStore.setWidgetVisibility(true);
        }
      });
}
