// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'package:nokhte/app/modules/session/widgets/widgets.dart';
part 'socratic_notes_symbols_widgets_coordinator.g.dart';

class SocraticNotesSymbolsWidgetsCoordinator = _SocraticNotesSymbolsWidgetsCoordinatorBase
    with _$SocraticNotesSymbolsWidgetsCoordinator;

abstract class _SocraticNotesSymbolsWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator, Reactions {
  final PresetDiagramStore presetDiagram;
  final BeachWavesStore beachWaves;
  final SmartTextStore smartText;
  final TouchRippleStore touchRipple;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  _SocraticNotesSymbolsWidgetsCoordinatorBase({
    required this.wifiDisconnectOverlay,
    required this.presetDiagram,
    required this.beachWaves,
    required this.smartText,
    required this.touchRipple,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @observable
  bool canTap = false;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToBorealis);
    smartText.setMessagesData(SessionLists.socraticNotesSymbols);
    smartText.setStaticAltMovie(SessionConstants.blue);
    presetDiagram.setIsASocraticSession(true);
    presetDiagram.setIsNotesSymbolsScreen(true);
    presetDiagram.initMovie(PresetDiagramMovieModes.appear);
    initReactors();
  }

  @action
  initReactors() {
    disposers.add(rippleCompletionStatusReactor());
    disposers.add(presetDiagramsMovieStatusReactor());
  }

  @action
  onTap(Offset tapPosition) {
    if (gestureIsAllowed) {
      canTap = false;
      touchRipple.onTap(tapPosition);
      presetDiagram.setWidgetVisibility(false);
      smartText.setWidgetVisibility(false);
      beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToSky);
      beachWaves.currentStore.initMovie(NoParams());
    }
  }

  presetDiagramsMovieStatusReactor() =>
      reaction((p0) => presetDiagram.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (presetDiagram.movieMode == PresetDiagramMovieModes.appear) {
            presetDiagram.initMovie(PresetDiagramMovieModes.showSecondCircle);
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.showSecondCircle) {
            presetDiagram.initMovie(PresetDiagramMovieModes.showBothLines);
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.showBothLines) {
            smartText.startRotatingText();
            canTap = true;
          }
        }
      });

  rippleCompletionStatusReactor() =>
      reaction((p0) => touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            beachWaves.movieMode != BeachWaveMovieModes.deepSeaToBorealis) {
          Modular.to.navigate(SessionConstants.socraticNotesInstructions);
        }
      });

  @computed
  bool get gestureIsAllowed =>
      presetDiagram.movieStatus != MovieStatus.inProgress && canTap;
}
