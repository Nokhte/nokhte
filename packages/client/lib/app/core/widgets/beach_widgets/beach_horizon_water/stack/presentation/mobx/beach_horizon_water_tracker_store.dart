// ignore_for_file: must_be_immutable, library_private_types_in_public_api, missing_override_of_must_be_overridden
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/interfaces/logic.dart';
// * Equatable Import
import 'package:primala/app/core/mobx/base_scheduling_widget_store.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

// * Mobx Codegen Inclusion
part 'beach_horizon_water_tracker_store.g.dart';

class BeachHorizonWaterTrackerStore = _BeachHorizonWaterTrackerStoreBase
    with _$BeachHorizonWaterTrackerStore;

abstract class _BeachHorizonWaterTrackerStoreBase
    extends BaseSchedulingWidgetStore<ColorAndStop, NoParams, IsATimeMobxParams>
    with Store {
  @observable
  bool isComplete = false;

  @observable
  bool movieIsLonger = false;

  @action
  setGradient(DateTime date, {required bool isStart}) {
    final hour = date.hour;
    final params = IsATimeMobxParams(
      hour: hour,
      isAStartingValue: isStart,
    );
    if (hour >= 21 || hour < 6) {
      // Branch 1: Time is between 9 PM and 5:59 AM
      isADuskTime(params);
    } else if (hour >= 6 && hour < 10) {
      // Branch 2: Time is between 6 AM and 9:59 AM
      isAMorningTime(params);
    } else if (hour >= 10 && hour < 17) {
      // Branch 3: Time is between 10 AM and 4:59 PM
      isADayTime(params);
    } else {
      // Branch 4: Time is between 5 PM and 8:59 PM
      isAEveningTime(params);
    }
  }

  @override
  @action
  void isADuskTime(IsATimeMobxParams param) {
    if (param.isAStartingValue) {
      startingGrad = WaterColorsAndStops.schedulingDuskWaterHalfScreen;
      if (param.hour == 5) {
        movieIsLonger = true; // over under
      } else {
        movieIsLonger = false; // over under
      }
    } else {
      endingGrad = WaterColorsAndStops.schedulingDuskWaterHalfScreen;
    }
  }

  @override
  @action
  void isAMorningTime(IsATimeMobxParams params) {
    if (params.isAStartingValue) {
      startingGrad = WaterColorsAndStops.schedulingMorningWaterHalfScreen;
      if (params.hour == 9) {
        movieIsLonger = true;
      } else {
        movieIsLonger = false;
      }
    } else {
      endingGrad = WaterColorsAndStops.schedulingMorningWaterHalfScreen;
    }
  }

  @override
  @action
  void isADayTime(IsATimeMobxParams params) {
    if (params.isAStartingValue) {
      startingGrad = WaterColorsAndStops.schedulingDayWaterHalfScreen;
      movieIsLonger = false;
    } else {
      endingGrad = WaterColorsAndStops.schedulingDayWaterHalfScreen;
    }
  }

  @override
  @action
  void isAEveningTime(IsATimeMobxParams params) {
    if (params.isAStartingValue) {
      startingGrad = WaterColorsAndStops.schedulingEveningWaterHalfScreen;
      if (params.hour == 20) {
        movieIsLonger = true;
      } else {
        movieIsLonger = false;
      }
    } else {
      endingGrad = WaterColorsAndStops.schedulingEveningWaterHalfScreen;
    }
  }

  // @action
  selectTimeBasedMovie(DateTime date) {
    final hour = date.hour;
    if (hour >= 21 || hour < 6) {
      initDuskCallback(NoParams());
      // Branch 1: Time is between 9 PM and 5:59 AM
    } else if (hour >= 6 && hour < 10) {
      // Branch 2: Time is between 6 AM and 9:59 AM
      initMorningCallback(NoParams());
    } else if (hour >= 10 && hour < 17) {
      // Branch 3: Time is between 10 AM and 4:59 PM
      initDayCallback(NoParams());
    } else {
      // Branch 4: Time is between 5 PM and 8:59 PM
      initEveningCallback(NoParams());
    }
  }

  @override
  @action
  void initDuskCallback(params) {
    // Branch 1: Time is between 9 PM and 5:59 AM
    movie = DepthsToHorizonWaters.getMovie(
      WaterColorsAndStops.schedulingDuskWaterFullScreen,
      WaterColorsAndStops.schedulingDuskWaterHalfScreen,
    );
    control = Control.play;
  }

  @override
  @action
  void initMorningCallback(params) {
    // Branch 2: Time is between 6 AM and 9:59 AM
    movie = DepthsToHorizonWaters.getMovie(
      WaterColorsAndStops.schedulingMorningWaterFullScreen,
      WaterColorsAndStops.schedulingMorningWaterHalfScreen,
    );
    control = Control.play;
  }

  @override
  @action
  void initDayCallback(params) {
    // Branch 3: Time is between 10 AM and 4:59 PM
    movie = DepthsToHorizonWaters.getMovie(
      WaterColorsAndStops.schedulingDayWaterFullScreen,
      WaterColorsAndStops.schedulingDayWaterHalfScreen,
    );
    control = Control.play;
  }

  @override
  @action
  void initEveningCallback(params) {
    // Branch 4: Time is between 5 PM and 8:59 PM
    movie = DepthsToHorizonWaters.getMovie(
      WaterColorsAndStops.schedulingEveningWaterFullScreen,
      WaterColorsAndStops.schedulingEveningWaterHalfScreen,
    );
    control = Control.play;
  }

  @override
  @action
  initTimeShift({required DateTime pastTime, required DateTime newTime}) {
    setGradient(pastTime, isStart: true);
    setGradient(newTime, isStart: false);
    movie = HorizonWaterColorChange.getMovie(
      startingGrad,
      endingGrad,
      movieIsLonger,
    );
    control = Control.play;
  }

  void setControl(Control newControl) => control = newControl;

  @observable
  MovieTween movie = DepthsToHorizonWaters.getMovie(
    WaterColorsAndStops.schedulingEveningWaterFullScreen,
    WaterColorsAndStops.schedulingEveningWaterFullScreen,
  );

  @observable
  Control control = Control.stop;
}
// the same over under / lerp logic & categorization should be done for every
// other store & the duration of the movies