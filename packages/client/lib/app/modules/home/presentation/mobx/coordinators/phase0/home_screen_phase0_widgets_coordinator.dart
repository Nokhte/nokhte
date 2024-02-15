// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'home_screen_phase0_widgets_coordinator.g.dart';

class HomeScreenPhase0WidgetsCoordinator = _HomeScreenPhase0WidgetsCoordinatorBase
    with _$HomeScreenPhase0WidgetsCoordinator;

abstract class _HomeScreenPhase0WidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final GestureCrossStore gestureCross;

  _HomeScreenPhase0WidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
  });

  @observable
  WaterDirection waterDirection = WaterDirection.down;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
    beachWaves.currentStore.setControl(Control.mirror);
    gestureCross.fadeInTheCross();
  }

  @action
  onDisconnected() {
    beachWaves.currentStore.setControl(Control.playReverse);
  }

  @action
  onConnected() {
    beachWaves.currentStore.setControl(Control.mirror);
  }
}
