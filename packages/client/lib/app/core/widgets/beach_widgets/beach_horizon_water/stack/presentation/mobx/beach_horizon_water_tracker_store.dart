// ignore_for_file: must_be_immutable, library_private_types_in_public_api, missing_override_of_must_be_overridden
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/mobx/base_scheduling_widget_store.dart';
import 'package:primala/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

// * Mobx Codegen Inclusion
part 'beach_horizon_water_tracker_store.g.dart';

class BeachHorizonWaterTrackerStore = _BeachHorizonWaterTrackerStoreBase
    with _$BeachHorizonWaterTrackerStore;

abstract class _BeachHorizonWaterTrackerStoreBase
    extends BaseSchedulingWidgetStore<ColorAndStop> with Store {
  @observable
  bool isComplete = false;

  @override
  @action
  void isADuskTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = WaterColorsAndStops.schedulingDuskWaterHalfScreen
        : endingGrad = WaterColorsAndStops.schedulingDuskWaterHalfScreen;
  }

  @override
  @action
  void isAMorningTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = WaterColorsAndStops.schedulingMorningWaterHalfScreen
        : endingGrad = WaterColorsAndStops.schedulingMorningWaterHalfScreen;
  }

  @override
  @action
  void isADayTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = WaterColorsAndStops.schedulingDayWaterHalfScreen
        : endingGrad = WaterColorsAndStops.schedulingDayWaterHalfScreen;
  }

  @override
  @action
  void isAEveningTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = WaterColorsAndStops.schedulingEveningWaterHalfScreen
        : endingGrad = WaterColorsAndStops.schedulingEveningWaterHalfScreen;
  }

  @override
  @action
  void initDuskCallback() {
    // Branch 1: Time is between 9 PM and 5:59 AM
    movie = DepthsToHorizonWaters.getMovie(
      WaterColorsAndStops.schedulingDuskWaterFullScreen,
      WaterColorsAndStops.schedulingDuskWaterHalfScreen,
    );
    control = Control.play;
  }

  @override
  @action
  void initMorningCallback() {
    // Branch 2: Time is between 6 AM and 9:59 AM
    movie = DepthsToHorizonWaters.getMovie(
      WaterColorsAndStops.schedulingMorningWaterFullScreen,
      WaterColorsAndStops.schedulingMorningWaterHalfScreen,
    );
    control = Control.play;
  }

  @override
  @action
  void initDayCallback() {
    // Branch 3: Time is between 10 AM and 4:59 PM
    movie = DepthsToHorizonWaters.getMovie(
      WaterColorsAndStops.schedulingDayWaterFullScreen,
      WaterColorsAndStops.schedulingDayWaterHalfScreen,
    );
    control = Control.play;
  }

  @override
  @action
  void initEveningCallback() {
    // Branch 4: Time is between 5 PM and 8:59 PM
    movie = DepthsToHorizonWaters.getMovie(
      WaterColorsAndStops.schedulingEveningWaterFullScreen,
      WaterColorsAndStops.schedulingEveningWaterHalfScreen,
    );
    control = Control.play;
  }

  @override
  initForwardShift(DateTime pastTime, DateTime newTime) {
    setStartingGradient(pastTime);
    setEndingGradient(newTime);
    movie = HorizonWaterColorChange.getMovie(startingGrad, endingGrad);
    control = Control.playFromStart;
  }

  @override
  @action
  initBackwardsShift(DateTime pastTime, DateTime newTime) {}

  //
  void setControl(Control newControl) => control = newControl;

  @observable
  MovieTween movie = DepthsToHorizonWaters.getMovie(
    WaterColorsAndStops.schedulingEveningWaterFullScreen,
    WaterColorsAndStops.schedulingEveningWaterFullScreen,
  );

  @observable
  Control control = Control.stop;
}
