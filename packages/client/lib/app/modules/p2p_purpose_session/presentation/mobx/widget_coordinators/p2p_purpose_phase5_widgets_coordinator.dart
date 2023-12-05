// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_collaborative_text_editor_store.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase5_widgets_coordinator.g.dart';

class P2PPurposePhase5WidgetsCoordinator = _P2PPurposePhase5WidgetsCoordinatorBase
    with _$P2PPurposePhase5WidgetsCoordinator;

abstract class _P2PPurposePhase5WidgetsCoordinatorBase
    extends BaseCollaborativeTextEditorStore with Store {
  final NewBeachWavesStore newBeachWaves;

  _P2PPurposePhase5WidgetsCoordinatorBase({
    required this.newBeachWaves,
    required super.gesturePillStore,
    required super.collaborativeTextUI,
  }) : super(onCommitedNavigationRoute: '/p2p_purpose_session/phase-6/');

  @action
  constructor() {
    collaborativeTextUI.toggleWidgetVisibility();
    gesturePillStore.setFadeOut(false);
    gesturePillStore
        .setPillMovie(BottomCircleGoesUp.getMovie(firstGradientColors: [
      const Color(0xFFEB9040),
      const Color(0xFFD95C67),
    ], secondGradientColors: [
      const Color(0xFFEB9040),
      const Color(0xFFD95C67),
    ]));
    newBeachWaves.setMovieMode(BeachWaveMovieModes.suspendedAtTheDepths);
  }
}
