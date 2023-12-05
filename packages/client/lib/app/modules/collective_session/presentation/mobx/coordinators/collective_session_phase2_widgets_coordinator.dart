// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'collective_session_phase2_widgets_coordinator.g.dart';

class CollectiveSessionPhase2WidgetsCoordinator = _CollectiveSessionPhase2WidgetsCoordinatorBase
    with _$CollectiveSessionPhase2WidgetsCoordinator;

abstract class _CollectiveSessionPhase2WidgetsCoordinatorBase
    extends BaseCollaborativeTextEditorStore with Store {
  final BeachWavesTrackerStore beachWaves;

  @action
  attuneTheWidgets() {
    gesturePillStore.wantToFadeOut = false;
    beachWaves.initiateSuspendedAtSea();
    collaborativeTextUI.toggleWidgetVisibility();
    gesturePillStore
        .setPillMovie(BottomCircleGoesUp.getMovie(firstGradientColors: [
      const Color(0xFFEB9040),
      const Color(0xFFD95C67),
    ], secondGradientColors: [
      const Color(0xFFEB9040),
      const Color(0xFFD95C67),
    ]));
    beachWaveListener();
  }

  @observable
  bool isFirstTimeGoingThroughIt = true;

  toggleIsFirstTimeGoingThroughIt() =>
      isFirstTimeGoingThroughIt = !isFirstTimeGoingThroughIt;

  @action
  goBackHome() {
    beachWaves.initShallowsToShore();
    beachWaves.control = Control.playFromStart;
  }

  beachWaveListener() => reaction((p0) => beachWaves.movieStatus, (p0) {
        if (isFirstTimeGoingThroughIt) {
          toggleIsFirstTimeGoingThroughIt();
        } else if (beachWaves.movieStatus == MovieStatus.finished &&
            beachWaves.movieMode == BeachWaveMovieModes.shallowsToShore) {
          Modular.to.navigate('/home/');
        }
      });

  _CollectiveSessionPhase2WidgetsCoordinatorBase({
    required super.collaborativeTextUI,
    required super.gesturePillStore,
    required this.beachWaves,
  }) : super(onCommitedNavigationRoute: '/home/');
  @override
  List<Object> get props => [];
}
