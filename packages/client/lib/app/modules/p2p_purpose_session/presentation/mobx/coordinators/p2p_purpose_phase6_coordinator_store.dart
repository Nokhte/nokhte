// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:primala/app/core/modules/scheduling/domain/domain.dart';
import 'package:primala/app/core/modules/scheduling/presentation/presentation.dart';
import 'package:primala/app/core/types/types.dart';
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

  // I think a coordinator store for the widget
  @observable
  int firstValue = -1;

  @observable
  int secondValue = -1;

  int previousValue = -1;

  @computed
  bool get isFirstTime => firstValue == -1;

  @computed
  bool get isSecondTime => secondValue == -1;

  // basically what you want is a comparison type deal

  _P2PPurposePhase6CoordinatorStoreBase({
    required this.widgets,
    required this.gyroscopicCoordinatorStore,
    required this.scheduling,
  }) : conveyerBelt = widgets.conveyerBelt;

  screenConstructor() async {
    await scheduling.createSchedulingSessionStore(NoParams());
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

    Future.delayed(Seconds.get(8), () {
      conveyerBelt.initForwardMovie();

      updateTheBackend(true);
    });

    reaction((p0) => gyroscopicCoordinatorStore.currentQuadrant, (p0) {
      if (p0 >= 0) {
        valueTrackingSetup(p0);
        conveyerBeltController();
        // print("most curr val $firstValue lagging val $previousValue ");
      }
    });
  }

  @action
  updateTheBackend(bool isAForwardMovement) async {
    final chosenIndex =
        isAForwardMovement ? conveyerBelt.rightIndex : conveyerBelt.leftIndex;

    await scheduling.updateSchedulingTimeOrDateStore(
        UpdateSchedulingTimeOrDateParams(
            updateDate: true,
            newDateOrTime: widgets.conveyerBelt.dates[chosenIndex].unformatted
            //
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
  conveyerBeltController() async {
    if (isFirstTime && firstValue > 0) {
      conveyerBelt.initForwardMovie();
      updateTheBackend(true);
      // here
    } else if (firstValue > previousValue) {
      conveyerBelt.initForwardMovie();
      updateTheBackend(true);
    } else {
      conveyerBelt.initBackwardMovie();
      updateTheBackend(false);
    }
  }

  @override
  List<Object> get props => [];
}
