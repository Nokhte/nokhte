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
  int refAngle = 0;

  @observable
  int currentRevolution = 1;

  // @observable
  // int currentQuadrant = 1;

  int inflectionPoint = 0;

  int lowerBound = 330;
  int upperBound = 30;

  bool isALowEndRefAngle = false;

  bool isFirstTime = true;
  bool isSecondTime = false;

  @observable
  CloserTo theSideTheThresholdWasEnteredFrom = CloserTo.equidistant;

  @observable
  ObservableList<int> unFilteredAngleList = ObservableList<int>();

  @observable
  ObservableList<Threshold> thresholdList = ObservableList<Threshold>();

  @observable
  ObservableList<int> shortenedAngleList = ObservableList<int>();

  @observable
  ObservableList<int> filteredAngleList = ObservableList<int>();

  @observable
  int firstValue = -1;

  @observable
  int secondValue = -1;

  int previousValue = -10;

  @action
  setRefAngleInfo({required int newRefAngle}) {
    refAngle = newRefAngle;
    inflectionPoint = 360 - refAngle;
    isALowEndRefAngle = refAngle < 180 ? true : false;
  }

  @action
  void addToFilteredAngleList(int newAngle) => shortenedAngleList.add(newAngle);

  screenConstructor() async {
    await gyroscopeStore(NoParams());

    gyroscopeStore.userDirection.listen((value) {
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
      print("THE MODE $currentMode");
      // if (value != previousValue) {}
      if (currentMode == GyroscopeModes.negative) {
        print(
            "we're in negative mode $firstValue, $secondValue ${GyroscopeUtils.clockwiseComparison(firstValue, secondValue)}");
        int comparison =
            GyroscopeUtils.clockwiseComparison(firstValue, secondValue);
        if (comparison == 1) {
          gyroImpl.setReferenceAngle(value);
          currentMode = GyroscopeModes.regular;
          print("OUT OF NEGATIVE MODE $value");
        }
      } else {
        print("STREAM $value");
        final isWithinThreshold = GyroscopeUtils.isInThresholdRange(
          value,
          lowerBound,
          upperBound,
        );
        if (isWithinThreshold.isInRange) {
          thresholdList.add(isWithinThreshold);
        } else if (isWithinThreshold.isInRange == false) {
          thresholdList.clear();
          theSideTheThresholdWasEnteredFrom = CloserTo.initial;
        }
      }
      // can you do it all in here
    });

    reaction((p0) => thresholdList.toString(), (p0) {
      if (thresholdList.isNotEmpty) {
        theSideTheThresholdWasEnteredFrom = thresholdList[0].closerTo;
        if ((theSideTheThresholdWasEnteredFrom == CloserTo.equidistant ||
                theSideTheThresholdWasEnteredFrom == CloserTo.upperBound) &&
            currentRevolution == 1 &&
            thresholdList.last.closerTo == CloserTo.lowerBound) {
          print("NEGATIVE MODE TRIGGERED");
          currentMode = GyroscopeModes.negative;
        }
      }
    });
  }

  @override
  List<Object> get props => [];
}
