// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_starter_entry_widgets_coordinator.g.dart';

class SessionStarterEntryWidgetsCoordinator = _SessionStarterEntryWidgetsCoordinatorBase
    with _$SessionStarterEntryWidgetsCoordinator;

abstract class _SessionStarterEntryWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator {
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionStarterEntryWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.gestureCross,
    required this.wifiDisconnectOverlay,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.anyToOnShore);
    gestureCross.fadeInTheCross();
    beachWaves.currentStore.initMovie(
      const AnyToOnShoreParams(
        startingColors: WaterColorsAndStops.oceanDiveWater,
        endingColors: WaterColorsAndStops.invertedBeachWater,
      ),
    );
  }

  beachWavesMovieStatusReactor({
    required Function onFinished,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          onFinished();
        }
      });
}
