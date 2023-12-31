// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';
part 'gyroscope_api.g.dart';

class GyroscopeAPI = _GyroscopeAPIBase with _$GyroscopeAPI;

abstract class _GyroscopeAPIBase extends Equatable with Store {
  final GetDirectionAngleStore angleFeedStore;
  final SetReferenceAngleStore setRefAngleStore;
  final ResetRefAngleStore resetRefAngle;

  late StreamSubscription<int> angleStream;

  _GyroscopeAPIBase({
    required this.angleFeedStore,
    required this.setRefAngleStore,
    required this.resetRefAngle,
  });

  negativeModeCallback(int value) {}

  @observable
  int firstValue = -1;

  @observable
  int secondValue = -1;

  int previousValue = -10;

  @computed
  bool get isFirstTime => firstValue == -1;

  @computed
  bool get isSecondTime => secondValue == -1;

  @observable
  GyroscopeModes currentMode = GyroscopeModes.regular;

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

  Future<void> setupTheStream({
    required int startingQuadrant,
    required int numberOfQuadrants,
    required int quadrantSpread,
    required NegativeModeBehaviors negativeModeBehavior,
  }) async {}

  thresholdDetectionCallback(int value) {}

  @override
  List<Object> get props => [];
}
