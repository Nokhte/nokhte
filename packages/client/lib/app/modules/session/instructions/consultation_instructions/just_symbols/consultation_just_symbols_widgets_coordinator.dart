// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'consultation_just_symbols_widgets_coordinator.g.dart';

class ConsultationJustSymbolsWidgetsCoordinator = _ConsultationJustSymbolsWidgetsCoordinatorBase
    with _$ConsultationJustSymbolsWidgetsCoordinator;

abstract class _ConsultationJustSymbolsWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator, Reactions {
  final PresetDiagramStore presetDiagram;
  final BeachWavesStore beachWaves;
  final SmartTextStore smartText;
  final TouchRippleStore touchRipple;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _ConsultationJustSymbolsWidgetsCoordinatorBase({
    required this.presetDiagram,
    required this.wifiDisconnectOverlay,
    required this.beachWaves,
    required this.smartText,
    required this.touchRipple,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToBorealis);
    smartText.setMessagesData(SessionLists.consultationJustSymbols);
    smartText.setStaticAltMovie(SessionConstants.blue);
    presetDiagram.initMovie(PresetDiagramMovieModes.appear);

    disposers.add(rippleCompletionStatusReactor());
    disposers.add(presetDiagramsMovieStatusReactor());
  }

  @observable
  bool isAllowedToTap = false;

  @action
  onTap(Offset tapPosition) {
    if (gestureIsAllowed) {
      touchRipple.onTap(tapPosition);
      if (smartText.currentIndex == 0) {
        presetDiagram.initMovie(PresetDiagramMovieModes.showRightLine);
        smartText.startRotatingText(isResuming: true);
      } else if (smartText.currentIndex == 1) {
        presetDiagram.initMovie(PresetDiagramMovieModes.consolidateThePair);
        smartText.startRotatingText(isResuming: true);
        isAllowedToTap = false;
      }
    }
  }

  presetDiagramsMovieStatusReactor() =>
      reaction((p0) => presetDiagram.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (presetDiagram.movieMode == PresetDiagramMovieModes.appear) {
            presetDiagram.initMovie(PresetDiagramMovieModes.showSecondCircle);
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.showSecondCircle) {
            presetDiagram.initMovie(PresetDiagramMovieModes.showLeftLine);
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.showLeftLine) {
            isAllowedToTap = true;
            smartText.startRotatingText();
          } else if (presetDiagram.movieMode ==
              PresetDiagramMovieModes.consolidateThePair) {
            presetDiagram.initMovie(PresetDiagramMovieModes.hideSingleCircle);
          }
        }
      });

  rippleCompletionStatusReactor() =>
      reaction((p0) => touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished && !isAllowedToTap) {
          Modular.to.navigate(SessionConstants.lobby, arguments: {});
        }
      });

  @computed
  bool get gestureIsAllowed =>
      presetDiagram.movieStatus != MovieStatus.inProgress && isAllowedToTap;
}
