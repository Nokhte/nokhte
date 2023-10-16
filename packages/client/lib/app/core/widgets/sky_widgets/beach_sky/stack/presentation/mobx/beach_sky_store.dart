// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/utilities/misc_algos.dart';
import 'package:primala/app/core/widgets/sky_widgets/beach_sky/stack/constants/constants.dart';
import 'package:primala/app/core/widgets/sky_widgets/beach_sky/stack/constants/movie/sky_color_transition.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'beach_sky_store.g.dart';

class BeachSkyStore = _BeachSkyStoreBase with _$BeachSkyStore;

abstract class _BeachSkyStoreBase extends Equatable with Store {
  @action
  selectTimeBasedMovie(DateTime date) => MiscAlgos.schedulingExecutor(
        inputDate: date,
        needsHourParam: false,
        needsStartingValueParam: false,
        duskCallback: initDuskCallback,
        morningCallback: initMorningCallback,
        dayCallback: initDayCallback,
        eveningCallback: initEveningCallback,
      );

  @action
  void initDuskCallback() {
    movie = RevealTheSky.getMovie(SkyColors.dusk);
    control = Control.play;
  }

  @action
  void initDayCallback() {
    movie = RevealTheSky.getMovie(SkyColors.day);
    control = Control.play;
  }

  @action
  void initMorningCallback() {
    movie = RevealTheSky.getMovie(SkyColors.morning);
    control = Control.play;
  }

  @action
  void initEveningCallback() {
    movie = RevealTheSky.getMovie(SkyColors.evening);
    control = Control.play;
  }

  @observable
  List<Color> startingGrad = [];
  @observable
  List<Color> endingGrad = [];

  @action
  void isADuskTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = SkyColors.dusk
        : endingGrad = SkyColors.dusk;
  }

  @action
  void isAMorningTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = SkyColors.morning
        : endingGrad = SkyColors.morning;
  }

  @action
  void isADayTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = SkyColors.day
        : endingGrad = SkyColors.day;
  }

  @action
  void isAEveningTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = SkyColors.evening
        : endingGrad = SkyColors.evening;
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
  initForwardShift(DateTime pastTime, DateTime newTime) {
    setStartingGradient(pastTime);
    setEndingGradient(newTime);
    movie = SkyColorTransition.getMovie(startingGrad, endingGrad);
    control = Control.playFromStart;
  }

  @action
  initBackwardsShift(DateTime pastTime, DateTime newTime) {}

  void setControl(Control newControl) => control = newControl;

  @observable
  MovieTween movie = RevealTheSky.getMovie(SkyColors.evening);

  @observable
  Control control = Control.stop;

  @override
  List<Object> get props => [];
}
