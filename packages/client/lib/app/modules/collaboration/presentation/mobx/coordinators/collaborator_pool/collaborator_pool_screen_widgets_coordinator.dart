// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'collaborator_pool_screen_widgets_coordinator.g.dart';

class CollaboratorPoolScreenWidgetsCoordinator = _CollaboratorPoolScreenWidgetsCoordinatorBase
    with _$CollaboratorPoolScreenWidgetsCoordinator;

abstract class _CollaboratorPoolScreenWidgetsCoordinatorBase extends Equatable
    with Store {
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  // add waitingOnCollaborator text;

  _CollaboratorPoolScreenWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradientToTimesUp);
    beachWaves.currentStore.initMovie(NoParams());
    beachWavesMovieStatusReactor();
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode ==
              BeachWaveMovieModes.vibrantBlueGradientToTimesUp) {
            beachWaves.setMovieMode(BeachWaveMovieModes.timesUp);
            beachWaves.currentStore.initMovie(Seconds.get(63));
          } else if (beachWaves.movieMode == BeachWaveMovieModes.timesUp) {
            beachWaves.setMovieMode(BeachWaveMovieModes.timesUpEndToOceanDive);
            beachWaves.currentStore.initMovie(NoParams());
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.timesUpDynamicPointToTheDepths) {
            Modular.to.navigate("/purpose_session/");
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.timesUpEndToOceanDive) {
            Modular.to.navigate("/collaboration/");
          }
        }
      });

  @action
  initTransitionToPurposeSession() {
    beachWaves.setMovieMode(BeachWaveMovieModes.timesUpDynamicPointToTheDepths);
    beachWaves.currentStore.initMovie([
      ColorAndStop(beachWaves.currentAnimationValues[1],
          beachWaves.currentAnimationValues[9]),
      ColorAndStop(beachWaves.currentAnimationValues[2],
          beachWaves.currentAnimationValues[10]),
      ColorAndStop(beachWaves.currentAnimationValues[3],
          beachWaves.currentAnimationValues[11]),
      ColorAndStop(beachWaves.currentAnimationValues[4],
          beachWaves.currentAnimationValues[12]),
      ColorAndStop(beachWaves.currentAnimationValues[5],
          beachWaves.currentAnimationValues[13]),
      ColorAndStop(beachWaves.currentAnimationValues[6],
          beachWaves.currentAnimationValues[14]),
      ColorAndStop(beachWaves.currentAnimationValues[7],
          beachWaves.currentAnimationValues[15]),
      ColorAndStop(beachWaves.currentAnimationValues[8],
          beachWaves.currentAnimationValues[16]),
    ]);
  }

  @override
  List<Object> get props => [];
}
