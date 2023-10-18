// ignore_for_file: must_be_immutable, library_private_types_in_public_api, missing_override_of_must_be_overridden
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/mobx/base_scheduling_widget_store.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/sky_widgets/sun_and_moon/stack/constants/movies/movies.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'sun_and_moon_store.g.dart';

class SunAndMoonStore = _SunAndMoonStoreBase with _$SunAndMoonStore;

abstract class _SunAndMoonStoreBase
    extends BaseSchedulingWidgetStore<Color, int, IsATimeMobxParams>
    with Store {
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
  @action
  void isADuskTime(IsATimeMobxParams param) {
    // hours.isAStartingValue
    if (param.isAStartingValue) {
      startingGrad = MoonColors.colors;
      if (param.hour == 5) {
        queuedUpMovie = QueuedUpMovie.underOver;
      } else {
        queuedUpMovie = QueuedUpMovie.smoothLERP;
      }
    } else {
      endingGrad = MoonColors.colors;
    }
  }

  @override
  @action
  void isAMorningTime(IsATimeMobxParams params) {
    if (params.isAStartingValue) {
      startingGrad = SunColors.morning;
      if (params.hour == 9) {
        queuedUpMovie = QueuedUpMovie.underOver;
      } else {
        queuedUpMovie = QueuedUpMovie.smoothLERP;
      }
    } else {
      endingGrad = SunColors.morning;
    }
  }

  @override
  @action
  void isADayTime(IsATimeMobxParams params) {
    params.isAStartingValue
        ? {
            startingGrad = SunColors.day,
            queuedUpMovie = QueuedUpMovie.smoothLERP
          }
        : endingGrad = SunColors.day;
  }

  @override
  @action
  void isAEveningTime(IsATimeMobxParams params) {
    params.isAStartingValue
        ? {
            startingGrad = SunColors.evening,
            (params.hour == 20)
                ? queuedUpMovie == QueuedUpMovie.underOver
                : queuedUpMovie == QueuedUpMovie.smoothLERP,
          }
        : endingGrad = SunColors.evening;
  }

  // @action
  @override
  initTimeShift(DateTime pastTime, DateTime newTime) {
    setGradient(pastTime, isStart: true);
    setGradient(newTime, isStart: false);
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
      case QueuedUpMovie.smoothLERP:
        movie = SmoothLerpTransition.getMovie(
          startingPosition:
              SunAndMoonPositions.timeMap[pastTime.hour]!.endingPostion,
          endingPosition:
              SunAndMoonPositions.timeMap[newTime.hour]!.endingPostion,
          startingGradient: startingGrad,
          endingGradient: endingGrad,
        );
      default:
        break;
    }
    control = Control.playFromStart;
    queuedUpMovie = QueuedUpMovie.cleared;
  }

  void setControl(Control newControl) => control = newControl;

  @observable
  MovieTween movie = PlaceTheSunOrMoon.getMovie(
    MoonColors.colors,
    SunAndMoonPositions.eightAM,
  );

  @observable
  Control control = Control.stop;

  @override
  List<Object> get props => [];
}
