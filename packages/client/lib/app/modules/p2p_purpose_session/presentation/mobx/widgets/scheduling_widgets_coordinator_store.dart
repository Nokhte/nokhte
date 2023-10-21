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

  // @observable
  // DateTime currentSelectedTime = DateTime.now();

  @action
  attuneTheWidgets(DateTime currentTimeParam) {
    // currentSelectedTime = currentTimeParam;
    sunAndMoon.selectTimeBasedMovie(currentTimeParam);
    beachWater.selectTimeBasedMovie(currentTimeParam);
    beachSkyStore.selectTimeBasedMovie(currentTimeParam);
  }

  @action
  widgetSetup(DateTime currentDateTime) {
    attuneTheWidgets(currentDateTime);
    Future.delayed(Seconds.get(6), () {
      conveyerBelt.setWidgetVisibility(true);
      schedulingDelta.toggleWidgetVisibility();
    });
  }

  @action
  initForwardTimeShift(bool isADate, DateTime newTime) {
    if (isADate) {
      conveyerBelt.initForwardMovie();
    } else {
      final realNewTime = newTime.add(Hours.get(2));
      final pastTime = newTime.add(Hours.get(1));
      print(
          "forward: Hey here are the transition times new $realNewTime past $pastTime");
      beachSkyStore.initTimeShift(pastTime, realNewTime);
      beachWater.initTimeShift(pastTime, realNewTime);
      sunAndMoon.initTimeShift(pastTime, realNewTime);
      // currentSelectedTime = newTime;
      conveyerBelt.initForwardMovie();
    }
  }

  @action
  initBackwardTimeShift(bool isADate, DateTime newTime) {
    if (isADate) {
      conveyerBelt.initBackwardMovie();
    } else {
      final realNewTime = newTime.subtract(Hours.get(2));
      final pastTime = newTime.subtract(Hours.get(1));
      print(
          "backward: Hey here are the transition times new $realNewTime past $pastTime ");
      beachSkyStore.initTimeShift(pastTime, realNewTime);
      beachWater.initTimeShift(pastTime, realNewTime);
      sunAndMoon.initTimeShift(pastTime, realNewTime);
      conveyerBelt.initBackwardMovie();
    }
  }

  @override
  List<Object> get props => [];
}
