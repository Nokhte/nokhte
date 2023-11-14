// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
// import 'package:nokhte/app/core/modules/collaborative_doc/presentation/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'collective_session_phase2_widgets_coordinator.g.dart';

class CollectiveSessionPhase2WidgetsCoordinator = _CollectiveSessionPhase2WidgetsCoordinatorBase
    with _$CollectiveSessionPhase2WidgetsCoordinator;

abstract class _CollectiveSessionPhase2WidgetsCoordinatorBase extends Equatable
    with Store {
  final CollaborativeTextEditorTrackerStore collaborativeTextEditor;
  final BeachWavesTrackerStore beachWaves;
  final GesturePillStore gesturePill;

  @action
  attuneTheWidgets() {
    gesturePill.wantToFadeOut = false;
    beachWaves.initiateSuspendedAtSea();
    // collaborativeTextEditor.setText('');
    collaborativeTextEditor.toggleWidgetVisibility();
    gesturePill.setPillMovie(BottomCircleGoesUp.getMovie(firstGradientColors: [
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
          Future.delayed(Seconds.get(3), () => Modular.to.navigate('/home/'));
        }
      });

  _CollectiveSessionPhase2WidgetsCoordinatorBase({
    required this.collaborativeTextEditor,
    required this.beachWaves,
    required this.gesturePill,
  });
  @override
  List<Object> get props => [];
}
