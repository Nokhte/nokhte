// ignore_for_file: must_be_immutable, library_private_types_in_public_api, missing_override_of_must_be_overridden
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:primala/app/core/mobx/base_scheduling_widget_store.dart';
import 'package:primala/app/core/widgets/sky_widgets/beach_sky/stack/constants/constants.dart';
import 'package:primala/app/core/widgets/sky_widgets/beach_sky/stack/constants/movie/sky_color_transition.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'beach_sky_store.g.dart';

class BeachSkyStore = _BeachSkyStoreBase with _$BeachSkyStore;

abstract class _BeachSkyStoreBase extends BaseSchedulingWidgetStore<Color>
    with Store {
  @override
  @action
  void initDuskCallback() {
    movie = RevealTheSky.getMovie(SkyColors.dusk);
    control = Control.play;
  }

  @override
  @action
  void initDayCallback() {
    movie = RevealTheSky.getMovie(SkyColors.day);
    control = Control.play;
  }

  @override
  @action
  void initMorningCallback() {
    movie = RevealTheSky.getMovie(SkyColors.morning);
    control = Control.play;
  }

  @override
  @action
  void initEveningCallback() {
    movie = RevealTheSky.getMovie(SkyColors.evening);
    control = Control.play;
  }

  @override
  @action
  void isADuskTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = SkyColors.dusk
        : endingGrad = SkyColors.dusk;
  }

  @override
  @action
  void isAMorningTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = SkyColors.morning
        : endingGrad = SkyColors.morning;
  }

  @override
  @action
  void isADayTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = SkyColors.day
        : endingGrad = SkyColors.day;
  }

  @override
  @action
  void isAEveningTime(bool isAStartingValue) {
    isAStartingValue
        ? startingGrad = SkyColors.evening
        : endingGrad = SkyColors.evening;
  }

  @override
  @action
  initForwardShift(DateTime pastTime, DateTime newTime) {
    setStartingGradient(pastTime);
    setEndingGradient(newTime);
    movie = SkyColorTransition.getMovie(startingGrad, endingGrad);
    control = Control.playFromStart;
  }

  @override
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
