// ignore_for_file: must_be_immutable, library_private_types_in_public_api
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
  final PresetsCardsStore presetsCards;
  final NokhteBlurStore nokhteBlur;

  _PresetsInstructionsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.gestureCross,
    required this.smartText,
    required this.presetsCards,
    required super.wifiDisconnectOverlay,
    required this.nokhteBlur,
  }) {
    setSmartTextTopPaddingScalar(.27);
    setSmartTextBottomPaddingScalar(0);
    setSmartTextSubMessagePaddingScalar(110);
  }

  @action
  constructor(Offset centerParam) {
    center = centerParam;
    beachWaves.setMovieMode(BeachWaveMovieModes.staticInvertedDeeperBlue);
    gestureCross.fadeIn();
    gestureCross.cross.initStaticGlow();
    smartText.setMessagesData(SharedLists.empty);
    initReactors();
  }

  onCompanyPresetsReceived({
    required ObservableList unifiedUIDs,
    required ObservableList tags,
    required ObservableList names,
  }) {
    presetsCards.setPresets(
      unifiedUIDs: unifiedUIDs,
      tags: tags,
      names: names,
    );
  }

  initReactors() {
    disposers.add(centerCrossNokhteReactor());
  }

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        }
      });
}
