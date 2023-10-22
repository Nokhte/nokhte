// ignore_for_file: must_be_immutable, library_private_types_in_public_api, missing_override_of_must_be_overridden
// * Mobx Import
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'base_scheduling_widget_store.g.dart';

class BaseSchedulingWidgetStore<ArrayType, InitParams,
        IsATimeParams> = _BaseSchedulingWidgetStoreBase<ArrayType, InitParams, IsATimeParams>
    with _$BaseSchedulingWidgetStore<ArrayType, InitParams, IsATimeParams>;

abstract class _BaseSchedulingWidgetStoreBase<ArrayType, InitParams,
    IsATimeParams> extends Equatable with Store {
  @observable
  List<ArrayType> startingGrad = [];

  @observable
  List<ArrayType> endingGrad = [];

  @mustBeOverridden
  @action
  void isADuskTime(IsATimeParams params) {}

  @mustBeOverridden
  @action
  void isAMorningTime(IsATimeParams params) {}

  @mustBeOverridden
  @action
  void isADayTime(IsATimeParams params) {}

  @mustBeOverridden
  @action
  void isAEveningTime(IsATimeParams params) {}

  @mustBeOverridden
  @action
  void initDuskCallback(InitParams params) {}

  @mustBeOverridden
  @action
  void initMorningCallback(InitParams params) {}

  @mustBeOverridden
  @action
  void initDayCallback(InitParams params) {}

  @mustBeOverridden
  @action
  void initEveningCallback(InitParams params) {}

  @mustBeOverridden
  @action
  initTimeShift({required DateTime pastTime, required DateTime newTime}) {}

  @override
  List<Object> get props => [];
}
