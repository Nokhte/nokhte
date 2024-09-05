import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';

mixin PresetWidgetsUtils on SwipeNavigationUtils {
  PresetCardsStore get presetCards;
  CondensedPresetCardsStore get condensedPresetCards;
  BeachWavesStore get beachWaves;
  SmartTextStore get headerText;
  GestureCrossStore get gestureCross;

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

  onExit() {
    if (!hasSwiped()) {
      headerText.setWidgetVisibility(false);
      // gestureCross.centerCrossNokhte.setWidgetVisibility(true);
      // gestureCross.gradientNokhte.setWidgetVisibility(true);
      gestureCross.cross.initOutlineFadeOut();
      gestureCross.initMoveAndRegenerate(CircleOffsets.right);
      beachWaves.setMovieMode(
        BeachWaveMovieModes.invertedOnShoreToInvertedDeeperBlue,
      );
      beachWaves.currentStore.reverseMovie(-10.0);
      condensedPresetCards.setWidgetVisibility(false);
      setSwipeDirection(GestureDirections.left);
    }
  }

  beachWavesMovieStatusReactor({
    required bool hasAccessedQrCodeScanner,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (hasAccessedQrCodeScanner) {
            Modular.to.navigate(SessionStarterConstants.sessionStarter);
          } else {
            Modular.to
                .navigate(SessionStarterConstants.sessionJoinerInstructions);
          }
        }
      });

  // centerCrossNokhteReactor() =>
  //     reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
  //       if (p0 == MovieStatus.finished) {
  //         gestureCross.gradientNokhte.setWidgetVisibility(false);
  //         gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
  //       }
  //     });

  final _canHoldOnPresetCard = Observable(false);
  final _cardsHaveFadedIn = Observable(false);
  final _canTapOnPresetCard = Observable(false);

  bool get canHoldOnPresetCard => _canHoldOnPresetCard.value;
  bool get cardsHaveFadedIn => _cardsHaveFadedIn.value;
  bool get canTapOnPresetCard => _canTapOnPresetCard.value;

  _setCanHoldOnPresetCard(bool value) => _canHoldOnPresetCard.value = value;

  _setCardsHaveFadedIn(bool value) => _cardsHaveFadedIn.value = value;

  _setCanTapOnPresetCard(bool value) => _canTapOnPresetCard.value = value;

  Action actionSetCanHoldOnPresetCard = Action(() {});
  Action actionSetCardsHaveFadedIn = Action(() {});
  Action actionCanTapOnPresetCard = Action(() {});

  initPresetWidgetsUtils() {
    actionSetCanHoldOnPresetCard = Action(_setCanHoldOnPresetCard);
    actionSetCardsHaveFadedIn = Action(_setCardsHaveFadedIn);
    actionCanTapOnPresetCard = Action(_setCanTapOnPresetCard);
  }

  setCardsHaveFadedIn(bool value) => actionSetCardsHaveFadedIn([value]);

  setCanTapOnPresetCard(bool value) => actionCanTapOnPresetCard([value]);

  setCanHoldOnPresetCard(bool value) => actionSetCanHoldOnPresetCard([value]);
}
