// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'perspectives_widgets_coordinator_store.g.dart';

class PerspectivesWidgetsCoordinatorStore = _PerspectivesWidgetsCoordinatorStoreBase
    with _$PerspectivesWidgetsCoordinatorStore;

abstract class _PerspectivesWidgetsCoordinatorStoreBase extends Equatable
    with Store {
  final BeachHorizonWaterTrackerStore beachHorizonWater;
  final BeachSkyStore beachSky;
  final PerspectivesMapStore perspectivesMap;

  _PerspectivesWidgetsCoordinatorStoreBase({
    required this.beachHorizonWater,
    required this.beachSky,
    required this.perspectivesMap,
  });

  attuneTheWidgets(DateTime now) {
    // final now = DateTime.now();
    beachHorizonWater.selectTimeBasedMovie(
      now,
      WaterColorsAndStops.oceanDiveWater,
    );
    beachSky.selectTimeBasedMovie(now);
    //
  }

  @override
  List<Object> get props => [];
}
