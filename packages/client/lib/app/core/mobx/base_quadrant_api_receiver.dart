// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';

import '../modules/gyroscopic/presentation/mobx/api/api.dart';
// * Mobx Codegen Inclusion
part 'base_quadrant_api_receiver.g.dart';

class BaseQuadrantAPIReceiver = _BaseQuadrantAPIReceiverBase
    with _$BaseQuadrantAPIReceiver;

abstract class _BaseQuadrantAPIReceiverBase extends Equatable with Store {
  final QuadrantAPI quadrantAPI;

  _BaseQuadrantAPIReceiverBase({
    required this.quadrantAPI,
  });

  @observable
  int chosenIndex = 0;

  @action
  setChosenIndex(int newInt) => chosenIndex = newInt;

  // I think a coordinator store for the widget
  @observable
  int firstValue = -1;

  @observable
  int secondValue = -1;

  @observable
  int previousValue = -1;

  @computed
  bool get isFirstTime => firstValue == -1;

  @computed
  bool get isSecondTime => secondValue == -1;

  @action
  valueTrackingSetup(int p0) {
    if (isFirstTime) {
      firstValue = p0;
    } else if (isSecondTime) {
      secondValue = p0;
    } else {
      previousValue = firstValue;
      firstValue = secondValue;
      secondValue = p0;
    }
  }

  @override
  List<Object> get props => [];
}
