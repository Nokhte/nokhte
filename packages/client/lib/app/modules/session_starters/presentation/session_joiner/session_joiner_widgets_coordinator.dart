// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
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
  final QrScannerStore qrScanner;
  final InstructionalGradientNokhteStore sessionStarterInstructionalNokhte;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionJoinerWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.tint,
    required this.gestureCross,
    required this.qrScanner,
    required this.touchRipple,
    required this.smartText,
    required this.wifiDisconnectOverlay,
    required this.centerInstructionalNokhte,
    required this.sessionStarterInstructionalNokhte,
  }) {
    initSwipeNavigationUtils();
    initEnRouteActions();
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
    setSmartTextTopPaddingScalar(0);
    setSmartTextBottomPaddingScalar(.27);
    setSmartTextSubMessagePaddingScalar(110);
  }

  @action
  constructor(Offset centerParam) {
    setCenter(centerParam);
    gestureCross.cross.initStaticGlow();
    gestureCross.fadeIn(onFadeIn: Left(() {
      gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
    }));
    tint.initMovie(NoParams());
    smartText.setMessagesData(SessionStartersList.sessionJoinerInstructions);
    beachWaves.setMovieMode(BeachWaveMovieModes.emptyTheOcean);
    disposers.add(qrScannerReactor());
    disposers.add(beachWavesReactor());
    disposers.add(centerCrossNokhteReactor());
  }

  @action
  onSwipeRight() {
    if (!hasSwiped() &&
        beachWaves.movieMode !=
            BeachWaveMovieModes.emptyOceanToInvertedDeepSea) {
      setSwipeDirection(GestureDirections.right);
      qrScanner.fadeOut();
      beachWaves.currentStore.reverseMovie(-10.0);
      gestureCross.initMoveAndRegenerate(CircleOffsets.left);
      gestureCross.cross.initOutlineFadeOut();
    }
  }

  @action
  enterSession() {
    beachWaves.setMovieMode(BeachWaveMovieModes.emptyOceanToInvertedDeepSea);
    beachWaves.currentStore.initMovie(NoParams());
    gestureCross.fadeAllOut();
    centerInstructionalNokhte.setWidgetVisibility(false);
    sessionStarterInstructionalNokhte.setWidgetVisibility(false);
    qrScanner.fadeOut();
  }

  beachWavesReactor() => reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (hasSwiped()) {
            Modular.to.navigate(SessionStarterConstants.sessionStarter);
          } else {
            Modular.to.navigate(SessionConstants.preview);
          }
        }
      });

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        }
      });

  qrScannerReactor() => reaction((p0) => qrScanner.showWidget, (p0) {
        if (p0) {
          beachWaves.currentStore.setWidgetVisibility(false);
        } else {
          beachWaves.currentStore.setWidgetVisibility(true);
        }
      });
}
