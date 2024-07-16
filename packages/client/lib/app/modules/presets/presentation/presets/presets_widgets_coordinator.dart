// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/modules/presets/presets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'presets_widgets_coordinator.g.dart';

class PresetsWidgetsCoordinator = _PresetsWidgetsCoordinatorBase
    with _$PresetsWidgetsCoordinator;

abstract class _PresetsWidgetsCoordinatorBase
    with
        Store,
        BaseWidgetsCoordinator,
        Reactions,
        SwipeNavigationUtils,
        InstructionalNokhteWidgetUtils,
        InstructionWidgetsUtils,
        SmartTextPaddingAdjuster,
        SingleInstructionalNokhteWidgetUtils,
        PresetWidgetsUtils {
  @override
  final BeachWavesStore beachWaves;
  @override
  final SmartTextStore smartText;
  @override
  final GestureCrossStore gestureCross;
  @override
  final SmartTextStore headerText;
  @override
  final TouchRippleStore touchRipple;
  @override
  final CenterInstructionalNokhteStore centerInstructionalNokhte;

  final InstructionalGradientNokhteStore sessionStarterInstructionalNokhte;
  @override
  InstructionalGradientNokhteStore? focusInstructionalNokhte;
  @override
  final NokhteBlurStore nokhteBlur;
  @override
  final PresetCardsStore presetCards;
  @override
  final CondensedPresetCardsStore condensedPresetCards;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _PresetsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.touchRipple,
    required this.gestureCross,
    required this.headerText,
    required this.smartText,
    required this.presetCards,
    required this.wifiDisconnectOverlay,
    required this.centerInstructionalNokhte,
    required this.sessionStarterInstructionalNokhte,
    required this.nokhteBlur,
  }) : condensedPresetCards = presetCards.condensed {
    initBaseWidgetsCoordinatorActions();
    initInstructionWidgetsUtils();
    initSmartTextActions();
    initPresetWidgetsUtils();
    initSwipeNavigationUtils();
    setSmartTextSubMessagePaddingScalar(110);
  }

  @observable
  bool firstCardIsSelected = false;

  @action
  constructor(Offset center) {
    initInstructionalNokhteUtils(center);
    beachWaves
        .setMovieMode(BeachWaveMovieModes.invertedOnShoreToInvertedDeeperBlue);
    beachWaves.currentStore.initStaticEnd();
    gestureCross.fadeIn();
    gestureCross.cross.initStaticGlow();
    headerText.setMessagesData(PresetsLists.presetsHeader);
    headerText.startRotatingText();
    smartText.setMessagesData(PresetsLists.presetsScreen);
    smartText.startRotatingText();
    initReactors();
  }

  initReactors() {
    disposers.add(centerInstructionalNokhteReactor());
    disposers.add(centerCrossNokhteReactor());
    disposers.add(gestureCrossTapReactor());
    disposers.add(transitionsCondensedPresetCardMovieStatusReactor());
    disposers.add(condensedPresetCardHoldReactor());
    disposers.add(condensedPresetCardTapReactor());
  }

  @action
  onPreferredPresetReceived(String unifiedUID) {
    presetCards.setPreferredPresetUID(unifiedUID);
  }

  @action
  onSwipeLeft() {
    if (!isDisconnected &&
        centerInstructionalNokhte.movieStatus != MovieStatus.inProgress) {
      if (hasInitiatedBlur) {
        smartText.setCurrentIndex(1);
        initToRightInstructionalNokhte();
      } else {
        centerInstructionalNokhte.setWidgetVisibility(false);
        sessionStarterInstructionalNokhte.setWidgetVisibility(false);
        onExit();
      }
    }
  }

  condensedPresetCardTapReactor() =>
      reaction((p0) => presetCards.condensedTapCount, (p0) {
        if (presetCards.currentExpandedPresetCardName.isNotEmpty) {
          presetCards.onChosenNameChanged();
        }
      });

  transitionsCondensedPresetCardMovieStatusReactor() =>
      reaction((p0) => condensedPresetCards.movieStatuses.first, (p0) {
        if (p0 == MovieStatus.finished) {
          if (condensedPresetCards.movieModes.first ==
              CondensedPresetCardMovieModes.fadeIn) {
            if (!cardsHaveFadedIn) {
              condensedPresetCards.setCurrentHeldIndex(
                presetCards.preferredPresetIndex,
                override: true,
              );
              setCardsHaveFadedIn(true);
            }
          }
        }
      });

  selectionCondensedPresetCardMovieStatusReactor(
          Function(String param) onSelected) =>
      reaction((p0) => condensedPresetCards.movieStatuses.toString(),
          (p0) async {
        if (condensedPresetCards.currentHeldIndex != -1) {
          final currentHeldIndex = condensedPresetCards.currentHeldIndex;
          if (condensedPresetCards.movieModes[currentHeldIndex] ==
                  CondensedPresetCardMovieModes.selectionInProgress &&
              condensedPresetCards.movieStatuses[currentHeldIndex] ==
                  MovieStatus.finished) {
            if (firstCardIsSelected) {
              onSwipeLeft();
            }
            Timer(Seconds.get(firstCardIsSelected ? 0 : 1), () {
              condensedPresetCards.initSelectionMovie(currentHeldIndex);
              firstCardIsSelected = true;
            });
            condensedPresetCards.enableAllTouchFeedback();
            await onSelected(presetCards.currentlySelectedSessionUID);
          }
        }
      });

  condensedPresetCardHoldReactor() =>
      reaction((p0) => condensedPresetCards.currentHeldIndex, (p0) {
        if (condensedPresetCards.pastHeldIndex != -1) {
          condensedPresetCards.initWindDown(condensedPresetCards.pastHeldIndex);
        }
        presetCards.selectPreset(p0);
      });

  @action
  dismissInstructionalNokhte() {
    if (hasSwiped()) {
      centerInstructionalNokhte.moveBackToCross(
        startingPosition: CenterNokhtePositions.right,
      );
      smartText.startRotatingText(isResuming: true);
    } else {
      centerInstructionalNokhte.moveBackToCross(
        startingPosition: CenterNokhtePositions.center,
      );
    }
    setSwipeDirection(GestureDirections.initial);
    moveSessionStarterInstructionalNokhte(shouldExpand: false);
    gestureCross.gradientNokhte.setWidgetVisibility(false);
    gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
    nokhteBlur.reverse();
    setHasInitiatedBlur(false);
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (!hasInitiatedBlur) {
        nokhteBlur.init();
        beachWaves.currentStore.setControl(Control.stop);
        moveSessionStarterInstructionalNokhte(shouldExpand: true);
        gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        gestureCross.gradientNokhte.setWidgetVisibility(false);
        centerInstructionalNokhte.moveToCenter(center);
        setHasInitiatedBlur(true);
      } else if (hasInitiatedBlur && !hasSwiped()) {
        dismissInstructionalNokhte();
      }
    }
  }

  @action
  onTap() {
    if (isAllowedToMakeGesture()) {
      if (hasInitiatedBlur) {
        dismissInstructionalNokhte();
      } else {
        dismissExpandedPresetCard();
      }
    }
  }

  @action
  dismissExpandedPresetCard() {
    if (presetCards.activePresetType == ActivePresetType.expanded) {
      presetCards.dismissExpandedPresetCard();
      setCanHoldOnPresetCard(true);
    }
  }

  centerInstructionalNokhteReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            centerInstructionalNokhte.movieMode ==
                CenterInstructionalNokhteMovieModes.moveBack &&
            !hasInitiatedBlur) {
          gestureCross.centerCrossNokhte.setWidgetVisibility(true);
          gestureCross.gradientNokhte.setWidgetVisibility(true);
          setSmartTextTopPaddingScalar(.27);
          setSmartTextBottomPaddingScalar(0);
          setSmartTextSubMessagePaddingScalar(110);
          smartText.startRotatingText();
          setSwipeDirection(GestureDirections.initial);
          setTouchIsDisabled(false);
        }
      });

  moveSessionStarterInstructionalNokhte({required bool shouldExpand}) {
    sessionStarterInstructionalNokhte.setWidgetVisibility(true);
    sessionStarterInstructionalNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.invertedBeachWave,
        direction: shouldExpand
            ? InstructionalGradientDirections.enlarge
            : InstructionalGradientDirections.shrink,
        position: InstructionalNokhtePositions.right,
      ),
    );
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );
}
