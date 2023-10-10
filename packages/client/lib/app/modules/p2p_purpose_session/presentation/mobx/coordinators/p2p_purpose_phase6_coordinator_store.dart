// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/mobx/main/get_direction_angle_store.dart';
import 'package:primala/app/core/modules/gyroscopic/utils/utils.dart';
import 'dart:convert';
// import 'package:permission_handler/permission_handler.dart';
import 'package:primala/app/core/widgets/widgets.dart';

import '../../../../../core/modules/gyroscopic/types/types.dart';
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

  @action
  setRefAngleInfo({required int newRefAngle}) {
    refAngle = newRefAngle;
    inflectionPoint = 360 - refAngle;
    isALowEndRefAngle = refAngle < 180 ? true : false;
    // lowerBound = (refAngle - 30) % 360;
    // upperBound = (refAngle + 30) % 360;
    // print(
    //     "INFO: refAngle: $refAngle inflection $inflectionPoint isLowEnd $isALowEndRefAngle upperBound $upperBound lowerBound $lowerBound");
  }

  @action
  void addToFilteredAngleList(int newAngle) => shortenedAngleList.add(newAngle);

  screenConstructor() async {
    await gyroscopeStore(NoParams());
    // final unfilteredList = [];

    gyroscopeStore.userDirection.listen((value) {
      // setDirection(value);
      unFilteredAngleList.add(value);
      shortenedAngleList.clear();

      // print("What's the first value? ${unFilteredAngleList[0]}");
      if (isFirstTime) {
        isFirstTime = false;
        setRefAngleInfo(newRefAngle: unFilteredAngleList[0]);
      }
      // filteredAngle Logic
      for (int i = 0; i < unFilteredAngleList.length; i++) {
        // print(
        //     "huh what is this? REF ANGLE $refAngle UNFIL last ${unFilteredAngleList[i]} ${unFilteredAngleList[i] - refAngle}");
        shortenedAngleList.add(unFilteredAngleList[i] - refAngle);
        GyroscopeUtils.removeDuplicates(shortenedAngleList);
      }
      // print(
      //     'REFERENCE ANGLE: $refAngle || unfiltered ${shortenedAngleList.last.toString()}');
    });

    // filtration reaction
    reaction((p0) => shortenedAngleList.toString(), (p0) {
      // print("SHORTENED ${shortenedAngleList.last}");
      if (currentMode == GyroscopeModes.negative) {
        final last = unFilteredAngleList.last;
        final secondToLast =
            unFilteredAngleList[unFilteredAngleList.length - 2];
        GyroscopeUtils.clockwiseComparison(last, secondToLast) == 2
            ? {
                currentMode = GyroscopeModes.regular,
                print("negative mode actually left"),
              }
            : {
                setRefAngleInfo(newRefAngle: unFilteredAngleList.last),
                filteredAngleList.add(unFilteredAngleList.last - refAngle),
                print("perpetuating negative mode"),
              };
        return;
      }
      if (currentRevolution == 1 &&
          isALowEndRefAngle &&
          currentMode == GyroscopeModes.regular) {
        if (shortenedAngleList.last.isNegative &&
            shortenedAngleList.last < inflectionPoint) {
          // this is correct if they are going clockwise before they hit revolution 2
          filteredAngleList
              .add(shortenedAngleList.last + refAngle + inflectionPoint);
          print(filteredAngleList.last.toString());
          return;
        } else {
          // this is correct if they are going clockwise before they hit revolution 2
          filteredAngleList.add(shortenedAngleList.last);
          print(filteredAngleList.last.toString());
          return;
        }
      } else if (currentRevolution == 1 &&
          !isALowEndRefAngle &&
          currentMode == GyroscopeModes.regular) {
        if (shortenedAngleList.last.isNegative) {
          filteredAngleList
              .add(shortenedAngleList.last + refAngle + inflectionPoint);
          print(filteredAngleList.last.toString());
          return;
        } else {
          filteredAngleList.add(shortenedAngleList.last);
          print(filteredAngleList.last.toString());
          return;
        }
      }
    });

    reaction((p0) => filteredAngleList.toString(), (p0) {
      final isWithinThreshold = GyroscopeUtils.isInThresholdRange(
        filteredAngleList.last,
        lowerBound,
        upperBound,
      );
      if (isWithinThreshold.isInRange) {
        thresholdList.add(isWithinThreshold);
        return;
      } else if (isWithinThreshold.isInRange == false) {
        thresholdList.clear();
        theSideTheThresholdWasEnteredFrom = CloserTo.initial;
        return;
      }
    });

    reaction((p0) => thresholdList.toString(), (p0) {
      if (thresholdList.isNotEmpty) {
        theSideTheThresholdWasEnteredFrom = thresholdList[0].closerTo;
        // print(
        //     "the side that was entered from $theSideTheThresholdWasEnteredFrom");
        if ((theSideTheThresholdWasEnteredFrom == CloserTo.equidistant ||
                theSideTheThresholdWasEnteredFrom == CloserTo.upperBound) &&
            currentRevolution == 1 &&
            thresholdList.last.closerTo == CloserTo.lowerBound) {
          print("NEGATIVE MODE TRIGGERED");
          currentMode = GyroscopeModes.negative;
          //
        }
      }
    });
  }

  // @action
  // setDirection(int newValue) {
  //   direction = newValue;
  // }

  _P2PPurposePhase6CoordinatorStoreBase({
    required this.beachWaves,
    required this.gyroscopeStore,
    required this.beachSkyStore,
    required this.sunAndMoon,
  });

  @override
  List<Object> get props => [];
}
