// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'gyroscope_api.g.dart';

class GyroscopeAPI = _GyroscopeAPIBase with _$GyroscopeAPI;

abstract class _GyroscopeAPIBase extends Equatable with Store {
  @observable
  int firstValue = -1;

  @observable
  int secondValue = -1;

  int previousValue = -10;

  @computed
  bool get isFirstTime => firstValue == -1;

  @computed
  bool get isSecondTime => secondValue == -1;

  @action
  valueTrackingSetup(int value) {
    if (isFirstTime) {
      firstValue = value;
    } else if (isSecondTime) {
      secondValue = value;
    } else {
      previousValue = firstValue;
      firstValue = secondValue;
      secondValue = value;
    }
  }

  @override
  List<Object> get props => [];
}
