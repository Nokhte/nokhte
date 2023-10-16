// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase6_coordinator_store.g.dart';

class P2PPurposePhase6CoordinatorStore = _P2PPurposePhase6CoordinatorStoreBase
    with _$P2PPurposePhase6CoordinatorStore;

abstract class _P2PPurposePhase6CoordinatorStoreBase extends Equatable
    with Store {
  final GyroscopicCoordinatorStore gyroscopicCoordinatorStore;
  final SchedulingWidgetsCoordinatorStore widgets;
  // I think a coordinator store for the widget

  _P2PPurposePhase6CoordinatorStoreBase({
    required this.widgets,
    required this.gyroscopicCoordinatorStore,
  });

  screenConstructor() async {
    await gyroscopicCoordinatorStore.setupTheStream(
      numberOfQuadrants: 4,
      totalAngleCoverageOfEachQuadrant: 90,
      startingQuadrant: 0,
    );
    // final now = DateTime.parse('1969-16-20 20:00:00');
    final now = DateTime.now();
    widgets.attuneTheWidgets(now);
    Future.delayed(Seconds.get(7), () {
      widgets.initForwardTimeShift();
    });

    reaction((p0) => gyroscopicCoordinatorStore.currentQuadrant, (p0) {
      // print("from the coordinator $p0");
    });
  }

  @override
  List<Object> get props => [];
}
