// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
part 'collaboration_just_symbols_widgets_coordinator.g.dart';

class CollaborationJustSymbolsWidgetsCoordinator = _CollaborationJustSymbolsWidgetsCoordinatorBase
    with _$CollaborationJustSymbolsWidgetsCoordinator;

abstract class _CollaborationJustSymbolsWidgetsCoordinatorBase with Store {
  final PresetDiagramStore presetDiagram;
  final BeachWavesStore beachWaves;
  final SmartTextStore smartText;
  final TouchRippleStore touchRipple;
  final BaseWidgetsCoordinator base;
  _CollaborationJustSymbolsWidgetsCoordinatorBase({
    required WifiDisconnectOverlayStore wifiDisconnectOverlay,
    required this.presetDiagram,
    required this.beachWaves,
    required this.smartText,
    required this.touchRipple,
  }) : base = BaseWidgetsCoordinator(
            wifiDisconnectOverlay: wifiDisconnectOverlay);

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToBorealis);
    smartText.setMessagesData(SessionLists.collaborationJustSymbols);
    smartText.setStaticAltMovie(SessionConstants.blue);
    presetDiagram.initMovie(PresetDiagramMovieModes.appear);

    base.disposers.add(rippleCompletionStatusReactor());
    base.disposers.add(presetDiagramsMovieStatusReactor());
  }

  @observable
  bool isAllowedToTap = false;

  @action
  onTap(Offset tapPosition) {
    if (gestureIsAllowed) {
      touchRipple.onTap(tapPosition);
      isAllowedToTap = false;
      smartText.startRotatingText(isResuming: true);
      presetDiagram.setWidgetVisibility(false);
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
            presetDiagram.initMovie(PresetDiagramMovieModes.consolidateThePair);
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.consolidateThePair) {
            presetDiagram
                .initMovie(PresetDiagramMovieModes.whiteToHalfAndHalfCircle);
            isAllowedToTap = true;
            smartText.startRotatingText();
          }
        }
      });

  rippleCompletionStatusReactor() =>
      reaction((p0) => touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished && !isAllowedToTap) {
          // Modular.to.navigate(SessionConstants.speakingInstructions);
        }
      });

  @computed
  bool get gestureIsAllowed =>
      presetDiagram.movieStatus != MovieStatus.inProgress && isAllowedToTap;
}
