// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
part 'session_starter_instructions_widgets_coordinator.g.dart';

class SessionStarterInstructionsWidgetsCoordinator = _SessionStarterInstructionsWidgetsCoordinatorBase
    with _$SessionStarterInstructionsWidgetsCoordinator;

abstract class _SessionStarterInstructionsWidgetsCoordinatorBase
    with
        Store,
        SmartTextPaddingAdjuster,
        SwipeNavigationUtils,
        InstructionWidgetsUtils,
        BaseWidgetsCoordinator,
        InstructionalNokhteWidgetUtils,
        SingleInstructionalNokhteWidgetUtils,
        Reactions,
        TouchRippleUtils,
        EnRoute,
        EnRouteConsumer,
        SessionStarterWidgetsUtils {
  final SwipeGuideStore swipeGuide;

  @override
  final NokhteQrCodeStore qrCode;
  @override
  final SmartTextStore smartText;
  @override
  final GestureCrossStore gestureCross;
  @override
  final TouchRippleStore touchRipple;
  @override
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  @override
  final NokhteBlurStore nokhteBlur;
  final InstructionalGradientNokhteStore homeInstructionalNokhte;
  @override
  final InstructionalGradientNokhteStore focusInstructionalNokhte;
  @override
  final BeachWavesStore beachWaves;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionStarterInstructionsWidgetsCoordinatorBase({
    required this.swipeGuide,
    required this.beachWaves,
    required this.touchRipple,
    required this.gestureCross,
    required this.smartText,
    required this.wifiDisconnectOverlay,
    required this.centerInstructionalNokhte,
    required this.nokhteBlur,
    required this.homeInstructionalNokhte,
    required this.focusInstructionalNokhte,
    required this.qrCode,
  }) {
    initSwipeNavigationUtils();
    initInstructionWidgetsUtils();
    initEnRouteActions();
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
    setSmartTextTopPaddingScalar(0.2);
    setSmartTextBottomPaddingScalar(0);
    setSmartTextSubMessagePaddingScalar(110);
  }

  @action
  constructor(Offset center) {
    consumeRoutingArgs(isInverted: true);
    initInstructionalNokhteUtils(center);
    swipeGuide.setWidgetVisibility(false);
    gestureCross.fadeInTheCross();
    qrCode.setQrCodeData(SessionStarterConstants.inactiveQrCodeData);
    qrCode.initFadeIn();
    smartText.setMessagesData(SessionStartersList.sessionStarterInstructions);

    smartText.startRotatingText();
    focusInstructionalNokhte.prepareYellowDiamond(
      center,
      position: InstructionalNokhtePositions.left,
      colorway: GradientNokhteColorways.deeperBlue,
    );
    initReactors();
  }

  @action
  onSwipeRight() {
    if (centerInstructionalNokhte.movieStatus != MovieStatus.inProgress) {
      if (smartText.currentIndex == 1) {
        initToLeftInstructionalNokhte();
        swipeGuide.setWidgetVisibility(false);
        homeInstructionalNokhte.setWidgetVisibility(false);
      } else if (smartText.currentIndex == 3) {
        initEnterPresets();
      }
    }
  }

  @action
  onSwipeLeft() {
    if (!hasInitiatedBlur && !hasSwiped()) {
      smartText.setWidgetVisibility(false);
      qrCode.setWidgetVisibility(false);
      initEnterSessionJoiner();
    }
  }

  @action
  onSwipeDown() {
    if (!hasInitiatedBlur && !hasSwiped()) {
      initExitSessionStarter();
      homeInstructionalNokhte.setWidgetVisibility(false);
    }
  }

  initReactors() {
    disposers.add(centerCrossNokhteReactor());
    disposers.add(gestureCrossTapReactor());
    disposers.add(beachWavesMovieStatusReactor(
      hasDonePresetInstructions: false,
    ));
    disposers.add(centerInstructionalNokhteReactor());
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (!hasInitiatedBlur && smartText.currentIndex == 0) {
        baseOnInitInstructionMode(
          excludePaddingAdjuster: true,
        );
        setSmartTextPadding(topPadding: .1);
        homeInstructionalNokhte.setWidgetVisibility(true);
        homeInstructionalNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.beachWave,
            direction: InstructionalGradientDirections.enlarge,
            position: InstructionalNokhtePositions.bottom,
          ),
        );
      }
    }
  }

  @observable
  GestureCrossConfiguration gestureCrossConfig = GestureCrossConfiguration();

  @action
  onUserInfoLoaded(bool hasAssessedQrCodeScanner) {
    Either<StrokeConfig, NokhteGradientConfig> homeConfig = Right(
      NokhteGradientConfig(
        gradientType: NokhteGradientTypes.home,
      ),
    );
    if (hasAssessedQrCodeScanner) {
      gestureCrossConfig = GestureCrossConfiguration(
        right: Right(
          NokhteGradientConfig(
            gradientType: NokhteGradientTypes.sessionJoiner,
          ),
        ),
        bottom: homeConfig,
      );
      //
    } else {
      gestureCrossConfig = GestureCrossConfiguration(
        bottom: homeConfig,
      );
    }
    gestureCross.fadeIn();
  }

  @action
  onTap(Offset offset) {
    if (!touchIsDisabled) {
      if (smartText.currentIndex == 2) {
        dismissMovedInstructionalNokhte(
          offset,
          onDismiss: () {
            homeInstructionalNokhte.setWidgetVisibility(true);
            homeInstructionalNokhte.initMovie(
              InstructionalGradientMovieParams(
                center: center,
                colorway: GradientNokhteColorways.beachWave,
                direction: InstructionalGradientDirections.shrink,
                position: InstructionalNokhtePositions.bottom,
              ),
            );
            setSmartTextTopPaddingScalar(.2);
          },
          colorway: GradientNokhteColorways.deeperBlue,
          gradPosition: InstructionalNokhtePositions.left,
          centerPosition: CenterNokhtePositions.left,
        );
      }
    }
  }

  centerInstructionalNokhteReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (centerInstructionalNokhte.movieMode ==
              CenterInstructionalNokhteMovieModes.moveBack) {
            gestureCross.centerCrossNokhte.setWidgetVisibility(true);
            gestureCross.gradientNokhte.setWidgetVisibility(true);
            smartText.startRotatingText();
            setSwipeDirection(GestureDirections.initial);
            setTouchIsDisabled(false);
          } else if (centerInstructionalNokhte.movieMode ==
              CenterInstructionalNokhteMovieModes.moveToCenter) {
            swipeGuide.setWidgetVisibility(true);
          }
        }
      });

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
          homeInstructionalNokhte.setWidgetVisibility(false);
          focusInstructionalNokhte.setWidgetVisibility(false);
        }
      });

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );
}
