// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'scheduling_widgets_coordinator_store.g.dart';

class SchedulingWidgetsCoordinatorStore = _SchedulingWidgetsCoordinatorStoreBase
    with _$SchedulingWidgetsCoordinatorStore;

abstract class _SchedulingWidgetsCoordinatorStoreBase extends Equatable
    with Store {
  final SunAndMoonStore sunAndMoon;
  final BeachHorizonWaterTrackerStore beachWaves;
  final BeachSkyStore beachSkyStore;
  _SchedulingWidgetsCoordinatorStoreBase({
    required this.sunAndMoon,
    required this.beachSkyStore,
    required this.beachWaves,
  });

  @action
  attuneTheWidgets(DateTime currentTime) {
    sunAndMoon.selectTimeBasedMovie(currentTime);
    beachWaves.selectTimeBasedMovie(currentTime);
    beachSkyStore.selectTimeBasedMovie(currentTime);
  }

  @override
  List<Object> get props => [];
}
