// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
part 'presets_instructions_widgets_coordinator.g.dart';

class PresetsInstructionsWidgetsCoordinator = _PresetsInstructionsWidgetsCoordinatorBase
    with _$PresetsInstructionsWidgetsCoordinator;

abstract class _PresetsInstructionsWidgetsCoordinatorBase
    with Store, SmartTextPaddingAdjuster {
  final BaseWidgetsCoordinator base;
  final BeachWavesStore beachWaves;
  final SmartTextStore headerText;
  final SmartTextStore smartText;
  final GestureCrossStore gestureCross;
  final PresetCardsStore presetCards;
  final CondensedPresetCardsStore condensedPresetCards;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final InstructionalGradientNokhteStore sessionStarterInstructionalNokhte;
  final NokhteBlurStore blur;

  _PresetsInstructionsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.headerText,
    required this.gestureCross,
    required this.centerInstructionalNokhte,
    required this.sessionStarterInstructionalNokhte,
    required this.smartText,
    required this.presetCards,
    required this.blur,
    required WifiDisconnectOverlayStore wifiDisconnectOverlay,
  })  : condensedPresetCards = presetCards.condensed,
        base = BaseWidgetsCoordinator(
            wifiDisconnectOverlay: wifiDisconnectOverlay) {
    initSmartTextActions();
    setSmartTextTopPaddingScalar(0);

    setSmartTextBottomPaddingScalar(.1);
    setSmartTextSubMessagePaddingScalar(110);
  }

  @action
  constructor(Offset centerParam) {
    base.center = centerParam;
    beachWaves.setMovieMode(BeachWaveMovieModes.staticInvertedDeeperBlue);
    centerInstructionalNokhte.setWidgetVisibility(false);
    sessionStarterInstructionalNokhte.setWidgetVisibility(false);
    gestureCross.fadeIn();
    gestureCross.cross.initStaticGlow();
    smartText.setMessagesData(PresetsLists.presetsInstructions);
    headerText.setMessagesData(PresetsLists.presetsHeader);
    headerText.startRotatingText();
    initReactors();
  }

  onCompanyPresetsReceived({
    required ObservableList unifiedUIDs,
    required ObservableList tags,
    required ObservableList names,
  }) {
    presetCards.setPresets(
      unifiedUIDs: unifiedUIDs,
      tags: tags,
      names: names,
    );
    presetCards.showAllCondensedPresets(showTags: false);
  }

  @observable
  bool canHoldOnPresetCard = false;

  @observable
  bool canTapOnPresetCard = false;

  @observable
  bool isAllowedToTapOnCross = false;

  @observable
  bool hasSwiped = false;

  @observable
  int fadeInCount = 0;

  @observable
  bool instructionalNokhteAreVisible = false;

  @observable
  bool isAllowedToExit = false;

  initReactors() {
    base.disposers.add(beachWavesMovieStatusReactor());
    base.disposers.add(gestureCrossTapReactor());
    base.disposers.add(centerCrossNokhteReactor());
    base.disposers.add(condensedPresetCardTapReactor());
    base.disposers.add(condensedPresetCardHoldReactor());
    base.disposers.add(transitionsCondensedPresetCardMovieStatusReactor());
  }

  @observable
  bool hasAlreadyDismissed = false;

  @action
  dismissExpandedPresetCard() {
    if (presetCards.activePresetType == ActivePresetType.expanded) {
      hasAlreadyDismissed = true;
      presetCards.dismissExpandedPresetCard(resetIndex: 0);
      smartText.startRotatingText(isResuming: true);
      canHoldOnPresetCard = true;
    }
  }

  @action
  onTap() {
    if (readyToInteract) {
      if (instructionalNokhteAreVisible && hasSwiped) {
        dismissInstructionalNokhte();
      } else {
        dismissExpandedPresetCard();
      }
    }
  }

  @action
  dismissInstructionalNokhte() {
    if (instructionalNokhteAreVisible && hasSwiped) {
      smartText.startRotatingText(isResuming: true);
      isAllowedToExit = true;
      hasSwiped = false;
      instructionalNokhteAreVisible = false;
      centerInstructionalNokhte.moveBackToCross(
        startingPosition: CenterNokhtePositions.right,
      );
      sessionStarterInstructionalNokhte.initMovie(
        InstructionalGradientMovieParams(
          center: base.center,
          colorway: GradientNokhteColorways.invertedBeachWave,
          direction: InstructionalGradientDirections.shrink,
          position: InstructionalNokhtePositions.right,
        ),
      );
      // condensedPresetCards.showEverythingExcept(0);
      blur.reverse();
    }
  }

  condensedPresetCardHoldReactor() =>
      reaction((p0) => condensedPresetCards.currentHeldIndex, (p0) {
        presetCards.selectPreset(p0);
      });

  condensedPresetCardTapReactor() =>
      reaction((p0) => presetCards.currentExpandedPresetCardName, (p0) {
        if (p0.isNotEmpty) {
          presetCards.onChosenNameChanged();
          smartText.startRotatingText(isResuming: true);
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
            smartText.startRotatingText(isResuming: true);
            condensedPresetCards.initSelectionMovie(currentHeldIndex);
            condensedPresetCards.disableAllTouchFeedback();
            Timer(Seconds.get(2), () {
              isAllowedToTapOnCross = true;
              smartText.startRotatingText(isResuming: true);
              blur.init();
            });
            await onSelected(presetCards.currentlySelectedSessionUID);
          }
        }
      });

  transitionsCondensedPresetCardMovieStatusReactor() =>
      reaction((p0) => condensedPresetCards.movieStatuses.first, (p0) {
        if (p0 == MovieStatus.finished) {
          if (condensedPresetCards.movieModes.first ==
              CondensedPresetCardMovieModes.fadeIn) {
            if (fadeInCount == 0) {
              condensedPresetCards.teeUpInstructions(0);
              fadeInCount++;
            }
          } else if (condensedPresetCards.movieModes.first ==
              CondensedPresetCardMovieModes.instructionHighlightTransition) {
            condensedPresetCards.initHighlightMovie(0);
            smartText.startRotatingText();
            canTapOnPresetCard = true;
          }
        }
      });

  @action
  onGestureCrossTap() {
    if (!base.isDisconnected && readyToInteract) {
      if (isAllowedToTapOnCross) {
        isAllowedToTapOnCross = false;
        centerInstructionalNokhte.setWidgetVisibility(true);
        sessionStarterInstructionalNokhte.setWidgetVisibility(true);
        sessionStarterInstructionalNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: base.center,
            colorway: GradientNokhteColorways.invertedBeachWave,
            direction: InstructionalGradientDirections.enlarge,
            position: InstructionalNokhtePositions.right,
          ),
        );
        gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        gestureCross.gradientNokhte.setWidgetVisibility(false);
        smartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveToCenter(base.center);
        Timer(Seconds.get(1, milli: 500), () {
          setSmartTextTopPaddingScalar(.24);
          instructionalNokhteAreVisible = true;
        });
        // setSmartTextPadding(bottomPadding: .14);
      }
    }
  }

  @action
  onSwipeRight() {
    if (!base.isDisconnected &&
        centerInstructionalNokhte.movieStatus != MovieStatus.inProgress) {
      if (instructionalNokhteAreVisible) {
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.right);
        hasSwiped = true;
        smartText.startRotatingText(isResuming: true);
        // setSmartTextPadding(topPadding: 0);
      } else if (isAllowedToExit) {
        headerText.setWidgetVisibility(false);
        gestureCross.centerCrossNokhte.setWidgetVisibility(true);
        gestureCross.gradientNokhte.setWidgetVisibility(true);
        centerInstructionalNokhte.setWidgetVisibility(false);
        sessionStarterInstructionalNokhte.setWidgetVisibility(false);
        gestureCross.cross.initOutlineFadeOut();
        gestureCross.initMoveAndRegenerate(CircleOffsets.right);
        beachWaves.setMovieMode(
          BeachWaveMovieModes.invertedOnShoreToInvertedDeeperBlue,
        );
        beachWaves.currentStore.reverseMovie(-10.0);
        condensedPresetCards.setWidgetVisibility(false);
      }
    }
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate(SessionStarterConstants.sessionStarter);
        }
      });

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        }
      });

  @computed
  bool get readyToInteract =>
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
