// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'scheduling_widgets_coordinator_store.g.dart';

class SchedulingWidgetsCoordinatorStore = _SchedulingWidgetsCoordinatorStoreBase
    with _$SchedulingWidgetsCoordinatorStore;

abstract class _SchedulingWidgetsCoordinatorStoreBase extends Equatable
    with Store {
  final SunAndMoonStore sunAndMoon;
  final BeachHorizonWaterTrackerStore beachWaves;
  final BeachSkyStore beachSkyStore;
  final BeachHorizonWaterTrackerStore overlayBeachWaterStore;
  _SchedulingWidgetsCoordinatorStoreBase({
    required this.sunAndMoon,
    required this.beachSkyStore,
    required this.beachWaves,
    required this.overlayBeachWaterStore,
  });

  @action
  setTheOverlayWidget() {
    overlayBeachWaterStore.setControl(Control.playReverse);
    overlayBeachWaterStore.setControl(Control.stop);
  }

  @action
  attuneTheWidgets(DateTime currentTime) {
    sunAndMoon.selectTimeBasedMovie(currentTime);
    beachWaves.selectTimeBasedMovie(currentTime);
    beachSkyStore.selectTimeBasedMovie(currentTime);
  }

  @override
  List<Object> get props => [];
}
