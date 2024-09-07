// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'package:nokhte/app/modules/session_joiner/session_joiner.dart';
part 'session_joiner_widgets_coordinator.g.dart';

class SessionJoinerWidgetsCoordinator = _SessionJoinerWidgetsCoordinatorBase
    with _$SessionJoinerWidgetsCoordinator;

abstract class _SessionJoinerWidgetsCoordinatorBase
    with
        Store,
        BaseWidgetsCoordinator,
        Reactions,
        SwipeNavigationUtils,
        InstructionWidgetsUtils,
        HomeNavigation {
  final GestureCrossStore gestureCross;
  final QrScannerStore qrScanner;
  final BeachWavesStore beachWaves;
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
    required this.gestureCross,
    required this.qrScanner,
    required this.wifiDisconnectOverlay,
    required this.centerInstructionalNokhte,
    required this.homeInstructionalNokhte,
    required this.swipeGuide,
  }) {
    initSwipeNavigationUtils();
    initBaseWidgetsCoordinatorActions();
    initInstructionWidgetsUtils();
  }

  @action
  constructor(Offset center) {
    gestureCross.cross.initStaticGlow();
    centerInstructionalNokhte.setWidgetVisibility(false);
    beachWaves.setMovieMode(BeachWaveMovieModes.emptyTheOcean);
    initReactors();
  }

  initReactors() {
    disposers.add(qrScannerReactor());
    disposers.add(gestureCrossTapReactor());
    disposers.add(beachWavesReactor());
    initHomeNavigationReactions();
  }

  @action
  enterSession() {
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

  beachWavesReactor() => reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate(SessionConstants.preview);
        }
      });

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
