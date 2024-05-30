// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_speaking_root_router_widgets_coordinator.g.dart';

class SessionSpeakingRootRouterWidgetsCoordinator = _SessionSpeakingRootRouterWidgetsCoordinatorBase
    with _$SessionSpeakingRootRouterWidgetsCoordinator;

abstract class _SessionSpeakingRootRouterWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;

  _SessionSpeakingRootRouterWidgetsCoordinatorBase({
    required super.wifiDisconnectOverlay,
    required this.beachWaves,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
    beachWaves.currentStore.initMovie(NoParams());
  }

  beachWavesMovieStatusReactor(Function onComplete) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          onComplete();
          // Modular.to.navigate(route);
        }
      });
}
