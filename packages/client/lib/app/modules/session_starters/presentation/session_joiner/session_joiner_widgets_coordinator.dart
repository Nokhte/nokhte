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
        SingleInstructionalNokhteWidgetUtils,
        SessionStarterWidgetsUtils {
  @override
  final BeachWavesStore beachWaves;
  @override
  final SmartTextStore smartText;
  final TintStore tint;
  @override
  final TouchRippleStore touchRipple;
  @override
  final GestureCrossStore gestureCross;
  @override
  NokhteQrCodeStore? qrCode;
  @override
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  @override
  final NokhteBlurStore nokhteBlur;
  final QrScannerStore qrScanner;
  final InstructionalGradientNokhteStore homeInstructionalNokhte;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

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
    disposers.add(qrScannerReactor());
    // disposers.add(centerCrossNokhteReactor());
    disposers.add(gestureCrossTapReactor());
  }

  @action
  onSwipeRight() {
    if (!hasSwiped() &&
        beachWaves.movieMode !=
            BeachWaveMovieModes.emptyOceanToInvertedDeepSea) {
      if (!hasInitiatedBlur && isAllowedToMakeGesture()) {
        setSwipeDirection(GestureDirections.right);
        qrScanner.fadeOut();
        gestureCross.fadeAllIn();
        centerInstructionalNokhte.setWidgetVisibility(false);
        homeInstructionalNokhte.setWidgetVisibility(false);
        beachWaves.currentStore.reverseMovie(-10.0);
        beachWaves.setMovieStatus(MovieStatus.inProgress);
        gestureCross.initMoveAndRegenerate(CircleOffsets.left);
        gestureCross.cross.initOutlineFadeOut();
      } else {
        smartText.setCurrentIndex(0);
        smartText.setWidgetVisibility(true);
        initToLeftInstructionalNokhte();
      }
    }
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

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @action
  onGestureCrossTap() {
    if (!isDisconnected &&
        isAllowedToMakeGesture() &&
        !hasSwiped() &&
        beachWaves.movieMode == BeachWaveMovieModes.emptyTheOcean) {
      if (!hasInitiatedBlur) {
        baseOnInitInstructionMode(
          excludeSmartTextRotation: true,
          excludePaddingAdjuster: true,
        );
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

  // centerCrossNokhteReactor() =>
  //     reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
  //       if (p0 == MovieStatus.finished) {
  //         gestureCross.gradientNokhte.setWidgetVisibility(false);
  //         gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
  //       }
  //     });

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
