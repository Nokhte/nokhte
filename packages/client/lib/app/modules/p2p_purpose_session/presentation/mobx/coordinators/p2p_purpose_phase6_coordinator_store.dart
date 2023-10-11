// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/gyroscopic/data/sources/gyroscopic_remote_source.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/mobx/main/get_direction_angle_store.dart';
import 'package:primala/app/core/modules/gyroscopic/types/types.dart';
import 'package:primala/app/core/modules/gyroscopic/utils/utils.dart';
import 'package:primala/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase6_coordinator_store.g.dart';

class P2PPurposePhase6CoordinatorStore = _P2PPurposePhase6CoordinatorStoreBase
    with _$P2PPurposePhase6CoordinatorStore;

abstract class _P2PPurposePhase6CoordinatorStoreBase extends Equatable
    with Store {
  final SunAndMoonStore sunAndMoon;
  final BeachHorizonTrackerStore beachWaves;
  final GetDirectionAngleStore gyroscopeStore;
  final BeachSkyStore beachSkyStore;
  final GyroscopicRemoteSourceImpl gyroImpl;

  _P2PPurposePhase6CoordinatorStoreBase({
    required this.beachWaves,
    required this.gyroscopeStore,
    required this.beachSkyStore,
    required this.sunAndMoon,
    required this.gyroImpl,
  });

  // @observable
  // int direction = -10;

  @observable
  GyroscopeModes currentMode = GyroscopeModes.regular;

  @observable
  int currentRevolution = 0;

  // @observable
  // int currentQuadrant = 1;

  int inflectionPoint = 0;

  @computed
  int get lowerBound => 330 + (currentRevolution * 360);
  @computed
  int get upperBound => 30 + (currentRevolution * 360);

  bool isALowEndRefAngle = false;

  bool isFirstTime = true;
  bool isSecondTime = false;

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

  screenConstructor() async {
    await gyroscopeStore(NoParams());

    gyroscopeStore.userDirection.listen((value) {
      // value = value;
      // setup
      if (firstValue == -1) {
        // Set the first value
        firstValue = value;
      } else if (secondValue == -1) {
        // Set the second value
        secondValue = value;
      } else {
        // If both firstValue and secondValue have been set, update previousValue
        previousValue = firstValue;
        firstValue = secondValue;
        secondValue = value;
      }
      // print("val $value prev $previousValue ");
      // print("THE MODE $currentMode");
      // if (value != previousValue) {}
      if (currentMode == GyroscopeModes.negative) {
        print(
            "we're in negative mode $firstValue, $secondValue ${GyroscopeUtils.clockwiseComparison(firstValue, secondValue)}");
        int comparison =
            GyroscopeUtils.clockwiseComparison(firstValue, secondValue);
        if (comparison == 1) {
          gyroImpl.setReferenceAngle(value);
          currentMode = GyroscopeModes.regular;
          // print("OUT OF NEGATIVE MODE $value");
        }
      } else {
        currentRevolution > 0
            ? value = value + (360 * currentRevolution)
            : null;
        print("value $value");
        // print("STREAM $value");
        final isWithinThreshold = GyroscopeUtils.isInThresholdRange(
          value,
          lowerBound,
          upperBound,
        );
        if (isWithinThreshold.isInRange) {
          thresholdList.add(isWithinThreshold);
        } else if (isWithinThreshold.isInRange == false) {
          thresholdList.clear();
          hasBeenMarkedUp = false;
          theSideTheThresholdWasEnteredFrom = CloserTo.initial;
          if (currentMode == GyroscopeModes.markdown) {
            currentMode = GyroscopeModes.regular;
          }
        }
      }
      // can you do it all in here
    });

    reaction((p0) => thresholdList.toString(), (p0) {
      if (thresholdList.isNotEmpty) {
        theSideTheThresholdWasEnteredFrom = thresholdList[0].closerTo;
        if ((theSideTheThresholdWasEnteredFrom == CloserTo.equidistant ||
                theSideTheThresholdWasEnteredFrom == CloserTo.upperBound) &&
            currentRevolution == 0 &&
            thresholdList.last.closerTo == CloserTo.lowerBound &&
            currentMode != GyroscopeModes.markdown) {
          print("NEGATIVE MODE TRIGGERED");
          currentMode = GyroscopeModes.negative;
        } else if ((theSideTheThresholdWasEnteredFrom == CloserTo.lowerBound) &&
            thresholdList.last.closerTo == CloserTo.upperBound) {
          if (!hasBeenMarkedUp) {
            print("positive revolution!!");
            currentRevolution++;
            hasBeenMarkedUp = true;
          }
        } else if ((theSideTheThresholdWasEnteredFrom == CloserTo.upperBound) &&
            thresholdList.last.closerTo == CloserTo.lowerBound &&
            currentRevolution > 0) {
          if (!hasBeenMarkedUp) {
            print("negative revolution!!");
            currentMode = GyroscopeModes.markdown;
            currentRevolution--;
            hasBeenMarkedUp = true;
          }
          //
        }
        // now we want
      }
    });
  }

  @override
  List<Object> get props => [];
}
