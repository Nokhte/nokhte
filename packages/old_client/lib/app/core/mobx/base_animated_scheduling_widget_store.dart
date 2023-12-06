// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
// * Mobx Codegen Inclusion
part 'base_animated_scheduling_widget_store.g.dart';

class BaseAnimatedSchedulingWidgetStore<ArrayType, InitParams,
        IsATimeParams> = _BaseAnimatedSchedulingWidgetStoreBase<ArrayType, InitParams, IsATimeParams>
    with
        _$BaseAnimatedSchedulingWidgetStore<ArrayType, InitParams,
            IsATimeParams>;

abstract class _BaseAnimatedSchedulingWidgetStoreBase<ArrayType, InitParams,
    IsATimeParams> extends BaseCustomAnimatedWidgetStore with Store {
  @observable
  List<ArrayType> startingGrad = [];

  @observable
  List<ArrayType> endingGrad = [];

  @action
  void isADuskTime(IsATimeParams params) {}

  @action
  void isAMorningTime(IsATimeParams params) {}

  @action
  void isADayTime(IsATimeParams params) {}

  @action
  void isAEveningTime(IsATimeParams params) {}

  @action
  void initDuskCallback(InitParams params) {}

  @action
  void initMorningCallback(InitParams params) {}

  @action
  void initDayCallback(InitParams params) {}

  @action
  void initEveningCallback(InitParams params) {}

  @action
  initTimeShift({required DateTime pastTime, required DateTime newTime}) {}

  @override
  List<Object> get props => [];
}
