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

  @observable
  int direction = -10;

  @observable
  int refAngle = 0;

  @observable
  @observable
  int currentRevolution = 1;

  @observable
  int currentQuadrant = 1;

  int inflectionPoint = 0;

  bool isALowEndRefAngle = false;

  @observable
  CloserTo theSideTheThresholdWasEnteredFrom = CloserTo.initial;

  @observable
  ObservableList<Threshold> thresholdList = ObservableList<Threshold>();

  @observable
  ObservableList<int> shortenedAngleList = ObservableList<int>();

  @observable
  ObservableList<int> filteredAngleList = ObservableList<int>();

  @action
  setRefAngle(int newAngle) {
    refAngle = refAngle;
  }

  @action
  void addToFilteredAngleList(int newAngle) => shortenedAngleList.add(newAngle);

  screenConstructor() async {
    await gyroscopeStore(NoParams());
    final unfilteredList = [];
    int lowerBound = 0;
    int upperBound = 0;
    // final numOfQuadrants = 7;
    // final angleCoveragePerQuadrant = 60;
    // final buffer = CircularBuffer<int>(100);

    gyroscopeStore.userDirection.listen((value) {
      setDirection(value);
      unfilteredList.add(value);
      shortenedAngleList.clear();

      refAngle = unfilteredList[0];
      inflectionPoint = 360 - refAngle;
      isALowEndRefAngle = refAngle < 180 ? true : false;

      lowerBound = (refAngle - 30) % 360;
      upperBound = (refAngle + 30) % 360;
      // filteredAngle Logic
      for (int i = 0; i < unfilteredList.length; i += 5) {
        shortenedAngleList.add(unfilteredList[i] - refAngle);
      }
      print(
          'REFERENCE ANGLE: $refAngle || unfiltered ${shortenedAngleList.last.toString()}');
    });

    reaction((p0) => shortenedAngleList.toString(), (p0) {
      // final isWithinThreshold = GyroscopeUtils.isWithinBounds(
      //   shortenedAngleList.last,
      //   lowerBound,
      //   upperBound,
      // );

      if (currentRevolution == 1 && isALowEndRefAngle) {
        // low end angle count up is good
        // print(
        //     'low end rxn LAST MEASUREMENT ${shortenedAngleList.last} INFLECTION POINT $inflectionPoint ${shortenedAngleList.last + refAngle}');

        if (shortenedAngleList.last.isNegative &&
            shortenedAngleList.last < inflectionPoint) {
          filteredAngleList
              .add(shortenedAngleList.last + refAngle + inflectionPoint);
          print("1 LETS SEE IF THIS WORKS: ${filteredAngleList.last}");
          return;
        } else {
          print("2 LETS SEE IF THIS WORKS: ${filteredAngleList.last}");
          filteredAngleList.add(shortenedAngleList.last);
          return;
        }
      } else if (currentRevolution == 1 && !isALowEndRefAngle) {
        if (shortenedAngleList.last.isNegative) {
          filteredAngleList
              .add(shortenedAngleList.last + refAngle + inflectionPoint);
          print("1 LETS SEE IF THIS WORKS: ${filteredAngleList.last}");
          return;
        } else {
          filteredAngleList.add(shortenedAngleList.last);
          print("2 LETS SEE IF THIS WORKS: ${filteredAngleList.last}");
          return;
        }
      } // high end is working too it counts up
    });

    reaction((p0) => thresholdList.toString(), (p0) {
      if (thresholdList.isNotEmpty) {
        theSideTheThresholdWasEnteredFrom = thresholdList[0].closerTo;
      }
      print("WHICH SIDE DID IT ENTER FROM? $theSideTheThresholdWasEnteredFrom");
    });
  }

  @action
  setDirection(int newValue) {
    direction = newValue;
  }

  _P2PPurposePhase6CoordinatorStoreBase({
    required this.beachWaves,
    required this.gyroscopeStore,
    required this.beachSkyStore,
    required this.sunAndMoon,
  });

  @override
  List<Object> get props => [];
}
