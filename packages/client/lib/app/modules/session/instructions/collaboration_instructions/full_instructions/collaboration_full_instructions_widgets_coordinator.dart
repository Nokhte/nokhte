// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'collaboration_full_instructions_widgets_coordinator.g.dart';

class CollaborationFullInstructionsWidgetsCoordinator = _CollaborationFullInstructionsWidgetsCoordinatorBase
    with _$CollaborationFullInstructionsWidgetsCoordinator;

abstract class _CollaborationFullInstructionsWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator, Reactions {
  final PresetDiagramStore presetDiagram;
  final BeachWavesStore beachWaves;
  final SmartTextStore smartText;
  final TouchRippleStore touchRipple;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  _CollaborationFullInstructionsWidgetsCoordinatorBase({
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
    smartText.setMessagesData(SessionLists.collaborationFullInstructions);
    smartText.startRotatingText();
    smartText.setStaticAltMovie(SessionConstants.blue);
    canTap = true;
    presetDiagram.initMovie(PresetDiagramMovieModes.appear);
    initReactors();
  }

  @action
  initReactors() {
    disposers.add(rippleCompletionStatusReactor());
  }

  @action
  onTap(Offset tapPosition) {
    if (gestureIsAllowed) {
      touchRipple.onTap(tapPosition);
      if (smartText.currentIndex == 0) {
        smartText.startRotatingText(isResuming: true);
        presetDiagram.initMovie(
          PresetDiagramMovieModes.whiteToHalfAndHalfCircle,
        );
      } else if (smartText.currentIndex == 1) {
        smartText.startRotatingText(isResuming: true);
        presetDiagram.setWidgetVisibility(false);
        beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToHalfAndHalf);
        beachWaves.currentStore.initMovie(NoParams());
        canTap = false;
      }
    }
  }

  rippleCompletionStatusReactor() =>
      reaction((p0) => touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            beachWaves.movieMode != BeachWaveMovieModes.deepSeaToBorealis) {
          Modular.to.navigate(SessionConstants.soloHybridInstructions);
        }
      });

  @computed
  bool get gestureIsAllowed =>
      presetDiagram.movieStatus != MovieStatus.inProgress && canTap;
}
