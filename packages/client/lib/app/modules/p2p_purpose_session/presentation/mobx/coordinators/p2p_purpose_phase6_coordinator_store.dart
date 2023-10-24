// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'dart:async';

import 'package:const_date_time/const_date_time.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:primala/app/core/modules/gyroscopic/types/types.dart';
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
  final QuadrantAPI quadrantAPI;
  final SchedulingWidgetsCoordinatorStore widgets;
  final ConveyerBeltTextStore conveyerBelt;
  final SchedulingCoordinatorStore scheduling;
  final SchedulingDeltaStore delta;

  _P2PPurposePhase6CoordinatorStoreBase({
    required this.widgets,
    required this.quadrantAPI,
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
  bool timesWidgetIsReady = false;

  @action
  setTimesWidgetIsReady(newBool) => timesWidgetIsReady = newBool;

  @observable
  List<int> timesQuadrants = [];

  @computed
  bool get previousValueIsNotSet => previousValue == -1;

  @action
  resetValues() {
    firstValue = -1;
    secondValue = -1;
    previousValue = -1;
    // print("SPV f $firstValue s $secondValue pr  $previousValue");
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

  @observable
  DateTime now = DateTime.now();
  // DateTime now = DateTime.parse('2021-10-20 00:00:00');

  @action
  setNow(DateTime newNow) => now = newNow;

  screenConstructor() async {
    await scheduling.createSchedulingAndStreamSetup();
    await quadrantAPI.setupTheStream(
      numberOfQuadrants: 18,
      totalAngleCoverageOfEachQuadrant: 20,
      startingQuadrant: 0,
      negativeModeBehavior: NegativeModeBehaviors.resetRefAngle,
    );
    widgets.widgetSetup(now);

    reaction((p0) => quadrantAPI.currentQuadrant, (p0) {
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
            confirmingMatch = true;
            agreementProtocolTimer();
          } else {
            disagreementAfterAgreementProtocol();
          }
      }
    });
  }

  @action
  valueTrackingSetup(int p0) {
    if (isFirstTime) {
      // print("is first time $p0");
      firstValue = p0;
    } else if (secondValue == -1) {
      secondValue = p0;
      // print("is second time $p0");
    } else {
      previousValue = firstValue;
      firstValue = secondValue;
      secondValue = p0;
      // print("is nth time  $firstValue $secondValue $previousValue");
    }
  }

  @action
  agreementProtocolTimer() {
    switch (conveyerBelt.currentFocus) {
      case DateOrTime.date:
        Future.delayed(Seconds.get(3), () {
          if (confirmingMatch) {
            conveyerBelt.setWidgetVisibility(false);
            print("what now are we using?? $now ????");
            conveyerBelt.setTimesArray(now);
            quadrantAPI.resetTheQuadrantLayout(
              startingQuadrant: conveyerBelt.currentlySelectedIndex,
              numberOfQuadrants: 24,
              totalAngleCoverageOfEachQuadrant: 90,
            );
            setStartingQuadrant(conveyerBelt.currentlySelectedIndex);
            // print("shouldn't this be 13 $startingQuadrant");
            Future.delayed(Seconds.get(3), () {
              resetValues();
              setTimesWidgetIsReady(true);
              conveyerBelt.setUIArray(conveyerBelt.times);
              conveyerBelt.setWidgetVisibility(true);
              delta.backTrackTheTransition();
              confirmingMatch = false;
            });
          }
        });
      case DateOrTime.time:
        Future.delayed(Seconds.get(3), () {
          if (confirmingMatch) {
            widgets.initBackToShore(
              conveyerBelt
                  .times[conveyerBelt.currentlySelectedIndex].unformatted,
            );
          }
        });
    }
  }

  @action
  conveyerBeltController() {
    // print(
    //     "CTRLER : What are our value FV: $firstValue SV: $secondValue PV: $previousValue NEW TIME $newDateOrTime");

    switch (conveyerBelt.currentFocus) {
      case DateOrTime.date:
        if (isSecondTime && firstValue > 0) {
          // print("branch 1 is running  $firstValue  > $previousValue ");
          widgets.initForwardTimeShift(isADate: true, newTime: newDateOrTime);
          updateTheBackend(isAForwardMovement: true, isADate: true);
        } else if (!isFirstTime && !isSecondTime && secondValue > firstValue) {
          widgets.initForwardTimeShift(isADate: true, newTime: newDateOrTime);
          updateTheBackend(isAForwardMovement: true, isADate: true);
        } else if (!isFirstTime && !isSecondTime && secondValue < firstValue) {
          widgets.initBackwardTimeShift(isADate: true, newTime: newDateOrTime);
          updateTheBackend(isAForwardMovement: false, isADate: true);
        }
      case DateOrTime.time:
        if (timesWidgetIsReady == false) {
          return;
        } else if (!isFirstTime && !isSecondTime && secondValue > firstValue) {
          widgets.initForwardTimeShift(isADate: false, newTime: newDateOrTime);
          updateTheBackend(isAForwardMovement: true, isADate: false);
        } else if (!isFirstTime && !isSecondTime && secondValue < firstValue) {
          widgets.initBackwardTimeShift(isADate: false, newTime: newDateOrTime);
          updateTheBackend(isAForwardMovement: false, isADate: false);
        }
    }
  }

  @action
  disagreementAfterAgreementProtocol() {
    if (confirmingMatch == true) {
      confirmingMatch = false;
      conveyerBelt.setWidgetVisibility(true);
      delta.backTrackTheTransition();
    }
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
    final ourUnformattedDate =
        conveyerBelt.times[chosenIndex].unformatted.toUtc();
    final theirRoundedDate = DateTime(2003, 4, 9, comparisonDate.hour);
    final ourRoundedDate = DateTime(2003, 4, 9, ourUnformattedDate.hour);
    print(
        "hey what's this comparison ours: $ourRoundedDate theirs $theirRoundedDate");
    return theirRoundedDate == ourRoundedDate;
  }

  @action
  updateTheBackend(
      {required bool isAForwardMovement, required bool isADate}) async {
    final convertedTypes = conveyerBelt.convertCurrentState(
      isAForwardMovementParam: isAForwardMovement,
      isADate: isADate,
    );
    print(
        "what's the new date does this not get updated?? ${conveyerBelt.currentFocus} ${convertedTypes.newDateOrTime}");
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
