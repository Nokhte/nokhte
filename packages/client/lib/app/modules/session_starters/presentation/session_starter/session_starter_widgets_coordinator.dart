// ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_const_constructors
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/shared/mobx/mobx.dart';
import 'package:nokhte/app/modules/session/session.dart';
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
        Reactions,
        EnRoute,
        HomeNavigation {
  final SmartTextStore smartText;
  final SmartTextStore qrSubtitleSmartText;
  final PresetIconsStore presetIcons;
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  final NokhteBlurStore nokhteBlur;
  final NokhteQrCodeStore qrCode;
  @override
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  @override
  final InstructionalGradientNokhteStore homeInstructionalNokhte;
  @override
  final SwipeGuideStore swipeGuide;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionStarterWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.presetIcons,
    required this.swipeGuide,
    required this.gestureCross,
    required this.qrSubtitleSmartText,
    required this.smartText,
    required this.wifiDisconnectOverlay,
    required this.centerInstructionalNokhte,
    required this.homeInstructionalNokhte,
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
    qrCode.setWidgetVisibility(false);
    gestureCross.fadeInTheCross();
    // gestureCross.fadeIn();
    centerInstructionalNokhte.fadeIn();
    homeInstructionalNokhte.setAndFadeIn(
      InstructionalNokhtePositions.bottom,
      GradientNokhteColorways.beachWave,
    );
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
    // sessionJoinerInstructionalNokhte.setWidgetVisibility(false);
    homeInstructionalNokhte.setWidgetVisibility(false);
    centerInstructionalNokhte.setWidgetVisibility(false);
    qrCode.setWidgetVisibility(false);
  }

  @action
  onUserInfoReceived(bool hasAssessedQrCodeScanner) {
    // gestureCross.fadeIn();
  }

  @action
  onSwipeDown(Function onLeaving) async {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (hasInitiatedBlur && !hasSwiped()) {
        setSwipeDirection(GestureDirections.down);
        centerInstructionalNokhte
            .initMovie(InstructionalNokhtePositions.bottom);
        // homeInstructionalNokhte.disappear();
        swipeGuide.setWidgetVisibility(false);
        await onLeaving();
      }
    }
  }

  initReactors() {
    disposers.add(beachWavesReactor());
    disposers.add(qrSubtitleTextReactor());
    disposers.add(gestureCrossTapReactor());
    initHomeNavigationReactions();
  }

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
    // gestureCross.gradientNokhte.setWidgetVisibility(false);
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
    if (!isDisconnected &&
        isAllowedToMakeGesture() &&
        beachWaves.movieMode == BeachWaveMovieModes.invertedOnShore) {
      if (!hasInitiatedBlur && !hasSwiped()) {
        swipeGuide.fadeIn();
        setTouchIsDisabled(true);
        setSwipeDirection(GestureDirections.initial);
        setHasInitiatedBlur(true);
        nokhteBlur.init();
        beachWaves.currentStore.setControl(Control.stop);
        qrCode.setWidgetVisibility(false);
        gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        moveOtherInstructionalNokhtes(shouldExpand: true);
        // gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        // gestureCross.gradientNokhte.setWidgetVisibility(false);
        qrSubtitleSmartText.setWidgetVisibility(false);
        presetIcons.setWidgetVisibility(false);
        centerInstructionalNokhte.moveToCenter();
      } else if (hasInitiatedBlur && !hasSwiped()) {
        dismissInstructionalNokhte();
        swipeGuide.setWidgetVisibility(false);
      }
    }
  }

  @action
  onTap(Offset offset) {
    if (isAllowedToMakeGesture() && hasInitiatedBlur) {
      if (hasSwiped()) {
        setSwipeDirection(GestureDirections.initial);
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
        // gestureCross.gradientNokhte.setWidgetVisibility(false);
        gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        homeInstructionalNokhte.initMovie(
          InstructionalGradientDirections.shrink,
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
    homeInstructionalNokhte.initMovie(shouldExpand
        ? InstructionalGradientDirections.enlarge
        : InstructionalGradientDirections.shrink);
  }

  beachWavesReactor() => reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate(SessionConstants.lobby, arguments: {
            SessionStarterConstants.QR_CODE_DATA: qrCode.qrCodeData,
          });
        }
      });
}
