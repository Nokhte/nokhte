// ignore_for_file: must_be_immutable, library_private_types_in_public_api, missing_override_of_must_be_overridden
// * Mobx Import
import 'dart:async';

import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';
import 'package:nokhte/app/core/modules/gyroscopic/utils/utils.dart';
// * Mobx Codegen Inclusion
part 'quadrant_api.g.dart';

class QuadrantAPI = _QuadrantAPIBase with _$QuadrantAPI;

abstract class _QuadrantAPIBase extends GyroscopeAPI with Store {
  final List<QuadrantInfo> quadrantInfo = [];
  int maxAngle = 345;

  _QuadrantAPIBase({
    required super.angleFeedStore,
    required super.setRefAngleStore,
    required super.resetRefAngle,
  });

  @observable
  late GyroSetupReturnType setupReturnType = const GyroSetupReturnType(
    desiredStartingAngle: 0,
    maxAngle: 0,
    quadrantInfo: [],
    startingRevolution: 0,
  );

  @observable
  int currentValue = 0;

  @observable
  int currentRevolution = 0;

  @observable
  int currentQuadrant = 0;

  @observable
  CloserTo theSideTheThresholdWasEnteredFrom = CloserTo.equidistant;

  @observable
  NegativeModeBehaviors desiredNegativeModeBehavior =
      NegativeModeBehaviors.resetRefAngle;

  @observable
  ObservableList<Threshold> thresholdList = ObservableList<Threshold>();

  @observable
  bool hasBeenMarkedUp = false;

  @action
  setCurrentValue(int newInt) => currentValue = newInt;

  @action
  setCurrentRevolution(int newRev) => currentRevolution = newRev;

  @action
  setCurrentQuadrant(int newQuad) => currentQuadrant = newQuad;

  @action
  setDesiredNegativeModeBehavior(NegativeModeBehaviors newNegBehavior) =>
      desiredNegativeModeBehavior = newNegBehavior;

  @override
  setupTheStream({
    required int startingQuadrant,
    required int numberOfQuadrants,
    required int quadrantSpread,
    required NegativeModeBehaviors negativeModeBehavior,
  }) async {
    await angleFeedStore(NoParams());
    setDesiredNegativeModeBehavior(negativeModeBehavior);

    angleStream = angleFeedStore.userDirection.listen((value) {
      if (isFirstTime) {
        setupReturnType = GyroscopeUtils.quadrantSetup(
          numberOfQuadrants: numberOfQuadrants,
          quadrantSpread: quadrantSpread,
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

    reaction(
      (p0) => thresholdList.toString(),
      (p0) => thresholdModeCallback(),
    );
  }

  @action
  resetTheQuadrantLayout({
    required int startingQuadrant,
    required int numberOfQuadrants,
    required int quadrantSpread,
  }) {
    setupReturnType = GyroscopeUtils.quadrantSetup(
      numberOfQuadrants: numberOfQuadrants,
      quadrantSpread: quadrantSpread,
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

  thresholdModeCallback() {
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
  }

  @override
  negativeModeCallback(int value) {
    switch (desiredNegativeModeBehavior) {
      case NegativeModeBehaviors.resetRefAngle:
        // print("reset ref angle piece");
        int comparison =
            GyroscopeUtils.clockwiseComparison(firstValue, secondValue);
        if (comparison == 1) {
          resetRefAngle(ResetRefAngleForMaxCapacityParams(
              maxAngle: 0, currentValue: value));
          currentMode = GyroscopeModes.regular;
        }
      case NegativeModeBehaviors.indexNegativeQuadrants:
        // print("index negative quadrants piece");
        // print("what's the value for negative is it just zero?? $value");
        final diff = 360 - value;
        if (diff.isNegative || value == 0) {
          currentMode = GyroscopeModes.regular;
          // print("is this the part that isn't working?? $diff");
          return;
        }
        final getCurrQuad = GyroscopeUtils.getCurrentQuadrant(
          currentAngle: diff,
          quadrants: setupReturnType.quadrantInfo,
        );
        int newQuad = (getCurrQuad * -1) - 1;
        // print("diff: $diff | getCurrQuad $getCurrQuad | newQuad $newQuad ");
        if (isEligableForNegativeQuadrantIndexing(value)) {
          setCurrentQuadrant(newQuad);
        }
    }
  }

  maxCapacityCallback(int value) {
    int comparison =
        GyroscopeUtils.clockwiseComparison(firstValue, secondValue);
    if (comparison == 2) {
      resetRefAngle(ResetRefAngleForMaxCapacityParams(
          maxAngle: maxAngle, currentValue: value));
      currentMode = GyroscopeModes.regular;
    }
  }

  @override
  thresholdDetectionCallback(int value) {
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

  @action
  negativeAndRegularModeWatcher(int value) {
    if (currentMode == GyroscopeModes.negative) {
      negativeModeCallback(value);
    } else if (currentMode == GyroscopeModes.atMaxCapacity) {
      maxCapacityCallback(value);
    } else {
      if (isEligableForQuadrantAlteration(value)) {
        setCurrentQuadrant(GyroscopeUtils.getCurrentQuadrant(
          currentAngle: value,
          quadrants: setupReturnType.quadrantInfo,
        ));
      }

      if (isAtMaxCapacity(value)) {
        currentMode = GyroscopeModes.atMaxCapacity;
      }
      thresholdDetectionCallback(value);
    }
  }

  @action
  dispose() async {
    await angleStream.cancel();
  }

  bool isEligableForNegativeQuadrantIndexing(int value) =>
      !isFirstTime &&
      !isSecondTime &&
      value % 360 != 359 &&
      value % 360 != 1 &&
      value % 360 != 0;

  bool isEligableForQuadrantAlteration(int value) =>
      !isFirstTime &&
      !isSecondTime &&
      currentMode != GyroscopeModes.negative &&
      value % 360 != 359 &&
      value % 360 != 1 &&
      value % 360 != 0;

  bool isAtMaxCapacity(int value) =>
      value >= maxAngle && !isANegativeModeMovement && value != 359;

  @computed
  int get lowerThresholdBound => 330 + (currentRevolution * 360);
  @computed
  int get upperThresholdBound => 30 + (currentRevolution * 360);

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
}
