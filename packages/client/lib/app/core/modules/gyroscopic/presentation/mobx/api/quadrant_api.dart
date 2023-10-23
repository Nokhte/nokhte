// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'dart:async';

import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:primala/app/core/modules/gyroscopic/types/types.dart';
import 'package:primala/app/core/modules/gyroscopic/utils/utils.dart';
// * Mobx Codegen Inclusion
part 'quadrant_api.g.dart';

class QuadrantAPI = _QuadrantAPIBase with _$QuadrantAPI;

abstract class _QuadrantAPIBase extends Equatable with Store {
  final GetDirectionAngleStore angleFeedStore;
  final SetReferenceAngleStore setRefAngleStore;
  final ResetRefAngleForMaxCapacityStore resetRefAngle;
  final List<QuadrantInfo> quadrantInfo = [];

  @observable
  late GyroSetupReturnType setupReturnType = const GyroSetupReturnType(
    desiredStartingAngle: 0,
    maxAngle: 0,
    quadrantInfo: [],
    startingRevolution: 0,
  );

  @action
  resetTheQuadrantLayout({
    required int startingQuadrant,
    required int numberOfQuadrants,
    required int totalAngleCoverageOfEachQuadrant,
  }) {
    setupReturnType = GyroscopeUtils.quadrantSetup(
      numberOfQuadrants: numberOfQuadrants,
      totalAngleCoverageOfEachQuadrant: totalAngleCoverageOfEachQuadrant,
      startingQuadrant: startingQuadrant,
    );
    setCurrentRevolution(setupReturnType.startingRevolution);
    maxAngle = setupReturnType.maxAngle;
    final startingAngle = (setupReturnType.desiredStartingAngle % 360).floor();
    resetRefAngle(ResetRefAngleForMaxCapacityParams(
      currentValue: firstValue,
      maxAngle: startingAngle,
    ));
    setCurrentQuadrant(startingQuadrant);
  }

  late StreamSubscription<int> angleStream;
  _QuadrantAPIBase({
    required this.angleFeedStore,
    required this.setRefAngleStore,
    required this.resetRefAngle,
  });

  setupTheStream({
    required int startingQuadrant,
    required int numberOfQuadrants,
    required int totalAngleCoverageOfEachQuadrant,
  }) async {
    await angleFeedStore(NoParams());

    angleStream = angleFeedStore.userDirection.listen((value) {
      if (isFirstTime) {
        setupReturnType = GyroscopeUtils.quadrantSetup(
          numberOfQuadrants: numberOfQuadrants,
          totalAngleCoverageOfEachQuadrant: totalAngleCoverageOfEachQuadrant,
          startingQuadrant: startingQuadrant,
        );
        setCurrentRevolution(setupReturnType.startingRevolution);
        maxAngle = setupReturnType.maxAngle;
        if (setupReturnType.desiredStartingAngle != 0) {
          resetRefAngle(ResetRefAngleForMaxCapacityParams(
            currentValue: value,
            maxAngle: setupReturnType.desiredStartingAngle,
          ));
        }
        setCurrentQuadrant(startingQuadrant);
      }
      int currentValue = value;
      currentRevolution > 0
          ? currentValue = value + (360 * currentRevolution)
          : null;

      valueTrackingSetup(currentValue);
      negativeAndRegularModeWatcher(currentValue);
    });

    reaction((p0) => thresholdList.toString(), (p0) {
      if (thresholdList.isNotEmpty) {
        theSideTheThresholdWasEnteredFrom = thresholdList[0].closerTo;
        if (isANegativeModeMovement) {
          currentMode = GyroscopeModes.negative;
        } else if (isAPositiveRevolutionMovement) {
          if (!hasBeenMarkedUp) {
            setCurrentRevolution(currentRevolution + 1);
            hasBeenMarkedUp = true;
          }
        } else if (isANegativeRevolutionMovement) {
          if (!hasBeenMarkedUp) {
            currentMode = GyroscopeModes.markdown;
            setCurrentRevolution(currentRevolution - 1);
            hasBeenMarkedUp = true;
          }
        }
      }
    });
  }

