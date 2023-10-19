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
    final exactDate =
        conveyerBelt.dates[conveyerBelt.currentlySelectedIndex].unformatted;
    final roundedDate =
        DateTime(exactDate.year, exactDate.month, exactDate.day);
    return roundedDate == comparisonDate ? true : false;
  }

  // basically what you want is a comparison type deal

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
    final now = DateTime.parse('1969-16-20 04:00:00');
    // final now = DateTime.now();
    widgets.attuneTheWidgets(now);
    Future.delayed(Seconds.get(6), () {
      conveyerBelt.setWidgetVisibility(true);
    });

    // Future.delayed(Seconds.get(8), () {
    //   conveyerBelt.initForwardMovie();

    //   updateTheBackend(true);
    // });

    reaction((p0) => gyroscopicCoordinatorStore.currentQuadrant, (p0) {
      if (p0 >= 0) {
        valueTrackingSetup(p0);
        conveyerBeltController();
        // print("most curr val $firstValue lagging val $previousValue ");
      }
    });
    scheduling.getCollaboratorsDateAndTimeStore.chosenTimeAndDay
        .listen((value) {
      switch (conveyerBelt.currentFocus) {
        case DateOrTime.date:
          if (checkIfDatesMatch(value.date)) {
            delta.startColorTransitionMovie();
            confirmingMatch = true;
            Timer(Seconds.get(3), () {
              if (confirmingMatch == true) {
                // make the transition to times
                print("this should be running no?");
                conveyerBelt.setWidgetVisibility(false);
                Future.delayed(Seconds.get(3), () {
                  conveyerBelt.setTimesArray();
                  print("current focus?? ${conveyerBelt.currentFocus}");
                  conveyerBelt.setWidgetVisibility(true);
                  // conveyerBelt.setUIArray(inputArr)
                });
                gyroscopicCoordinatorStore.resetTheQuadrantLayout(
                  startingQuadrant: conveyerBelt.currentlySelectedIndex,
                  numberOfQuadrants: 24,
                  totalAngleCoverageOfEachQuadrant: 90,
                );
              }
            });
          } else {
            if (confirmingMatch == true) {
              delta.backTrackTheTransition();
              confirmingMatch == false;
            } else {
              delta.resetColorTransition();
            }
          }
          break;
        case DateOrTime.time:
          if (value.time ==
              conveyerBelt
                  .times[conveyerBelt.currentlySelectedIndex].unformatted) {
            print("you have a time match!! start the timer!");
          } else {
            print("you don't have a time match!! end the timer!");
          }
          break;
      }

      if (conveyerBelt.currentFocus == DateOrTime.date) {
        if (value.date ==
            conveyerBelt
                .dates[conveyerBelt.currentlySelectedIndex].unformatted) {
          print("you have a match!! start the timer!");
        } else {}
      } else {
        print("you don't a match!! end / don't start the timer!");
      }
      print("date ${value.date}");
    });
  }

  @action
  updateTheBackend(bool isAForwardMovement) async {
    final chosenIndex =
        isAForwardMovement ? conveyerBelt.rightIndex : conveyerBelt.leftIndex;
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

  @override
  List<Object> get props => [];
}
