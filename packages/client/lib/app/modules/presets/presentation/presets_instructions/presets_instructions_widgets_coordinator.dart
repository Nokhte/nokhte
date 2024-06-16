// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'presets_instructions_widgets_coordinator.g.dart';

class PresetsInstructionsWidgetsCoordinator = _PresetsInstructionsWidgetsCoordinatorBase
    with _$PresetsInstructionsWidgetsCoordinator;

abstract class _PresetsInstructionsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore smartText;
  final GestureCrossStore gestureCross;
  final PresetCardsStore presetCards;
  final CondensedPresetCardsStore condensedPresetCards;
  final NokhteBlurStore blur;

  _PresetsInstructionsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.gestureCross,
    required this.smartText,
    required this.presetCards,
    required this.blur,
    required super.wifiDisconnectOverlay,
  }) : condensedPresetCards = presetCards.condensed {
    setSmartTextTopPaddingScalar(0);
    setSmartTextBottomPaddingScalar(.1);
    setSmartTextSubMessagePaddingScalar(110);
  }

  @action
  constructor(Offset centerParam) {
    center = centerParam;
    beachWaves.setMovieMode(BeachWaveMovieModes.staticInvertedDeeperBlue);
    gestureCross.fadeIn();
    gestureCross.cross.initStaticGlow();
    smartText.setMessagesData(PresetsLists.presetsInstructions);
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

  initReactors() {
    disposers.add(centerCrossNokhteReactor());
    disposers.add(condensedPresetCardTapReactor());
    disposers.add(condensedPresetCardHoldReactor());
    disposers.add(selectionCondensedPresetCardMovieStatusReactor());
    disposers.add(transitionsCondensedPresetCardMovieStatusReactor());
  }

  @action
  dismissExpandedPresetCard() {
    presetCards.dismissExpandedPresetCard(resetIndex: 0);
    smartText.startRotatingText(isResuming: true);
    canHoldOnPresetCard = true;
  }

  condensedPresetCardHoldReactor() =>
      reaction((p0) => condensedPresetCards.lastHeldIndex, (p0) {
        presetCards.selectPreset(p0);
      });

  condensedPresetCardTapReactor() =>
      reaction((p0) => presetCards.chosenName, (p0) {
        if (p0.isNotEmpty) {
          presetCards.onChosenNameChanged();
          smartText.startRotatingText(isResuming: true);
        }
      });

  selectionCondensedPresetCardMovieStatusReactor() =>
      reaction((p0) => condensedPresetCards.movieStatuses.toString(), (p0) {
        final lastHeldIndex = condensedPresetCards.lastHeldIndex;
        if (condensedPresetCards.movieModes[lastHeldIndex] ==
                CondensedPresetCardMovieModes.selectionInProgress &&
            condensedPresetCards.movieStatuses[lastHeldIndex] ==
                MovieStatus.finished) {
          smartText.startRotatingText(isResuming: true);
          condensedPresetCards.initSelectionMovie(lastHeldIndex);
          condensedPresetCards.disableAllTouchFeedback();
          Timer(Seconds.get(2), () {
            smartText.startRotatingText(isResuming: true);
            blur.init();
          });
        }
      });

  transitionsCondensedPresetCardMovieStatusReactor() =>
      reaction((p0) => condensedPresetCards.movieStatuses.first, (p0) {
        if (p0 == MovieStatus.finished) {
          if (condensedPresetCards.movieModes.first ==
              CondensedPresetCardMovieModes.fadeIn) {
            condensedPresetCards.teeUpInstructions(0);
          } else if (condensedPresetCards.movieModes.first ==
              CondensedPresetCardMovieModes.instructionHighlightTransition) {
            condensedPresetCards.initHighlightMovie(0);
            smartText.startRotatingText();
            canTapOnPresetCard = true;
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
}
