// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'dart:async';

import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
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

  @action
  setPrevValue(int newVal) {
    previousValue = newVal;
  }

  @observable
  int chosenIndex = 0;

  @action
  setChosenIndex(int newInt) => chosenIndex = newInt;

  // I think a coordinator store for the widget
  @observable
  int firstValue = -1;

  @observable
  int secondValue = -1;

  int previousValue = -1;

  @observable
  bool confirmingMatch = false;

  @computed
  bool get isFirstTime => firstValue == -1;

  @computed
  bool get isSecondTime => secondValue == -1;

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

  _P2PPurposePhase6CoordinatorStoreBase({
    required this.widgets,
    required this.gyroscopicCoordinatorStore,
    required this.scheduling,
  })  : conveyerBelt = widgets.conveyerBelt,
        delta = widgets.schedulingDelta;

  screenConstructor() async {
    await scheduling.createSchedulingSessionStore(NoParams());
    await scheduling.getCollaboratorsDateAndTimeStore(NoParams());
    await gyroscopicCoordinatorStore.setupTheStream(
      numberOfQuadrants: 6,
      totalAngleCoverageOfEachQuadrant: 90,
      startingQuadrant: 0,
    );
    // final now = DateTime.parse('1969-16-20 04:00:00');
    final now = DateTime.now();
    widgets.attuneTheWidgets(now);
    Future.delayed(Seconds.get(6), () {
      conveyerBelt.setWidgetVisibility(true);
    });

    reaction((p0) => gyroscopicCoordinatorStore.currentQuadrant, (p0) {
      if (p0 >= 0) {
        valueTrackingSetup(p0);
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
  updateTheBackend(bool isAForwardMovement) async {
    setChosenIndex(
        isAForwardMovement ? conveyerBelt.rightIndex : conveyerBelt.leftIndex);
    DateTime newDateOrTime;
    bool updateTheDate;
    conveyerBelt.currentFocus == DateOrTime.date
        ? {
            updateTheDate = true,
            newDateOrTime = conveyerBelt.dates[chosenIndex].unformatted,
          }
        : {
            updateTheDate = false,
            newDateOrTime = conveyerBelt.times[chosenIndex].unformatted,
          };

    await scheduling
        .updateSchedulingTimeOrDateStore(UpdateSchedulingTimeOrDateParams(
      updateDate: updateTheDate,
      newDateOrTime: newDateOrTime,
    ));
  }

  @action
  valueTrackingSetup(int p0) {
    if (isFirstTime) {
      firstValue = p0;
    } else if (secondValue == -1) {
      secondValue = p0;
    } else {
      previousValue = firstValue;
      firstValue = secondValue;
      secondValue = p0;
    }
  }

  @action
  agreementProtocolTimer() {
    Timer(Seconds.get(3), () {
      if (confirmingMatch) {
        conveyerBelt.setWidgetVisibility(false);
        Future.delayed(Seconds.get(3), () {
          conveyerBelt.setTimesArray();
          conveyerBelt.setWidgetVisibility(true);
          gyroscopicCoordinatorStore.resetTheQuadrantLayout(
            startingQuadrant: conveyerBelt.currentlySelectedIndex,
            numberOfQuadrants: 24,
            totalAngleCoverageOfEachQuadrant: 90,
          );
          delta.backTrackTheTransition();
          setPrevValue(conveyerBelt.currentlySelectedIndex - 1);
          // test these changes see if they fix the problem
          // of not acting well with first time interaction
          // resetTheValues();
        });
      }
    });
  }

  @action
  conveyerBeltController() {
    if (isSecondTime && firstValue > 0) {
      print("branch 1: $firstValue pv: $previousValue ");
      conveyerBelt.initForwardMovie();
      updateTheBackend(true);
      // here
    } else if (firstValue > previousValue) {
      print("branch 2: $firstValue pv: $previousValue ");
      conveyerBelt.initForwardMovie();
      updateTheBackend(true);
    } else if (firstValue < previousValue && firstValue != 0) {
      print("branch 3: $firstValue pv: $previousValue ");
      conveyerBelt.initBackwardMovie();
      updateTheBackend(false);
    }
  }

  @action
  disagreementAfterAgreementProtocol() {
    if (confirmingMatch == true) {
      confirmingMatch == false;
      conveyerBelt.setWidgetVisibility(true);
      delta.backTrackTheTransition();
    }
  }

  @override
  List<Object> get props => [];
}
