// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:simple_animations/simple_animations.dart';
part 'presets_widgets_coordinator.g.dart';

class PresetsWidgetsCoordinator = _PresetsWidgetsCoordinatorBase
    with _$PresetsWidgetsCoordinator;

abstract class _PresetsWidgetsCoordinatorBase extends BaseWidgetsCoordinator
    with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore smartText;
  final GestureCrossStore gestureCross;
  final SmartTextStore headerText;
  final TouchRippleStore touchRipple;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final InstructionalGradientNokhteStore sessionStarterInstructionalNokhte;
  final NokhteBlurStore nokhteBlur;
  final PresetCardsStore presetCards;
  final CondensedPresetCardsStore condensedPresetCards;

  _PresetsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.touchRipple,
    required this.gestureCross,
    required this.headerText,
    required this.smartText,
    required this.presetCards,
    required super.wifiDisconnectOverlay,
    required this.centerInstructionalNokhte,
    required this.sessionStarterInstructionalNokhte,
    required this.nokhteBlur,
  }) : condensedPresetCards = presetCards.condensed {
    setSmartTextTopPaddingScalar(.27);
    setSmartTextBottomPaddingScalar(0);
    setSmartTextSubMessagePaddingScalar(110);
  }

  @observable
  bool hasInitializedBlur = false;

  @observable
  bool hasSwiped = false;

  @observable
  int fadeInCount = 0;

  @observable
  bool canHoldOnPresetCard = false;

  @observable
  bool canTapOnPresetCard = false;

  @observable
  bool instructionalNokhteAreVisible = false;

  // so we need a way to know what their
  // preferred is and pass it into here

  @action
  constructor(Offset centerParam) {
    center = centerParam;
    beachWaves.setMovieMode(BeachWaveMovieModes.staticInvertedDeeperBlue);
    gestureCross.fadeIn();
    gestureCross.cross.initStaticGlow();
    headerText.setMessagesData(PresetsLists.presetsHeader);
    headerText.startRotatingText();
    smartText.setMessagesData(PresetsLists.presetsScreen);
    smartText.startRotatingText();
    initReactors();
  }

  initReactors() {
    disposers.add(beachWavesMovieStatusReactor());
    disposers.add(centerInstructionalNokhteReactor());
    disposers.add(centerCrossNokhteReactor());
    disposers.add(gestureCrossTapReactor());
    disposers.add(transitionsCondensedPresetCardMovieStatusReactor());
    disposers.add(condensedPresetCardHoldReactor());
    disposers.add(condensedPresetCardTapReactor());
  }

  @action
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
    presetCards.showAllCondensedPresets(
      showTags: false,
    );
  }

  @action
  onPreferredPresetReceived(String unifiedUID) {
    presetCards.setPreferredPresetUID(unifiedUID);
  }

  @action
  onSwipeRight() {
    if (!isDisconnected &&
        centerInstructionalNokhte.movieStatus != MovieStatus.inProgress) {
      if (instructionalNokhteAreVisible) {
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.right);
        smartText.setCurrentIndex(1);
        smartText.startRotatingText(isResuming: true);
      } else {
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
      hasSwiped = true;
    }
  }

  condensedPresetCardTapReactor() =>
      reaction((p0) => presetCards.currentExpandedPresetCardName, (p0) {
        if (p0.isNotEmpty) {
          presetCards.onChosenNameChanged();
        }
      });

  transitionsCondensedPresetCardMovieStatusReactor() =>
      reaction((p0) => condensedPresetCards.movieStatuses.first, (p0) {
        if (p0 == MovieStatus.finished) {
          if (condensedPresetCards.movieModes.first ==
              CondensedPresetCardMovieModes.fadeIn) {
            if (fadeInCount == 0) {
              condensedPresetCards.setCurrentHeldIndex(
                presetCards.preferredPresetIndex,
                override: true,
              );
              fadeInCount++;
            }
          } else if (condensedPresetCards.movieModes.first ==
              CondensedPresetCardMovieModes.instructionHighlightTransition) {
            //
          }
        }
      });

  @observable
  bool firstCardIsSelected = false;

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
    if (hasSwiped) {
      centerInstructionalNokhte.moveBackToCross(
        startingPosition: CenterNokhtePositions.right,
      );
      sessionStarterInstructionalNokhte.initMovie(
        InstructionalGradientMovieParams(
          center: center,
          colorway: GradientNokhteColorways.invertedBeachWave,
          direction: InstructionalGradientDirections.shrink,
          position: InstructionalNokhtePositions.right,
        ),
      );
      smartText.startRotatingText(isResuming: true);
    } else {
      centerInstructionalNokhte.moveBackToCross(
        startingPosition: CenterNokhtePositions.center,
      );
      sessionStarterInstructionalNokhte.initMovie(
        InstructionalGradientMovieParams(
          center: center,
          colorway: GradientNokhteColorways.invertedBeachWave,
          direction: InstructionalGradientDirections.shrink,
          position: InstructionalNokhtePositions.right,
        ),
      );
    }
    gestureCross.gradientNokhte.setWidgetVisibility(false);
    gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
    nokhteBlur.reverse();
    instructionalNokhteAreVisible = false;
  }

  @action
  onGestureCrossTap() {
    if (!isDisconnected && readyToInteract) {
      if (!instructionalNokhteAreVisible) {
        setTouchIsDisabled(true);
        nokhteBlur.init();
        beachWaves.currentStore.setControl(Control.stop);
        instructionalNokhteAreVisible = true;
        sessionStarterInstructionalNokhte.setWidgetVisibility(true);
        sessionStarterInstructionalNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.invertedBeachWave,
            direction: InstructionalGradientDirections.enlarge,
            position: InstructionalNokhtePositions.right,
          ),
        );
        gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        gestureCross.gradientNokhte.setWidgetVisibility(false);
        centerInstructionalNokhte.moveToCenter(center);
      } else if (instructionalNokhteAreVisible) {
        dismissInstructionalNokhte();
      }
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
  dismissExpandedPresetCard() {
    if (presetCards.activePresetType == ActivePresetType.expanded) {
      presetCards.dismissExpandedPresetCard();
      canHoldOnPresetCard = true;
    }
  }

  centerInstructionalNokhteReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            centerInstructionalNokhte.movieMode ==
                CenterInstructionalNokhteMovieModes.moveBack &&
            !instructionalNokhteAreVisible) {
          gestureCross.centerCrossNokhte.setWidgetVisibility(true);
          gestureCross.gradientNokhte.setWidgetVisibility(true);
          setSmartTextTopPaddingScalar(.27);
          setSmartTextBottomPaddingScalar(0);
          setSmartTextSubMessagePaddingScalar(110);
          smartText.startRotatingText();
          hasSwiped = false;
          setTouchIsDisabled(false);
        }
      });

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        }
      });

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate(SessionStarterConstants.sessionStarter);
          //
        }
      });

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @computed
  bool get readyToInteract =>
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
