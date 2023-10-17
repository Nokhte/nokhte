// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/utilities/misc_algos.dart';
import 'package:primala/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

// * Mobx Codegen Inclusion
part 'beach_horizon_water_tracker_store.g.dart';

class BeachHorizonWaterTrackerStore = _BeachHorizonWaterTrackerStoreBase
    with _$BeachHorizonWaterTrackerStore;

abstract class _BeachHorizonWaterTrackerStoreBase extends Equatable with Store {
  @observable
  bool isComplete = false;

  @observable
  List<ColorAndStop> startingGrad = [];

  @observable
  List<ColorAndStop> endingGrad = [];

  @action
  void isADuskTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = WaterColorsAndStops.schedulingDuskWaterHalfScreen
        : endingGrad = WaterColorsAndStops.schedulingDuskWaterHalfScreen;
  }

  @action
  void isAMorningTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = WaterColorsAndStops.schedulingMorningWaterHalfScreen
        : endingGrad = WaterColorsAndStops.schedulingMorningWaterHalfScreen;
  }

  @action
  void isADayTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = WaterColorsAndStops.schedulingDayWaterHalfScreen
        : endingGrad = WaterColorsAndStops.schedulingDayWaterHalfScreen;
  }

  @action
  void isAEveningTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = WaterColorsAndStops.schedulingEveningWaterHalfScreen
        : endingGrad = WaterColorsAndStops.schedulingEveningWaterHalfScreen;
  }

  void setStartingGradient(DateTime pastTime) {
    MiscAlgos.schedulingExecutor(
      inputDate: pastTime,
      duskCallback: isADuskTime,
      morningCallback: isAMorningTime,
      dayCallback: isADayTime,
      eveningCallback: isAEveningTime,
      needsHourParam: false,
      needsStartingValueParam: true,
      isAStartingValue: true,
    );
  }

  void setEndingGradient(DateTime newTime) {
    MiscAlgos.schedulingExecutor(
      inputDate: newTime,
      duskCallback: isADuskTime,
      morningCallback: isAMorningTime,
      dayCallback: isADayTime,
      eveningCallback: isAEveningTime,
      needsHourParam: false,
      needsStartingValueParam: true,
      isAStartingValue: false,
    );
  }

  @action
  selectTimeBasedMovie(DateTime date) => MiscAlgos.schedulingExecutor(
        inputDate: date,
        needsStartingValueParam: false,
        needsHourParam: false,
        duskCallback: initDuskCallback,
        morningCallback: initMorningCallback,
        dayCallback: initDayCallback,
        eveningCallback: initEveningCallback,
      );

  @action
  void initDuskCallback() {
    // Branch 1: Time is between 9 PM and 5:59 AM
    movie = DepthsToHorizonWaters.getMovie(
      WaterColorsAndStops.schedulingDuskWaterFullScreen,
      WaterColorsAndStops.schedulingDuskWaterHalfScreen,
    );
    control = Control.play;
  }

  @action
  void initMorningCallback() {
    // Branch 2: Time is between 6 AM and 9:59 AM
    movie = DepthsToHorizonWaters.getMovie(
      WaterColorsAndStops.schedulingMorningWaterFullScreen,
      WaterColorsAndStops.schedulingMorningWaterHalfScreen,
    );
    control = Control.play;
  }

  @action
  void initDayCallback() {
    // Branch 3: Time is between 10 AM and 4:59 PM
    movie = DepthsToHorizonWaters.getMovie(
      WaterColorsAndStops.schedulingDayWaterFullScreen,
      WaterColorsAndStops.schedulingDayWaterHalfScreen,
    );
    control = Control.play;
  }

  @action
  void initEveningCallback() {
    // Branch 4: Time is between 5 PM and 8:59 PM
    movie = DepthsToHorizonWaters.getMovie(
      WaterColorsAndStops.schedulingEveningWaterFullScreen,
      WaterColorsAndStops.schedulingEveningWaterHalfScreen,
    );
    control = Control.play;
  }

  initForwardShift(DateTime pastTime, DateTime newTime) {
    setStartingGradient(pastTime);
    setEndingGradient(newTime);
    movie = HorizonWaterColorChange.getMovie(startingGrad, endingGrad);
    control = Control.playFromStart;
  }

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

  @override
  List<Object> get props => [];
}
// the problem is the gradients aren't moving
// with it so you don't have that part of the
// perspectives
