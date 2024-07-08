// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
part 'presets_instructions_widgets_coordinator.g.dart';

class PresetsInstructionsWidgetsCoordinator = _PresetsInstructionsWidgetsCoordinatorBase
    with _$PresetsInstructionsWidgetsCoordinator;

abstract class _PresetsInstructionsWidgetsCoordinatorBase
    with Store, SmartTextPaddingAdjuster, BaseWidgetsCoordinator, Reactions {
  final BeachWavesStore beachWaves;
  final SmartTextStore headerText;
  final SmartTextStore smartText;
  final GestureCrossStore gestureCross;
  final PresetCardsStore presetCards;
  final CondensedPresetCardsStore condensedPresetCards;
  final NokhteBlurStore blur;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _PresetsInstructionsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.headerText,
    required this.gestureCross,
    required this.smartText,
    required this.presetCards,
    required this.blur,
    required this.wifiDisconnectOverlay,
  }) : condensedPresetCards = presetCards.condensed {
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
    setSmartTextTopPaddingScalar(0);

    setSmartTextBottomPaddingScalar(.1);
    setSmartTextSubMessagePaddingScalar(110);
  }

  @action
  constructor(Offset centerParam) {
    setCenter(centerParam);
    beachWaves.setMovieMode(BeachWaveMovieModes.staticInvertedDeeperBlue);
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
  bool hasSwiped = false;

  @observable
  int fadeInCount = 0;

  @observable
  bool instructionalNokhteAreVisible = false;

  @observable
  bool isAllowedToExit = false;

  initReactors() {
    disposers.add(beachWavesMovieStatusReactor());
    disposers.add(centerCrossNokhteReactor());
    disposers.add(condensedPresetCardTapReactor());
    disposers.add(condensedPresetCardHoldReactor());
    disposers.add(transitionsCondensedPresetCardMovieStatusReactor());
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
    dismissExpandedPresetCard();
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
              onExit();
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
  onExit() {
    headerText.setWidgetVisibility(false);
    gestureCross.centerCrossNokhte.setWidgetVisibility(true);
    gestureCross.gradientNokhte.setWidgetVisibility(true);
    gestureCross.cross.initOutlineFadeOut();
    gestureCross.initMoveAndRegenerate(CircleOffsets.right);
    beachWaves.setMovieMode(
      BeachWaveMovieModes.invertedOnShoreToInvertedDeeperBlue,
    );
    beachWaves.currentStore.reverseMovie(-10.0);
    condensedPresetCards.setWidgetVisibility(false);
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate(SessionStarterConstants.sessionStarter);
        }
      });

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        }
      });
}
