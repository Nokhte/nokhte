// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/scheduling_delta/stack/stack.dart';
import 'package:primala/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'scheduling_widgets_coordinator_store.g.dart';

class SchedulingWidgetsCoordinatorStore = _SchedulingWidgetsCoordinatorStoreBase
    with _$SchedulingWidgetsCoordinatorStore;

abstract class _SchedulingWidgetsCoordinatorStoreBase extends Equatable
    with Store {
  final ConveyerBeltTextStore conveyerBelt;
  final SunAndMoonStore sunAndMoon;
  final BeachHorizonWaterTrackerStore beachWater;
  final BeachSkyStore beachSkyStore;
  final SchedulingDeltaStore schedulingDelta;
  _SchedulingWidgetsCoordinatorStoreBase({
    required this.conveyerBelt,
    required this.sunAndMoon,
    required this.beachSkyStore,
    required this.beachWater,
    required this.schedulingDelta,
  });

  @action
  attuneTheWidgets(DateTime currentTimeParam) {
    sunAndMoon.selectTimeBasedMovie(currentTimeParam);
    beachWater.selectTimeBasedMovie(currentTimeParam);
    beachSkyStore.selectTimeBasedMovie(currentTimeParam);
  }

  @action
  widgetSetup(DateTime currentDateTime) {
    attuneTheWidgets(currentDateTime);
    Future.delayed(Seconds.get(6), () {
      schedulingDelta.toggleWidgetVisibility();
      conveyerBelt.setWidgetVisibility(true);
    });
  }

  @action
  initForwardTimeShift({
    required bool isADate,
    required DateTime newTime,
  }) {
    if (isADate) {
      conveyerBelt.initForwardMovie();
    } else {
      // print("hey what's the date being passed in ${newTime.hour}");
      final pastTime = newTime.subtract(Hours.get(1));
      print(
          "forward: Hey here are the transition times new $newTime past $pastTime");
      beachSkyStore.initTimeShift(pastTime, newTime);
      beachWater.initTimeShift(pastTime, newTime);
      sunAndMoon.initTimeShift(pastTime, newTime);
      conveyerBelt.initForwardMovie();
    }
  }

  @action
  initBackwardTimeShift({
    required bool isADate,
    required DateTime newTime,
  }) {
    if (isADate) {
      conveyerBelt.initBackwardMovie();
    } else {
      final pastTime = newTime.add(Hours.get(1));
      print(
          "backward: Hey here are the transition times new $newTime past $pastTime ");
      beachSkyStore.initTimeShift(pastTime, newTime);
      beachWater.initTimeShift(pastTime, newTime);
      sunAndMoon.initTimeShift(pastTime, newTime);
      conveyerBelt.initBackwardMovie();
    }
  }

  @override
  List<Object> get props => [];
}
