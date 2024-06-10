// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_starter_exit_widgets_coordinator.g.dart';

class SessionStarterExitWidgetsCoordinator = _SessionStarterExitWidgetsCoordinatorBase
    with _$SessionStarterExitWidgetsCoordinator;

abstract class _SessionStarterExitWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;

  _SessionStarterExitWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.gestureCross,
    required super.wifiDisconnectOverlay,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToOceanDive);
    beachWaves.currentStore.callsOnCompleteTwice = false;
    beachWaves.currentStore.reverseMovie(0);
    gestureCross.fadeInTheCross();
  }

  beachWavesMovieStatusReactor(Function onNavigationHome) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          onNavigationHome();
        }
      });
}
