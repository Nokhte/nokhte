// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:primala/app/core/widgets/scheduling_delta/stack/stack.dart';
import 'package:primala/app/core/widgets/widgets.dart';
// import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'scheduling_widgets_coordinator_store.g.dart';

class SchedulingWidgetsCoordinatorStore = _SchedulingWidgetsCoordinatorStoreBase
    with _$SchedulingWidgetsCoordinatorStore;

abstract class _SchedulingWidgetsCoordinatorStoreBase extends Equatable
    with Store {
  final ConveyerBeltTextStore conveyerBelt;
  final SunAndMoonStore sunAndMoon;
  final BeachHorizonWaterTrackerStore beachHorizonWater;
  final BeachWavesTrackerStore beachWaves;

  final BeachSkyStore beachSkyStore;
  final SchedulingDeltaStore schedulingDelta;
  _SchedulingWidgetsCoordinatorStoreBase({
    required this.conveyerBelt,
    required this.sunAndMoon,
    required this.beachSkyStore,
    required this.beachHorizonWater,
    required this.schedulingDelta,
    required this.beachWaves,
  }) {
    reaction((p0) => beachHorizonWater.showWidget, (p0) {
      if (!p0) {
        toggleBeachWavesVisibility();
      }
    });

    reaction((p0) => beachWaves.movieStatus, (p0) {
      if (beachWaves.movieStatus == MovieStatus.finished &&
          beachWaves.movieMode == BeachWaveMovieModes.shallowsToShore) {
        Modular.to.navigate('/home/');
      }
    });
  }

  @observable
  bool beachWavesVisibility = false;

  @action
  toggleBeachWavesVisibility() => beachWavesVisibility = !beachWavesVisibility;

  @action
  attuneTheWidgets(DateTime currentTimeParam) {
    sunAndMoon.selectTimeBasedMovie(currentTimeParam);
    beachHorizonWater.selectTimeBasedMovie(currentTimeParam);
    beachSkyStore.selectTimeBasedMovie(currentTimeParam);
  }

  @action
  widgetSetup(DateTime currentDateTime) {
    attuneTheWidgets(currentDateTime);
    Future.delayed(Seconds.get(6), () {
      schedulingDelta.toggleWidgetVisibility();
      conveyerBelt.setWidgetVisibility(true);
    });
    // Future.delayed(Seconds.get(9), () {
    //   conveyerBelt.setWidgetVisibility(false);
    //   schedulingDelta.toggleWidgetVisibility();
    //   sunAndMoon.control = Control.playReverseFromEnd;
    //   beachSkyStore.control = Control.playReverseFromEnd;
    //   // beachHorizonWater.initiateBackToShore(currentDate: currentDateTime);
    //   beachHorizonWater.control = Control.playReverseFromEnd;
    //   // still not changing the movie
    //   // Future.delayed(Seconds.get(0, milli: 800), () {
    //   // still off I would say
    //   // beachHorizonWater.initiateBackToShore(
    //   //   currentDate: DateTime.now(),
    //   // );
    //   // beachHorizonWater.control = Control.playReverseFromEnd;
    //   // });
    // });
  }

  @action
  initBackToShore(DateTime theTimeToTransitionFrom) {
    conveyerBelt.setWidgetVisibility(false);
    schedulingDelta.toggleWidgetVisibility();
    Future.delayed(Seconds.get(3), () {
      // beachHorizonWater.initiateBackToShore(
      //     currentDate: theTimeToTransitionFrom);
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
      final realNewTime = newTime.add(Hours.get(1));
      final pastTime = newTime;
      // yeesh I think they are backwards, stuff needs to be done
      // print(
      //     "forward: Hey here are the transition times new $realNewTime past $pastTime");
      beachSkyStore.initTimeShift(pastTime: pastTime, newTime: realNewTime);
      beachHorizonWater.initTimeShift(pastTime: pastTime, newTime: realNewTime);
      sunAndMoon.initTimeShift(pastTime: pastTime, newTime: realNewTime);
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
      final pastTime = newTime;
      final realNewTime = newTime.subtract(Hours.get(1));
      // todo
      // print(
      //     "backward: Hey here are the transition times new $realNewTime past $pastTime ");
      beachSkyStore.initTimeShift(pastTime: pastTime, newTime: realNewTime);
      beachHorizonWater.initTimeShift(pastTime: pastTime, newTime: realNewTime);
      sunAndMoon.initTimeShift(pastTime: pastTime, newTime: realNewTime);
      conveyerBelt.initBackwardMovie();
    }
  }

  @override
  List<Object> get props => [];
}
