// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'home_screen_root_router_widgets_coordinator.g.dart';

class HomeScreenRootRouterWidgetsCoordinator = _HomeScreenRootRouterWidgetsCoordinatorBase
    with _$HomeScreenRootRouterWidgetsCoordinator;

abstract class _HomeScreenRootRouterWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator {
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _HomeScreenRootRouterWidgetsCoordinatorBase({
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
