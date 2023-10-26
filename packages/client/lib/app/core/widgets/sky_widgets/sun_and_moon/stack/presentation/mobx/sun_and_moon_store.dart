// ignore_for_file: must_be_immutable, library_private_types_in_public_api, missing_override_of_must_be_overridden
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_scheduling_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/sky_widgets/sun_and_moon/stack/constants/movies/movies.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'sun_and_moon_store.g.dart';

class SunAndMoonStore = _SunAndMoonStoreBase with _$SunAndMoonStore;

abstract class _SunAndMoonStoreBase
    extends BaseSchedulingWidgetStore<Color, int, IsATimeMobxParams>
    with Store {
  @action
  setStartingGrad(List<Color> newColors) => startingGrad = newColors;

  @action
  setEndingGrad(List<Color> newColors) => endingGrad = newColors;

  @action
  setQueuedMovie(QueuedUpMovie newMovie) => queuedUpMovie = newMovie;

  @observable
  bool isTheMoon = false;

  @observable
  QueuedUpMovie queuedUpMovie = QueuedUpMovie.cleared;

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
    // hours.isAStartingValue
    if (param.isAStartingValue) {
      setStartingGrad(MoonColors.colors);
      if (param.hour == 5) {
        setQueuedMovie(QueuedUpMovie.underOver);
      } else {
        setQueuedMovie(QueuedUpMovie.smoothLERP);
      }
    } else {
      setEndingGrad(MoonColors.colors);
    }
  }

  @override
  @action
  void isAMorningTime(IsATimeMobxParams params) {
    if (params.isAStartingValue) {
      setStartingGrad(SunColors.morning);
      setQueuedMovie(QueuedUpMovie.smoothLERP);
      // if (params.hour == 9) {
      // setQueuedMovie(QueuedUpMovie.underOver);
      // } else {
      // }
    } else {
      setEndingGrad(SunColors.morning);
    }
  }

  @override
  @action
  void isADayTime(IsATimeMobxParams params) {
    params.isAStartingValue
        ? {
            setStartingGrad(SunColors.day),
            setQueuedMovie(QueuedUpMovie.smoothLERP)
          }
        : setEndingGrad(SunColors.day);
  }

  @override
  @action
  void isAEveningTime(IsATimeMobxParams params) {
    params.isAStartingValue
        ? {
            setStartingGrad(SunColors.evening),
            (params.hour == 20)
                ? setQueuedMovie(QueuedUpMovie.underOver)
                : setQueuedMovie(QueuedUpMovie.smoothLERP),
          }
        : setEndingGrad(SunColors.evening);
  }

  @action
  @override
  initTimeShift({required DateTime pastTime, required DateTime newTime}) {
    setGradient(pastTime, isStart: true);
    setGradient(newTime, isStart: false);
    // print("hey what's the queued up move $queuedUpMovie ???");
    switch (queuedUpMovie) {
      case QueuedUpMovie.underOver:
        movie = UnderOver.getMovie(
          startingPosition:
              SunAndMoonPositions.timeMap[pastTime.hour]!.endingPostion,
          endingPosition:
              SunAndMoonPositions.timeMap[newTime.hour]!.endingPostion,
          startingGradient: startingGrad,
          endingGradient: endingGrad,
        );
        control = Control.playFromStart;
        queuedUpMovie = QueuedUpMovie.cleared;
      case QueuedUpMovie.smoothLERP:
        movie = SmoothLerpTransition.getMovie(
          startingPosition:
              SunAndMoonPositions.timeMap[pastTime.hour]!.endingPostion,
          endingPosition:
              SunAndMoonPositions.timeMap[newTime.hour]!.endingPostion,
          startingGradient: startingGrad,
          endingGradient: endingGrad,
        );
        control = Control.playFromStart;
        queuedUpMovie = QueuedUpMovie.cleared;
      default:
        // print("is this s**** breaking????");
        break;
    }
  }

  void setControl(Control newControl) => control = newControl;

  @observable
  MovieTween movie = PlaceTheSunOrMoon.getMovie(
    MoonColors.colors,
    SunAndMoonPositions.eightAM,
  );

  @observable
  Control control = Control.stop;

  @action
  selectTimeBasedMovie(DateTime date) {
    final hour = date.hour;
    if (hour >= 21 || hour < 6) {
      initDuskCallback(hour);
      // Branch 1: Time is between 9 PM and 5:59 AM
    } else if (hour >= 6 && hour < 10) {
      // Branch 2: Time is between 6 AM and 9:59 AM
      initMorningCallback(hour);
    } else if (hour >= 10 && hour < 17) {
      // Branch 3: Time is between 10 AM and 4:59 PM
      initDayCallback(hour);
    } else {
      // Branch 4: Time is between 5 PM and 8:59 PM
      initEveningCallback(hour);
    }
  }

  @override
  @action
  void initDuskCallback(int hours) {
    movie = PlaceTheSunOrMoon.getMovie(
        MoonColors.colors, SunAndMoonPositions.timeMap[hours]!);
    isTheMoon = true;
    control = Control.play;
  }

  @override
  @action
  void initMorningCallback(int hours) {
    movie = PlaceTheSunOrMoon.getMovie(
        SunColors.morning, SunAndMoonPositions.timeMap[hours]!);
    control = Control.play;
  }

  @override
  @action
  void initDayCallback(int hours) {
    movie = PlaceTheSunOrMoon.getMovie(
        SunColors.day, SunAndMoonPositions.timeMap[hours]!);
    control = Control.play;
  }

  @override
  @action
  void initEveningCallback(int hours) {
    movie = PlaceTheSunOrMoon.getMovie(
        SunColors.evening, SunAndMoonPositions.timeMap[hours]!);
    control = Control.play;
  }

  @override
  List<Object> get props => [];
}
