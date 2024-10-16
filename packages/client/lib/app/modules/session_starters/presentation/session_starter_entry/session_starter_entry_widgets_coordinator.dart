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
    gestureCross.fadeInTheCross();
    beachWaves.setMovieMode(BeachWaveMovieModes.anyToOnShore);
    beachWaves.currentStore.initMovie(
      const AnyToOnShoreParams(
        startingColors: WaterColorsAndStops.simpleInvertedBeachWater,
        endingColors: WaterColorsAndStops.invertedBeachWater,
        endValue: -5.0,
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
