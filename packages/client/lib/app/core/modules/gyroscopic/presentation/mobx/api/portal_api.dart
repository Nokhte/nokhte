// ignore_for_file: must_be_immutable, library_private_types_in_public_api, missing_override_of_must_be_overridden
// * Mobx Import
import 'package:mobx/mobx.dart';
import 'package:primala/app/core/interfaces/logic.dart';
// * Equatable Import
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:primala/app/core/modules/gyroscopic/types/types.dart';
import 'package:primala/app/core/modules/gyroscopic/utils/utils.dart';
// * Mobx Codegen Inclusion
part 'portal_api.g.dart';

class PortalAPI = _PortalAPIBase with _$PortalAPI;

abstract class _PortalAPIBase extends GyroscopeAPI with Store {
  _PortalAPIBase({
    required super.angleFeedStore,
    required super.setRefAngleStore,
    required super.resetRefAngle,
  });

  @observable
  DrawingModes drawingMode = DrawingModes.isNotDrawing;

  @override
  setupTheStream({
    required int startingQuadrant,
    required int numberOfQuadrants,
    required int totalAngleCoverageOfEachQuadrant,
    required NegativeModeBehaviors negativeModeBehavior,
  }) async {
    await angleFeedStore(NoParams());

    angleStream = angleFeedStore.userDirection.listen((value) {
      print("here's the value $value");
      valueTrackingSetup(value);
      negativeAndRegularModeWatcher(value);
      // if (isFirstTime) {
      // }
    });

    // reaction(
    //   (p0) => thresholdList.toString(),
    //   (p0) => thresholdModeCallback(),
    // );
  }

  @action
  negativeAndRegularModeWatcher(int value) {
    if (currentMode == GyroscopeModes.negative) {
      // negativeModeCallback(value);
    } else {
      // if (isEligableForQuadrantAlteration(value)) {
      //   setCurrentQuadrant(GyroscopeUtils.getCurrentQuadrant(
      //     currentAngle: value,
      //     quadrants: setupReturnType.quadrantInfo,
      //   ));
      // }

      // if (isAtMaxCapacity(value)) {
      //   currentMode = GyroscopeModes.atMaxCapacity;
      // }
      thresholdDetectionCallback(value);
    }
  }

  @override
  negativeModeCallback(int value) {
    // i'm trying to think about what you want here, what you want is that
    // when they are in negative mode what you want to check for is if
    // they went beyond 3 quadrants or whatever the equivalent is in degrees
    int comparison =
        GyroscopeUtils.clockwiseComparison(firstValue, secondValue);
    if (comparison == 1) // 1 is greater
    {
      // if they have made a clockwiseMovement
      // resetRefAngle(
      //     ResetRefAngleForMaxCapacityParams(maxAngle: 0, currentValue: value));
      // currentMode = GyroscopeModes.regular;
    }
    // some logic here, you want conversion to negative values
  }

  @override
  thresholdDetectionCallback(int value) {
    int upperBoundComparison =
        GyroscopeUtils.clockwiseComparison(value, upperThresholdBound);

    int lowerBoundComparison =
        GyroscopeUtils.clockwiseComparison(value, lowerThresholdBound);

    if (upperBoundComparison == 2) {
      print("you are above the upper threshold");
    } else if (lowerBoundComparison == 1) {
      print("you are below the lower threshold");
    } else {
      print("you are in neither situation");
    }
    // return super.thresholdDetectionCallback(value);
  }

  @observable
  int lowerThresholdBound = 330;

  @observable
  int upperThresholdBound = 30;

  @action
  setLowerThresholdBound(int value) => lowerThresholdBound = value;

  @action
  setUpperThresholdBound(int value) => upperThresholdBound = value;
  // so we have these which are interesting ideas which are the upper and lower
  // bound thresholds, so one thing is that we're looking for if they go beyond
  // these values not if they are within them if that makes sense.
  // so upper bound threshold would really be more of a minimum so
}
