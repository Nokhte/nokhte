// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/shared/mobx/mobx.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_starter_widgets_coordinator.g.dart';

class SessionStarterWidgetsCoordinator = _SessionStarterWidgetsCoordinatorBase
    with _$SessionStarterWidgetsCoordinator;

abstract class _SessionStarterWidgetsCoordinatorBase
    with
        Store,
        SmartTextPaddingAdjuster,
        SwipeNavigationUtils,
        InstructionWidgetsUtils,
        BaseWidgetsCoordinator,
        InstructionalNokhteWidgetUtils,
        SingleInstructionalNokhteWidgetUtils,
        Reactions,
        EnRoute,
        TouchRippleUtils,
        SessionStarterWidgetsUtils {
  @override
  final SmartTextStore smartText;
  final SmartTextStore qrSubtitleSmartText;
  final InstructionalGradientNokhteStore presetsInstructionalNokhte;
  final InstructionalGradientNokhteStore sessionJoinerInstructionalNokhte;
  final InstructionalGradientNokhteStore homeInstructionalNokhte;
  final PresetIconsStore presetIcons;
  @override
  final BeachWavesStore beachWaves;
  @override
  final GestureCrossStore gestureCross;
  @override
  final TouchRippleStore touchRipple;
  @override
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  @override
  final NokhteBlurStore nokhteBlur;
  @override
  final NokhteQrCodeStore qrCode;
  @override
  InstructionalGradientNokhteStore? focusInstructionalNokhte;

  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionStarterWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.touchRipple,
    required this.presetIcons,
    required this.gestureCross,
    required this.qrSubtitleSmartText,
    required this.smartText,
    required this.wifiDisconnectOverlay,
    required this.centerInstructionalNokhte,
    required this.homeInstructionalNokhte,
    required this.sessionJoinerInstructionalNokhte,
    required this.presetsInstructionalNokhte,
    required this.nokhteBlur,
    required this.qrCode,
  }) {
    initSwipeNavigationUtils();
    initInstructionWidgetsUtils();
    initEnRouteActions();
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
    initBaseWidgetsCoordinatorActions();
    presetIcons.setContainerSize(.2);
    presetIcons.setWidgetVisibility(false);
    presetIcons.setIsHorizontal(true);
    initSmartTextActions();
    setSmartTextPadding(
      excludeTimer: true,
      topPadding: .27,
      bottomPadding: 0,
      subMessagePadding: 110,
    );
  }

  @observable
  bool isEnteringNokhteSession = false;

  @observable
  ObservableList<Widget> tags = ObservableList.of([]);

  @action
  constructor(Offset center) {
    initInstructionalNokhteUtils(center);
    qrCode.setWidgetVisibility(false);
    gestureCross.fadeInTheCross();
    qrSubtitleSmartText.setMessagesData(SharedLists.emptyList);
    smartText.setMessagesData(SessionStartersList.hasDoneInstructions);
    beachWaves.setMovieMode(BeachWaveMovieModes.invertedOnShore);
    beachWaves.currentStore.initMovie(WaterDirection.down);
    smartText.startRotatingText();
    initReactors();
  }

  @action
  onQrCodeReceived(String qrCodeData) {
    qrCode.setQrCodeData(qrCodeData);
    qrCode.setWidgetVisibility(true);
  }

  adjustToHorizontalInstructionPadding() {
    setSmartTextBottomPaddingScalar(0);
    setSmartTextTopPaddingScalar(0.15);
  }

  @action
  onPreferredPresetReceived({
    required String sessionName,
    required List tags,
  }) {
    qrSubtitleSmartText
        .setMessagesData(SessionStartersList.getQrCodeSubtitle(sessionName));
    qrSubtitleSmartText.startRotatingText();
    presetIcons.setTags(tags: tags);
  }

  @action
  initExtraNavCleanUp() {
    smartText.setWidgetVisibility(false);
    qrSubtitleSmartText.setWidgetVisibility(false);
    presetIcons.setWidgetVisibility(false);
    sessionJoinerInstructionalNokhte.setWidgetVisibility(false);
    homeInstructionalNokhte.setWidgetVisibility(false);
    centerInstructionalNokhte.setWidgetVisibility(false);
    qrCode.setWidgetVisibility(false);
  }

  @observable
  GestureCrossConfiguration gestureCrossConfig = GestureCrossConfiguration();

  @action
  onUserInfoReceived(bool hasAssessedQrCodeScanner) {
    Either<StrokeConfig, NokhteGradientConfig> homeConfig = Right(
      NokhteGradientConfig(
        gradientType: NokhteGradientTypes.home,
      ),
    );
    Either<StrokeConfig, NokhteGradientConfig> presetsConfig = Right(
      NokhteGradientConfig(
        gradientType: NokhteGradientTypes.presets,
      ),
    );
    if (hasAssessedQrCodeScanner) {
      gestureCrossConfig = GestureCrossConfiguration(
        bottom: homeConfig,
        left: presetsConfig,
        right: Right(
          NokhteGradientConfig(
            gradientType: NokhteGradientTypes.sessionJoiner,
          ),
        ),
      );
    } else {
      gestureCrossConfig = GestureCrossConfiguration(
        left: presetsConfig,
        bottom: homeConfig,
      );
    }
    gestureCross.fadeIn();
  }

  @action
  onSwipeDown(Function onLeaving) async {
    if (isAllowedToMakeGesture()) {
      if (hasInitiatedBlur && !hasSwiped()) {
        smartText.setCurrentIndex(0);
        initToBottomInstructionalNokhte();
        setSmartTextPadding(
          excludeTimer: true,
          bottomPadding: .1,
          topPadding: 0,
        );
        presetsInstructionalNokhte.setWidgetVisibility(false);
        sessionJoinerInstructionalNokhte.setWidgetVisibility(false);
      } else {
        if (!hasSwiped()) {
          initExtraNavCleanUp();
          initExitSessionStarter();
          await onLeaving();
        }
      }
    }
  }

  @action
  onSwipeRight(Function onLeaving) async {
    if (isAllowedToMakeGesture() && !hasSwiped()) {
      if (hasInitiatedBlur) {
        adjustToHorizontalInstructionPadding();
        smartText.setCurrentIndex(2);
        homeInstructionalNokhte.setWidgetVisibility(false);
        sessionJoinerInstructionalNokhte.setWidgetVisibility(false);
        initToLeftInstructionalNokhte();
        setSmartTextPadding(
          excludeTimer: true,
          topPadding: .27,
          bottomPadding: 0,
          subMessagePadding: 110,
        );
      } else {
        initEnterPresets();
        initExtraNavCleanUp();
        await onLeaving();
      }
    }
  }

  @action
  onSwipeLeft(Function onLeaving) async {
    if (isAllowedToMakeGesture()) {
      if (hasInitiatedBlur && !hasSwiped()) {
        adjustToHorizontalInstructionPadding();
        smartText.setCurrentIndex(4);
        homeInstructionalNokhte.setWidgetVisibility(false);
        presetsInstructionalNokhte.setWidgetVisibility(false);
        initToRightInstructionalNokhte();
        setSmartTextPadding(
          excludeTimer: true,
          topPadding: .27,
          bottomPadding: 0,
          subMessagePadding: 110,
        );
      } else {
        if (!hasSwiped()) {
          initExtraNavCleanUp();
          initEnterSessionJoiner();
          await onLeaving();
        }
      }
    }
  }

  initReactors() {
    disposers.add(beachWavesMovieStatusReactor());
    disposers.add(centerInstructionalNokhteReactor());
    disposers.add(qrSubtitleTextReactor());
    disposers.add(centerCrossNokhteReactor());
    disposers.add(gestureCrossTapReactor());
  }

  centerInstructionalNokhteReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            centerInstructionalNokhte.movieMode ==
                CenterInstructionalNokhteMovieModes.moveBack) {
          gestureCross.centerCrossNokhte.setWidgetVisibility(true);
          gestureCross.gradientNokhte.setWidgetVisibility(true);
          setSmartTextTopPaddingScalar(.27);
          setSmartTextBottomPaddingScalar(0);
          setSmartTextSubMessagePaddingScalar(110);
          smartText.startRotatingText();
          // print('did we not run here???');
          qrSubtitleSmartText.reset();
          qrSubtitleSmartText.startRotatingText();
          qrSubtitleSmartText.setWidgetVisibility(true);
          qrCode.setWidgetVisibility(true);
          setSwipeDirection(GestureDirections.initial);
          setTouchIsDisabled(false);
        }
      });

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
          homeInstructionalNokhte.setWidgetVisibility(false);
          presetsInstructionalNokhte.setWidgetVisibility(false);
        }
      });

  qrSubtitleTextReactor() => reaction(
        (p0) => qrSubtitleSmartText.currentIndex,
        (p0) {
          if (beachWaves.movieMode == BeachWaveMovieModes.invertedOnShore) {
            if (p0 == 0) {
              qrSubtitleSmartText.startRotatingText(isResuming: true);
            } else if (p0 == 2) {
              if (qrSubtitleSmartText.showWidget) {
                presetIcons.setWidgetVisibility(true);
                Timer(Seconds.get(3, milli: 300), () {
                  presetIcons.setWidgetVisibility(false);
                });
              }
            } else if (p0 == 3) {
              qrSubtitleSmartText.setCurrentIndex(0);
              qrSubtitleSmartText.startRotatingText(isResuming: true);
            }
          }
        },
      );

  @action
  initTransition() {
    isEnteringNokhteSession = true;
    setSwipeDirection(GestureDirections.up);
    beachWaves
        .setMovieMode(BeachWaveMovieModes.invertedOnShoreToInvertedDeepSea);
    beachWaves.currentStore.initMovie(beachWaves.currentAnimationValues.first);
    smartText.setWidgetVisibility(false);
    qrSubtitleSmartText.setWidgetVisibility(false);
    presetIcons.setWidgetVisibility(false);
    gestureCross.fadeAllOut();
    presetIcons.setWidgetVisibility(false);
    centerInstructionalNokhte.setWidgetVisibility(false);
    homeInstructionalNokhte.setWidgetVisibility(false);
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @action
  dismissInstructionalNokhte() {
    setSwipeDirection(GestureDirections.initial);
    qrCode.setWidgetVisibility(false);
    centerInstructionalNokhte.moveBackToCross(
      startingPosition: CenterNokhtePositions.center,
    );
    gestureCross.gradientNokhte.setWidgetVisibility(false);
    gestureCross.strokeCrossNokhte.setWidgetVisibility(true);
    moveOtherInstructionalNokhtes(shouldExpand: false);
    nokhteBlur.reverse();
    beachWaves.currentStore.setControl(Control.mirror);
    setHasInitiatedBlur(false);
    smartText.reset();
    smartText.startRotatingText();
    delayedEnableTouchFeedback();
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (!hasInitiatedBlur && !hasSwiped()) {
        setTouchIsDisabled(true);
        setSwipeDirection(GestureDirections.initial);
        setHasInitiatedBlur(true);
        nokhteBlur.init();
        beachWaves.currentStore.setControl(Control.stop);
        qrCode.setWidgetVisibility(false);
        gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        moveOtherInstructionalNokhtes(shouldExpand: true);
        gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        gestureCross.gradientNokhte.setWidgetVisibility(false);
        qrSubtitleSmartText.setWidgetVisibility(false);
        presetIcons.setWidgetVisibility(false);
        centerInstructionalNokhte.moveToCenter(center);
      } else if (hasInitiatedBlur) {
        dismissInstructionalNokhte();
      }
    }
  }

  @action
  onTap(Offset offset) {
    if (isAllowedToMakeGesture() && hasInitiatedBlur) {
      if (hasSwiped()) {
        setSwipeDirection(GestureDirections.initial);
        touchRipple.onTap(offset);
        nokhteBlur.reverse();
        setTouchIsDisabled(true);
        beachWaves.currentStore.setControl(Control.mirror);
        setHasInitiatedBlur(false);
        smartText.startRotatingText(isResuming: true);
        Timer(Seconds.get(1, milli: 500), () {
          if (smartText.currentIndex == 1) {
            centerInstructionalNokhte.moveBackToCross(
              startingPosition: CenterNokhtePositions.bottom,
            );
            moveOtherInstructionalNokhtes(shouldExpand: false);
          } else {
            centerInstructionalNokhte.moveBackToCross(
              startingPosition: CenterNokhtePositions.left,
            );
            moveOtherInstructionalNokhtes(shouldExpand: false);
          }
          smartText.reset();
        });
      } else {
        dismissInstructionalNokhte();
        setSwipeDirection(GestureDirections.initial);
        qrCode.setWidgetVisibility(false);
        centerInstructionalNokhte.moveBackToCross(
          startingPosition: CenterNokhtePositions.center,
        );
        gestureCross.gradientNokhte.setWidgetVisibility(false);
        gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        homeInstructionalNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.beachWave,
            direction: InstructionalGradientDirections.shrink,
            position: InstructionalNokhtePositions.bottom,
          ),
        );
        nokhteBlur.reverse();
        beachWaves.currentStore.setControl(Control.mirror);
        setHasInitiatedBlur(false);
        smartText.reset();
        smartText.startRotatingText();
        delayedEnableTouchFeedback();
      }
    }
  }

  moveOtherInstructionalNokhtes({required bool shouldExpand}) {
    final dir = shouldExpand
        ? InstructionalGradientDirections.enlarge
        : InstructionalGradientDirections.shrink;
    presetsInstructionalNokhte.setWidgetVisibility(true);
    homeInstructionalNokhte.setWidgetVisibility(true);
    if (gestureCrossConfig.right.isRight()) {
      sessionJoinerInstructionalNokhte.setWidgetVisibility(true);
      sessionJoinerInstructionalNokhte.initMovie(
        InstructionalGradientMovieParams(
          center: center,
          colorway: GradientNokhteColorways.orangeSand,
          direction: dir,
          position: InstructionalNokhtePositions.right,
        ),
      );
    }
    presetsInstructionalNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.deeperBlue,
        direction: dir,
        position: InstructionalNokhtePositions.left,
      ),
    );
    homeInstructionalNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.beachWave,
        direction: dir,
        position: InstructionalNokhtePositions.bottom,
      ),
    );
  }
}
