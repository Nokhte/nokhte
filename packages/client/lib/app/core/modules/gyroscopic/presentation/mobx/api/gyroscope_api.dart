// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'dart:async';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:primala/app/core/modules/gyroscopic/types/types.dart';
// * Mobx Codegen Inclusion
part 'gyroscope_api.g.dart';

class GyroscopeAPI = _GyroscopeAPIBase with _$GyroscopeAPI;

abstract class _GyroscopeAPIBase extends Equatable with Store {
  final GetDirectionAngleStore angleFeedStore;
  final SetReferenceAngleStore setRefAngleStore;
  final ResetRefAngleForMaxCapacityStore resetRefAngle;

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

  // @mustBeOverridden
  Future<void> setupTheStream({
    required int startingQuadrant,
    required int numberOfQuadrants,
    required int totalAngleCoverageOfEachQuadrant,
    required NegativeModeBehaviors negativeModeBehavior,
  }) async {}

  // @mustBeOverridden
  thresholdDetectionCallback(int value) {}

  @override
  List<Object> get props => [];
}
