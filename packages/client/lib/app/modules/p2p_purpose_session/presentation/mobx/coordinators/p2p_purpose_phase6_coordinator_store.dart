// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'dart:async';

import 'package:const_date_time/const_date_time.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:primala/app/core/modules/scheduling/domain/domain.dart';
import 'package:primala/app/core/modules/scheduling/presentation/presentation.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/scheduling_delta/stack/stack.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase6_coordinator_store.g.dart';

class P2PPurposePhase6CoordinatorStore = _P2PPurposePhase6CoordinatorStoreBase
    with _$P2PPurposePhase6CoordinatorStore;

abstract class _P2PPurposePhase6CoordinatorStoreBase extends Equatable
    with Store {
  final GyroscopicCoordinatorStore gyroscopicCoordinatorStore;
  final SchedulingWidgetsCoordinatorStore widgets;
  final ConveyerBeltTextStore conveyerBelt;
  final SchedulingCoordinatorStore scheduling;
  final SchedulingDeltaStore delta;

  _P2PPurposePhase6CoordinatorStoreBase({
    required this.widgets,
    required this.gyroscopicCoordinatorStore,
    required this.scheduling,
  })  : conveyerBelt = widgets.conveyerBelt,
        delta = widgets.schedulingDelta;

  bool isFirstTimeWithTimes = true;

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

  @observable
  List<int> timesQuadrants = [];

  @computed
  bool get previousValueIsNotSet => previousValue == -1;

  @action
  resetValues() {
    firstValue = -1;
    secondValue = -1;
    previousValue = -1;
    print("SPV f $firstValue s $secondValue pr  $previousValue");
    timesQuadrants.clear();
  }

  @observable
  int startingQuadrant = 0;

  @action
  setStartingQuadrant(int newQuad) => startingQuadrant = newQuad;

  @observable
  bool confirmingMatch = false;

  // @action
  // setConfirmingMatch(bool newBool) => confirmingMatch = newBool;

  @observable
  DateTime newDateOrTime = const ConstDateTime(0);

  @action
  setNewDateOrTime(DateTime newDT) => newDateOrTime = newDT;

  @computed
  bool get isFirstTime => firstValue == -1;

  @computed
  bool get isSecondTime => secondValue == -1;

  DateTime now = DateTime.now();

  screenConstructor() async {
    await scheduling.createSchedulingAndStreamSetup();
    await gyroscopicCoordinatorStore.setupTheStream(
      numberOfQuadrants: 6,
      totalAngleCoverageOfEachQuadrant: 90,
      startingQuadrant: 0,
    );
    now = DateTime.parse('1969-16-20 00:00:00');
    // now = DateTime.now();
    widgets.widgetSetup(now);

    reaction((p0) => gyroscopicCoordinatorStore.currentQuadrant, (p0) {
      if (p0 >= 0) {
        valueTrackingSetup(p0);
        if (conveyerBelt.currentFocus == DateOrTime.time) {
          timesQuadrants.add(p0);
          print("hey here's the times list $timesQuadrants");
        }
        conveyerBeltController();
      }
    });
    scheduling.getCollaboratorsDateAndTimeStore.chosenTimeAndDay
        .listen((value) {
      switch (conveyerBelt.currentFocus) {
        case DateOrTime.date:
          if (checkIfDatesMatch(value.date)) {
            delta.startColorTransitionMovie();
            confirmingMatch = true;
            agreementProtocolTimer();
          } else {
            disagreementAfterAgreementProtocol();
          }
          break;
        case DateOrTime.time:
          if (checkIfTimesMatch(value.time)) {
            delta.startColorTransitionMovie();
            agreementProtocolTimer();
            confirmingMatch = true;
          } else {
            disagreementAfterAgreementProtocol();
          }
      }
    });
  }

  @action
  valueTrackingSetup(int p0) {
    // it's happeneing here
    if (isFirstTime) {
      print("is first time $p0");
      firstValue = p0;
    } else if (secondValue == -1) {
      // if (conveyerBelt.currentFocus == DateOrTime.time &&
      //     isFirstTimeWithTimes) {
      //   return;
      // }
      secondValue = p0;
      print("is second time $p0");
    } else {
      previousValue = firstValue;
      firstValue = secondValue;
      secondValue = p0;
      print("is nth time  $firstValue $secondValue $previousValue");
    }
  }

  @action
  agreementProtocolTimer() {
    Future.delayed(Seconds.get(3), () {
      if (confirmingMatch) {
        conveyerBelt.setWidgetVisibility(false);
        conveyerBelt.setTimesArray(now);
        gyroscopicCoordinatorStore.resetTheQuadrantLayout(
          startingQuadrant: conveyerBelt.currentlySelectedIndex,
          numberOfQuadrants: 24,
          totalAngleCoverageOfEachQuadrant: 90,
        ); // fv & pv may need to be synced idk
        setStartingQuadrant(conveyerBelt.currentlySelectedIndex);
        // startingQuadrant = conveyerBelt.currentlySelectedIndex
        print("shouldn't this be 13 $startingQuadrant");
        Future.delayed(Seconds.get(3), () {
          resetValues();
          conveyerBelt.setUIArray(conveyerBelt.times);
          conveyerBelt.setWidgetVisibility(true);
          delta.backTrackTheTransition();
          confirmingMatch = false;
        });
        // conveyerBeltController();

        // print(
        //   "what is the sq $startingQuadrant fv $firstValue sv $secondValue pv $previousValue",
        // );
        // print(
        //     "END OF TIMMMMMER : What are our value FV: $firstValue SV: $secondValue PV: $previousValue NEW TIME $newDateOrTime");
      }
    });
  }

  @action
  conveyerBeltController() {
    // print(
    //     "CTRLER : What are our value FV: $firstValue SV: $secondValue PV: $previousValue NEW TIME $newDateOrTime");

    switch (conveyerBelt.currentFocus) {
      case DateOrTime.date:
        if (isSecondTime && firstValue > 0) {
          // print("branch 1 is running  $firstValue  > $previousValue ");
          widgets.initForwardTimeShift(true, DateTime.now());
          updateTheBackend(true);
          //   widgets.initForwardTimeShift(false, newDateOrTime);
          //   updateTheBackend(true);
        } else if (firstValue > previousValue) {
          // print("branch 2 is running $firstValue  > $previousValue");
          widgets.initForwardTimeShift(true, DateTime.now());
          updateTheBackend(true);
          //   widgets.initForwardTimeShift(false, newDateOrTime);
          //   updateTheBackend(true);
        } else if (firstValue < previousValue && firstValue != 0) {
          // print("branch 3 is running  $firstValue  > $previousValue");
          widgets.initBackwardTimeShift(true, DateTime.now());
          updateTheBackend(false);
          //   widgets.initBackwardTimeShift(false, newDateOrTime);
          //   updateTheBackend(false);
        }
      case DateOrTime.time:

        // if (isFirstTimeWithTimes && secondValue != -1) {
        //   secondValue = -1;
        //   isFirstTimeWithTimes = false;
        //   return;
        // }
        print(
            "what's the situation 1st val $firstValue || prev val $previousValue sq $startingQuadrant");
        if (isSecondTime && firstValue > startingQuadrant) {
          print("initially you have moved up $firstValue $startingQuadrant");
        } else if (isSecondTime && previousValue < startingQuadrant) {
          print("initially you have moved down $firstValue $startingQuadrant");
        }
        // print("hey you are now in the other terrarory");
        break;
    }
  }

  @action
  disagreementAfterAgreementProtocol() {
    // if (confirmingMatch == true) {
    confirmingMatch = false;
    conveyerBelt.setWidgetVisibility(true);
    delta.backTrackTheTransition();
    // }
  }

  @action
  bool checkIfDatesMatch(DateTime comparisonDate) {
    final exactDate = conveyerBelt.dates[chosenIndex].unformatted;
    final ourRoundedDate =
        DateTime(exactDate.year, exactDate.month, exactDate.day);
    return ourRoundedDate == comparisonDate ? true : false;
  }

  @action
  bool checkIfTimesMatch(DateTime comparisonDate) {
    final theirRoundedDate = DateTime(comparisonDate.year, comparisonDate.month,
        comparisonDate.day, comparisonDate.hour, comparisonDate.minute);
    return theirRoundedDate == conveyerBelt.times[chosenIndex].unformatted;
  }

  @action
  updateTheBackend(bool isAForwardMovement) async {
    if (isFirstTimeWithTimes && conveyerBelt.currentFocus == DateOrTime.time) {
      return;
    }
    final convertedTypes = conveyerBelt.convertCurrentState(isAForwardMovement);
    setChosenIndex(convertedTypes.chosenIndex);
    setNewDateOrTime(convertedTypes.newDateOrTime);
    await scheduling
        .updateSchedulingTimeOrDateStore(UpdateSchedulingTimeOrDateParams(
      updateDate: convertedTypes.updateTheDate,
      newDateOrTime: newDateOrTime,
    ));
  }

  @override
  List<Object> get props => [];
}
