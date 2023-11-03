// ignore_for_file: must_be_immutable, library_private_types_in_public_api, missing_override_of_must_be_overridden
// * Mobx Import
// import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// import 'package:primala/app/core/interfaces/logic.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_scheduling_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

// * Mobx Codegen Inclusion
part 'beach_horizon_water_tracker_store.g.dart';

class BeachHorizonWaterTrackerStore = _BeachHorizonWaterTrackerStoreBase
    with _$BeachHorizonWaterTrackerStore;

abstract class _BeachHorizonWaterTrackerStoreBase
    extends BaseSchedulingWidgetStore<ColorAndStop, List<ColorAndStop>,
        IsATimeMobxParams> with Store {
  bool isGoingToFullSky;

  _BeachHorizonWaterTrackerStoreBase({
    required this.isGoingToFullSky,
  });

  @observable
  HorizonMovieModes movieMode = HorizonMovieModes.regular;

  @observable
  bool backToShoreCompleted = false;

  @observable
  bool isFirstTimeCompleting = true;

  @action
  setControl(Control newControl) => control = newControl;

  @action
  void toggleShoreCompletionStatus() =>
      backToShoreCompleted = !backToShoreCompleted;

  @action
  setMovieMode(HorizonMovieModes newMovieMode) => movieMode = newMovieMode;

  @observable
  bool isComplete = false;

  @observable
  bool movieIsLonger = false;

  @action
  onAnimationCompleted() {
    print(
        "what's happeneing here $movieMode $isGoingToFullSky $isFirstTimeCompleting");
    if (movieMode == HorizonMovieModes.backToShore) {
      toggleShoreCompletionStatus();
    }
    if (isGoingToFullSky && isFirstTimeCompleting) {
      movie = HorizonToFullSky.getMovie(endingGrad);
      setControl(Control.playFromStart);
      isFirstTimeCompleting = false;
    }
  }

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

  @action
  selectTimeBasedMovie(
    DateTime date,
    List<ColorAndStop> startingMovieGrad,
  ) {
    final hour = date.hour;
    if (hour >= 21 || hour < 6) {
      initDuskCallback(startingMovieGrad);
      if (startingMovieGrad == WaterColorsAndStops.toTheDepthsWater ||
          startingMovieGrad == WaterColorsAndStops.oceanDiveWater) {
        control = Control.play;
      }
      // Branch 1: Time is between 9 PM and 5:59 AM
    } else if (hour >= 6 && hour < 10) {
      // Branch 2: Time is between 6 AM and 9:59 AM
      initMorningCallback(startingMovieGrad);
      if (startingMovieGrad == WaterColorsAndStops.toTheDepthsWater ||
          startingMovieGrad == WaterColorsAndStops.oceanDiveWater) {
        control = Control.play;
      }
    } else if (hour >= 10 && hour < 17) {
      // Branch 3: Time is between 10 AM and 4:59 PM
      initDayCallback(startingMovieGrad);
      if (startingMovieGrad == WaterColorsAndStops.toTheDepthsWater ||
          startingMovieGrad == WaterColorsAndStops.oceanDiveWater) {
        control = Control.play;
      }
    } else {
      // Branch 4: Time is between 5 PM and 8:59 PM
      initEveningCallback(startingMovieGrad);
      if (startingMovieGrad == WaterColorsAndStops.toTheDepthsWater ||
          startingMovieGrad == WaterColorsAndStops.oceanDiveWater) {
        control = Control.play;
      }
    }
  }

  @override
  @action
  void initDuskCallback(params) {
    // Branch 1: Time is between 9 PM and 5:59 AM
    startingGrad = WaterColorsAndStops.schedulingDuskWaterFullScreen;
    endingGrad = WaterColorsAndStops.schedulingDuskWaterHalfScreen;
    setMovie(AnywhereToHorizonWaters.getMovie(
      params,
      startingGrad,
      endingGrad,
    ));
    // control = Control.play;
  }

  @override
  @action
  void initMorningCallback(params) {
    // Branch 2: Time is between 6 AM and 9:59 AM
    startingGrad = WaterColorsAndStops.schedulingMorningWaterFullScreen;
    endingGrad = WaterColorsAndStops.schedulingMorningWaterHalfScreen;
    setMovie(AnywhereToHorizonWaters.getMovie(
      params,
      startingGrad,
      endingGrad,
    ));
    // control = Control.play;
  }

  @override
  @action
  void initDayCallback(params) {
    // print("Is this refreshing the UI/??");
    // Branch 3: Time is between 10 AM and 4:59 PM
    startingGrad = WaterColorsAndStops.schedulingDayWaterFullScreen;
    endingGrad = WaterColorsAndStops.schedulingDayWaterHalfScreen;
    setMovie(AnywhereToHorizonWaters.getMovie(
      params,
      startingGrad,
      endingGrad,
    ));
    // control = Control.play;
  }

  @override
  @action
  void initEveningCallback(params) {
    // Branch 4: Time is between 5 PM and 8:59 PM
    startingGrad = WaterColorsAndStops.schedulingEveningWaterFullScreen;
    endingGrad = WaterColorsAndStops.schedulingEveningWaterHalfScreen;
    setMovie(AnywhereToHorizonWaters.getMovie(
      params,
      startingGrad,
      endingGrad,
    ));
    // control = Control.play;
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

  @action
  fullSkyBackToShorePreReq({required DateTime currentTime}) {
    // setMovieMode(HorizonMovieModes.backToShorePreReq);
    final hour = currentTime.hour;
    if (hour >= 21 || hour < 6) {
      movie = BackToShorePreReqMovie.getMovie(
        WaterColorsAndStops.schedulingDuskWaterHalfScreen,
      );
      control = Control.playFromStart;
    } else if (hour >= 6 && hour < 10) {
      movie = BackToShorePreReqMovie.getMovie(
        WaterColorsAndStops.schedulingMorningWaterHalfScreen,
      );
      control = Control.playFromStart;
    } else if (hour >= 10 && hour < 17) {
      movie = BackToShorePreReqMovie.getMovie(
        WaterColorsAndStops.schedulingDayWaterHalfScreen,
      );
      control = Control.playFromStart;
    } else {
      movie = BackToShorePreReqMovie.getMovie(
        WaterColorsAndStops.schedulingEveningWaterHalfScreen,
      );
      control = Control.playFromStart;
    }
    //
  }

  @action
  initBackToShore({required DateTime currentTime}) {
    setMovieMode(HorizonMovieModes.backToShore);
    selectTimeBasedMovie(currentTime, WaterColorsAndStops.oceanDiveWater);
    setControl(Control.playReverseFromEnd);
  }

  @action
  setMovie(MovieTween newMovie) => movie = newMovie;

  @observable
  MovieTween movie = AnywhereToHorizonWaters.getMovie(
    WaterColorsAndStops.toTheDepthsWater,
    WaterColorsAndStops.schedulingEveningWaterFullScreen,
    WaterColorsAndStops.schedulingEveningWaterFullScreen,
  );

  @observable
  Control control = Control.stop;
}
// the same over under / lerp logic & categorization should be done for every
// other store & the duration of the movies