  @action
  negativeAndRegularModeWatcher(int value) {
    if (currentMode == GyroscopeModes.negative) {
      int comparison =
          GyroscopeUtils.clockwiseComparison(firstValue, secondValue);
      if (comparison == 1) {
        resetRefAngle(ResetRefAngleForMaxCapacityParams(
            maxAngle: 0, currentValue: value));
        currentMode = GyroscopeModes.regular;
      }
    } else if (currentMode == GyroscopeModes.atMaxCapacity) {
      int comparison =
          GyroscopeUtils.clockwiseComparison(firstValue, secondValue);
      if (comparison == 2) {
        resetRefAngle(ResetRefAngleForMaxCapacityParams(
            maxAngle: maxAngle, currentValue: value));
        currentMode = GyroscopeModes.regular;
      }
    } else {
      if (!isFirstTime &&
          !isSecondTime &&
          currentMode != GyroscopeModes.negative &&
          value % 360 != 359 &&
          value % 360 != 1 &&
          value % 360 != 0) {
        setCurrentQuadrant(GyroscopeUtils.getCurrentQuadrant(
          currentAngle: value,
          quadrants: setupReturnType.quadrantInfo,
        ));
      }

      if (value >= maxAngle && !isANegativeModeMovement && value != 359) {
        currentMode = GyroscopeModes.atMaxCapacity;
      }
      final isWithinRevolutionThreshold = GyroscopeUtils.isInThresholdRange(
        value,
        lowerThresholdBound,
        upperThresholdBound,
      );
      if (isWithinRevolutionThreshold.isInRange) {
        thresholdList.add(isWithinRevolutionThreshold);
      } else if (isWithinRevolutionThreshold.isInRange == false) {
        thresholdList.clear();
        hasBeenMarkedUp = false;
        theSideTheThresholdWasEnteredFrom = CloserTo.initial;
        if (currentMode == GyroscopeModes.markdown) {
          currentMode = GyroscopeModes.regular;
        }
      }
    }
  }

  @action
  dispose() async {
    await angleStream.cancel();
  }

  @action
  valueTrackingSetup(int value) {
    if (isFirstTime) {
      firstValue = value;
    } else if (secondValue == -1) {
      secondValue = value;
    } else {
      previousValue = firstValue;
      firstValue = secondValue;
      secondValue = value;
    }
  }

  @observable
  int currentValue = 0;

  @action
  setCurrentValue(int newInt) => currentValue = newInt;

  @observable
  GyroscopeModes currentMode = GyroscopeModes.regular;

  @computed
  bool get isSecondTime => secondValue == -1;

  @observable
  int currentRevolution = 0;

  @action
  setCurrentRevolution(int newRev) => currentRevolution = newRev;

  @observable
  int currentQuadrant = 0;

  @action
  void setCurrentQuadrant(int newQuad) => currentQuadrant = newQuad;

  @observable
  CloserTo theSideTheThresholdWasEnteredFrom = CloserTo.equidistant;

  @observable
  ObservableList<Threshold> thresholdList = ObservableList<Threshold>();

  @observable
  int firstValue = -1;

  @observable
  bool hasBeenMarkedUp = false;

  @observable
  int secondValue = -1;

  int previousValue = -10;

  int maxAngle = 345;

  @computed
  int get lowerThresholdBound => 330 + (currentRevolution * 360);
  @computed
  int get upperThresholdBound => 30 + (currentRevolution * 360);

  @computed
  bool get isFirstTime => firstValue == -1;

  @computed
  bool get isANegativeModeMovement =>
      (theSideTheThresholdWasEnteredFrom == CloserTo.equidistant ||
          theSideTheThresholdWasEnteredFrom == CloserTo.upperBound) &&
      currentRevolution == 0 &&
      thresholdList.last.closerTo == CloserTo.lowerBound &&
      currentMode != GyroscopeModes.markdown;

  @computed
  bool get isAPositiveRevolutionMovement =>
      (theSideTheThresholdWasEnteredFrom == CloserTo.lowerBound) &&
      thresholdList.last.closerTo == CloserTo.upperBound &&
      currentMode != GyroscopeModes.atMaxCapacity;

  @computed
  bool get isANegativeRevolutionMovement =>
      (theSideTheThresholdWasEnteredFrom == CloserTo.upperBound) &&
      thresholdList.last.closerTo == CloserTo.lowerBound &&
      currentRevolution > 0;

  @computed
  bool get isAtMaxCapacity => firstValue >= maxAngle;

  @override
  List<Object> get props => [];
}
