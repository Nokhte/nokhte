// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:const_date_time/const_date_time.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';
import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';
import 'package:nokhte/app/core/modules/scheduling/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/scheduling_delta/stack/stack.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/mobx/mobx.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
part 'p2p_purpose_phase6_coordinator_store.g.dart';

class P2PPurposePhase6CoordinatorStore = _P2PPurposePhase6CoordinatorStoreBase
    with _$P2PPurposePhase6CoordinatorStore;

abstract class _P2PPurposePhase6CoordinatorStoreBase
    extends BaseQuadrantAPIReceiver with Store {
  final SchedulingWidgetsCoordinatorStore widgets;
  final AbortPurposeSessionArtifactsStore abortPurposeSessionArtifactsStore;
  final ConveyerBeltTextStore conveyerBelt;
  final UpdateExistingCollaborationsCoordinator updateExistingCollaborations;
  final SchedulingCoordinatorStore scheduling;
  final SchedulingDeltaStore delta;
  final SwipeDetector swipe;

  _P2PPurposePhase6CoordinatorStoreBase({
    required this.updateExistingCollaborations,
    required this.swipe,
    required this.abortPurposeSessionArtifactsStore,
    required super.quadrantAPI,
    required this.widgets,
    required this.scheduling,
  })  : conveyerBelt = widgets.conveyerBelt,
        delta = widgets.schedulingDelta;

  bool isFirstTimeWithTimes = true;

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
    timesQuadrants.clear();
  }

  @observable
  int startingQuadrant = 0;

  @action
  setStartingQuadrant(int newQuad) => startingQuadrant = newQuad;

  @observable
  bool confirmingMatch = false;

  @observable
  DateTime newDateOrTime = const ConstDateTime(0);

  @action
  setNewDateOrTime(DateTime newDT) => newDateOrTime = newDT;

  @observable
  DateTime now = DateTime.now();

  @observable
  DateTime currentlySelectedDate = DateTime.fromMicrosecondsSinceEpoch(0);

  @action
  setNow(DateTime newNow) => now = newNow;

  screenConstructor() async {
    await scheduling.createSchedulingAndStreamSetup();
    await quadrantAPI.setupTheStream(
      numberOfQuadrants: 6,
      quadrantSpread: 90,
      startingQuadrant: 0,
      negativeModeBehavior: NegativeModeBehaviors.resetRefAngle,
    );
    widgets.widgetSetup(now);

    reaction((p0) => quadrantAPI.currentQuadrant, (p0) {
      if (p0 >= 0) {
        valueTrackingSetup(p0);
        if (conveyerBelt.currentFocus == DateOrTime.time) {
          timesQuadrants.add(p0);
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
  agreementProtocolTimer() {
    switch (conveyerBelt.currentFocus) {
      case DateOrTime.date:
        Future.delayed(Seconds.get(3), () {
          if (confirmingMatch) {
            conveyerBelt.setWidgetVisibility(false);
            conveyerBelt.setTimesArray(now);
            quadrantAPI.resetTheQuadrantLayout(
              startingQuadrant: conveyerBelt.currentlySelectedIndex,
              numberOfQuadrants: 24,
              quadrantSpread: 90,
            );
            setStartingQuadrant(conveyerBelt.currentlySelectedIndex);
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
        Future.delayed(Seconds.get(3), () async {
          await updateExistingCollaborations
              .updateCollaborationActivationStatus(false);
          if (confirmingMatch) {
            calendarCallback(currentlySelectedDate);
            widgets.initBackToShore(
              conveyerBelt
                  .times[conveyerBelt.currentlySelectedIndex].unformatted,
            );
          }
        });
    }
  }

  calendarCallback(DateTime theDate) async {
    final Event event = Event(
      title: 'Perspectives Session',
      // description: 'With X Persion',
      // location: 'Event location',
      startDate: theDate,
      endDate: theDate,
      iosParams: const IOSParams(
        reminder: Duration(
          hours: 1,
        ), // on iOS, you can set alarm notification after your event.
        // url: 'com.nokhte.nokhte', // on iOS, you can set url to your event.
      ),
      androidParams: const AndroidParams(
        emailInvites: [], // on Android, you can add invite emails to your event.
      ),
    );
    Add2Calendar.addEvent2Cal(event);
  }

  @action
  conveyerBeltController() {
    switch (conveyerBelt.currentFocus) {
      case DateOrTime.date:
        if (isSecondTime && firstValue > 0) {
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
          currentlySelectedDate = newDateOrTime;
        } else if (!isFirstTime && !isSecondTime && secondValue < firstValue) {
          widgets.initBackwardTimeShift(isADate: false, newTime: newDateOrTime);
          updateTheBackend(isAForwardMovement: false, isADate: false);
          currentlySelectedDate = newDateOrTime;
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
    return theirRoundedDate == ourRoundedDate;
  }

  @action
  updateTheBackend(
      {required bool isAForwardMovement, required bool isADate}) async {
    final convertedTypes = conveyerBelt.convertCurrentState(
      isAForwardMovementParam: isAForwardMovement,
      isADate: isADate,
    );
    setChosenIndex(convertedTypes.chosenIndex);
    setNewDateOrTime(convertedTypes.newDateOrTime);
    await scheduling
        .updateSchedulingTimeOrDateStore(UpdateSchedulingTimeOrDateParams(
      updateDate: convertedTypes.updateTheDate,
      newDateOrTime: newDateOrTime,
    ));
  }
}
