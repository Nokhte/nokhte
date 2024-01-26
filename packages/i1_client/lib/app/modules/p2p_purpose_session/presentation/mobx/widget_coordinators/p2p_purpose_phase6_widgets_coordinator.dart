// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'p2p_purpose_phase6_widgets_coordinator.g.dart';

class P2PPurposePhase6WidgetsCoordinator = _P2PPurposePhase6WidgetsCoordinatorBase
    with _$P2PPurposePhase6WidgetsCoordinator;

abstract class _P2PPurposePhase6WidgetsCoordinatorBase extends Equatable
    with Store {
  final ConveyerBeltTextStore conveyerBelt;
  final SunAndMoonStore sunAndMoon;
  final BeachHorizonWaterTrackerStore beachHorizonWater;
  final BeachWavesTrackerStore beachWaves;

  final BeachSkyStore beachSkyStore;
  final SchedulingDeltaStore schedulingDelta;
  _P2PPurposePhase6WidgetsCoordinatorBase({
    required this.conveyerBelt,
    required this.sunAndMoon,
    required this.beachSkyStore,
    required this.beachHorizonWater,
    required this.schedulingDelta,
    required this.beachWaves,
  }) {
    reaction((p0) => beachHorizonWater.backToShoreCompleted, (p0) {
      if (p0) {
        toggleBeachWavesVisibility();
        beachWaves.toggleWidgetVisibility();
        beachWaves.initShallowsToShore();
        beachWaves.control = Control.play;
      }
    });

    reaction((p0) => beachWaves.movieStatus, (p0) {
      if (beachWaves.movieStatus == MovieStatus.finished &&
          beachWaves.movieMode == BeachWaveMovieModes.shallowsToShore) {
        // print("hey did the movie finish & back to home");
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
    beachHorizonWater.selectTimeBasedMovie(
      currentTimeParam,
      WaterColorsAndStops.toTheDepthsWater,
    );
    beachSkyStore.selectTimeBasedMovie(currentTimeParam);
  }

  @action
  widgetSetup(DateTime currentDateTime) {
    beachWaves.toggleWidgetVisibility();
    attuneTheWidgets(currentDateTime);
    Future.delayed(Seconds.get(6), () {
      schedulingDelta.toggleWidgetVisibility();
      conveyerBelt.setWidgetVisibility(true);
    });
  }

  @action
  initBackToShore(DateTime theTimeToTransitionFrom) {
    conveyerBelt.setWidgetVisibility(false);
    schedulingDelta.toggleWidgetVisibility();
    Future.delayed(Seconds.get(4), () {
      sunAndMoon.selectTimeBasedMovie(theTimeToTransitionFrom);
      sunAndMoon.control = Control.playReverseFromEnd;
      beachSkyStore.selectTimeBasedMovie(theTimeToTransitionFrom);
      beachSkyStore.control = Control.playReverseFromEnd;
      beachHorizonWater.initBackToShore(currentTime: theTimeToTransitionFrom);
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
      final realNewTime = newTime.add(Hours.get(1));
      final pastTime = newTime;
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
      beachSkyStore.initTimeShift(pastTime: pastTime, newTime: realNewTime);
      beachHorizonWater.initTimeShift(pastTime: pastTime, newTime: realNewTime);
      sunAndMoon.initTimeShift(pastTime: pastTime, newTime: realNewTime);
      conveyerBelt.initBackwardMovie();
    }
  }

  @override
  List<Object> get props => [];
}
