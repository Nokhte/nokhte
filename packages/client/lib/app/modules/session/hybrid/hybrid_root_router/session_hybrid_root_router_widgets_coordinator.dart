// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_hybrid_root_router_widgets_coordinator.g.dart';

class SessionHybridRootRouterWidgetsCoordinator = _SessionHybridRootRouterWidgetsCoordinatorBase
    with _$SessionHybridRootRouterWidgetsCoordinator;

abstract class _SessionHybridRootRouterWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;

  _SessionHybridRootRouterWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToInvertedHalfAndHalf);
    beachWaves.currentStore.initMovie(NoParams());
  }

  beachWavesMovieStatusReactor(Function onComplete) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          onComplete();
        }
      });
}
