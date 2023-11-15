// ignore_for_file: must_be_immutable, library_private_types_in_public_api, missing_override_of_must_be_overridden
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_scheduling_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/sky_widgets/beach_sky/stack/constants/constants.dart';
import 'package:simple_animations/simple_animations.dart';
part 'beach_sky_store.g.dart';

class BeachSkyStore = _BeachSkyStoreBase with _$BeachSkyStore;

abstract class _BeachSkyStoreBase
    extends BaseSchedulingWidgetStore<Color, NoParams, IsATimeMobxParams>
    with Store {
  bool isGoingToFullSky;

  _BeachSkyStoreBase({
    required this.isGoingToFullSky,
  });

  @observable
  bool isFirstTimeCompleting = true;

  @observable
  List<Color> currentGrad = [];

  @action
  setCurrentGrad(List<Color> newGrad) => currentGrad = newGrad;

  @observable
  bool movieIsLonger = false;

  @action
  onAnimationComplete() {
    if (isGoingToFullSky && isFirstTimeCompleting) {
      movie = HalfToFullSky.getMovie(currentGrad);
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

  @action
  selectTimeBasedMovie(DateTime date) {
    final hour = date.hour;
    if (hour >= 21 || hour < 6) {
      initDuskCallback(NoParams());
    } else if (hour >= 6 && hour < 10) {
      initMorningCallback(NoParams());
    } else if (hour >= 10 && hour < 17) {
      initDayCallback(NoParams());
    } else {
      initEveningCallback(NoParams());
    }
  }

  @override
  @action
  void initDuskCallback(params) {
    currentGrad = SkyColors.dusk;
    movie = RevealTheSky.getMovie(SkyColors.dusk);
    control = Control.play;
  }

  @override
  @action
  void initDayCallback(NoParams params) {
    currentGrad = SkyColors.day;
    movie = RevealTheSky.getMovie(SkyColors.day);
    control = Control.play;
  }

  @override
  @action
  void initMorningCallback(NoParams params) {
    currentGrad = SkyColors.morning;
    movie = RevealTheSky.getMovie(SkyColors.morning);
    control = Control.play;
  }

  @override
  @action
  void initEveningCallback(NoParams params) {
    currentGrad = SkyColors.evening;
    movie = RevealTheSky.getMovie(SkyColors.evening);
    control = Control.play;
  }

  @override
  @action
  void isADuskTime(IsATimeMobxParams param) {
    if (param.isAStartingValue) {
      startingGrad = SkyColors.dusk;
      if (param.hour == 5) {
        movieIsLonger = true;
      } else {
        movieIsLonger = false;
      }
    } else {
      endingGrad = SkyColors.dusk;
    }
  }

  @override
  @action
  void isAMorningTime(IsATimeMobxParams params) {
    if (params.isAStartingValue) {
      startingGrad = SkyColors.morning;
      if (params.hour == 9) {
        movieIsLonger = true;
      } else {
        movieIsLonger = false;
      }
    } else {
      endingGrad = SkyColors.morning;
    }
  }

  @override
  @action
  void isADayTime(IsATimeMobxParams params) {
    if (params.isAStartingValue) {
      startingGrad = SkyColors.day;
      movieIsLonger = false;
    } else {
      endingGrad = SkyColors.day;
    }
  }

  @override
  @action
  void isAEveningTime(IsATimeMobxParams params) {
    if (params.isAStartingValue) {
      startingGrad = SkyColors.evening;
      if (params.hour == 20) {
        movieIsLonger = true;
      } else {
        movieIsLonger = false;
      }
    } else {
      endingGrad = SkyColors.evening;
    }
  }

  @action
  @override
  initTimeShift({required DateTime pastTime, required DateTime newTime}) {
    setGradient(pastTime, isStart: true);
    setGradient(newTime, isStart: false);
    movie = SkyColorTransition.getMovie(
      startingGrad,
      endingGrad,
      movieIsLonger,
    );
    control = Control.playFromStart;
  }

  void setControl(Control newControl) => control = newControl;

  @observable
  MovieTween movie = RevealTheSky.getMovie(SkyColors.evening);

  @observable
  Control control = Control.stop;

  @override
  List<Object> get props => [];
}
