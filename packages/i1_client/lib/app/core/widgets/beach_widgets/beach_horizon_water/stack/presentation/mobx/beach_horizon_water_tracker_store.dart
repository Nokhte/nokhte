// ignore_for_file: must_be_immutable, library_private_types_in_public_api, missing_override_of_must_be_overridden
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_animated_scheduling_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

part 'beach_horizon_water_tracker_store.g.dart';

class BeachHorizonWaterTrackerStore = _BeachHorizonWaterTrackerStoreBase
    with _$BeachHorizonWaterTrackerStore;

abstract class _BeachHorizonWaterTrackerStoreBase
    extends BaseAnimatedSchedulingWidgetStore<ColorAndStop, List<ColorAndStop>,
        IsATimeMobxParams> with Store {
          
  _BeachHorizonWaterTrackerStoreBase({required this.isGoingToFullSky}) {
    movie = AnywhereToHorizonWaters.getMovie(
      WaterColorsAndStops.toTheDepthsWater,
      WaterColorsAndStops.schedulingEveningWaterFullScreen,
      WaterColorsAndStops.schedulingEveningWaterFullScreen,
    );
  }

  @observable
  bool isGoingToFullSky;

  @observable
  double currentWaterValue = 0.0;

  @action
  initImmersionBackToHorizon() {
    setMovie(ImmersionBackToShore.getMovie(currentWaterValue));
    setControl(Control.playFromStart);
  }

  @action
  setCurrentWaterValue(double newValue) => currentWaterValue = newValue;

  @action
  toggleIsGoingFullSky() => isGoingToFullSky = !isGoingToFullSky;

  @observable
  HorizonMovieModes movieMode = HorizonMovieModes.regular;

  @observable
  bool backToShoreCompleted = false;

  @observable
  bool isFirstTimeCompleting = true;

  @action
  void toggleShoreCompletionStatus() =>
      backToShoreCompleted = !backToShoreCompleted;

  @action
  setMovieMode(HorizonMovieModes newMovieMode) => movieMode = newMovieMode;

  @observable
  bool isComplete = false;

  @observable
  bool movieIsLonger = false;

  animationStatusListener() => reaction((p0) => movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          onAnimationCompleted();
        }
      });

  @action
  onAnimationCompleted() {
    if (movieMode == HorizonMovieModes.backToShore) {
      if (isFirstTimeCompleting) {
        isFirstTimeCompleting = false;
      } else {
        toggleShoreCompletionStatus();
      }
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
      isADuskTime(params);
    } else if (hour >= 6 && hour < 10) {
      isAMorningTime(params);
    } else if (hour >= 10 && hour < 17) {
      isADayTime(params);
    } else {
      isAEveningTime(params);
    }
  }

  @override
  @action
  void isADuskTime(IsATimeMobxParams param) {
    if (param.isAStartingValue) {
      startingGrad = WaterColorsAndStops.schedulingDuskWaterHalfScreen;
      if (param.hour == 5) {
        movieIsLonger = true;
      } else {
        movieIsLonger = false;
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
    } else if (hour >= 6 && hour < 10) {
      initMorningCallback(startingMovieGrad);
      if (startingMovieGrad == WaterColorsAndStops.toTheDepthsWater ||
          startingMovieGrad == WaterColorsAndStops.oceanDiveWater) {
        control = Control.play;
      }
    } else if (hour >= 10 && hour < 17) {
      initDayCallback(startingMovieGrad);
      if (startingMovieGrad == WaterColorsAndStops.toTheDepthsWater ||
          startingMovieGrad == WaterColorsAndStops.oceanDiveWater) {
        control = Control.play;
      }
    } else {
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
    startingGrad = WaterColorsAndStops.schedulingDuskWaterFullScreen;
    endingGrad = WaterColorsAndStops.schedulingDuskWaterHalfScreen;
    setMovie(AnywhereToHorizonWaters.getMovie(
      params,
      startingGrad,
      endingGrad,
    ));
  }

  @override
  @action
  void initMorningCallback(params) {
    startingGrad = WaterColorsAndStops.schedulingMorningWaterFullScreen;
    endingGrad = WaterColorsAndStops.schedulingMorningWaterHalfScreen;
    setMovie(AnywhereToHorizonWaters.getMovie(
      params,
      startingGrad,
      endingGrad,
    ));
  }

  @override
  @action
  void initDayCallback(params) {
    startingGrad = WaterColorsAndStops.schedulingDayWaterFullScreen;
    endingGrad = WaterColorsAndStops.schedulingDayWaterHalfScreen;
    setMovie(AnywhereToHorizonWaters.getMovie(
      params,
      startingGrad,
      endingGrad,
    ));
  }

  @override
  @action
  void initEveningCallback(params) {
    startingGrad = WaterColorsAndStops.schedulingEveningWaterFullScreen;
    endingGrad = WaterColorsAndStops.schedulingEveningWaterHalfScreen;
    setMovie(AnywhereToHorizonWaters.getMovie(
      params,
      startingGrad,
      endingGrad,
    ));
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
    setMovieMode(HorizonMovieModes.backToShorePreReq);
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
  }

  @action
  initBackToShore({required DateTime currentTime}) {
    setMovieMode(HorizonMovieModes.backToShore);
    selectTimeBasedMovie(currentTime, WaterColorsAndStops.oceanDiveWater);
    setControl(Control.playReverseFromEnd);
  }

}
