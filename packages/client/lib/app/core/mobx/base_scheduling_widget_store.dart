// ignore_for_file: must_be_immutable, library_private_types_in_public_api, missing_override_of_must_be_overridden
// * Mobx Import
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/utilities/utilities.dart';
// * Mobx Codegen Inclusion
part 'base_scheduling_widget_store.g.dart';

class BaseSchedulingWidgetStore<T> = _BaseSchedulingWidgetStoreBase<T>
    with _$BaseSchedulingWidgetStore<T>;

abstract class _BaseSchedulingWidgetStoreBase<T> extends Equatable with Store {
  @mustBeOverridden
  @observable
  List<T> startingGrad = [];

  @mustBeOverridden
  @observable
  List<T> endingGrad = [];

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

  @mustBeOverridden
  @action
  void isADuskTime(bool isAStartingValue) {}

  @mustBeOverridden
  @action
  void isAMorningTime(bool isAStartingValue) {}

  @mustBeOverridden
  @action
  void isADayTime(bool isAStartingValue) {}

  @mustBeOverridden
  @action
  void isAEveningTime(bool isAStartingValue) {}

  @mustBeOverridden
  @action
  void initDuskCallback() {
    // Branch 1: Time is between 9 PM and 5:59 AM
  }

  @mustBeOverridden
  @action
  void initMorningCallback() {
    // Branch 2: Time is between 6 AM and 9:59 AM
  }

  @mustBeOverridden
  @action
  void initDayCallback() {
    // Branch 3: Time is between 10 AM and 4:59 PM
  }

  @mustBeOverridden
  @action
  void initEveningCallback() {
    // Branch 4: Time is between 5 PM and 8:59 PM
  }

  @mustBeOverridden
  @action
  initForwardShift(DateTime pastTime, DateTime newTime) {}

  @mustBeOverridden
  @action
  initBackwardsShift(DateTime pastTime, DateTime newTime) {}

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

  @override
  List<Object> get props => [];
}
