// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:primala/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase6_coordinator_store.g.dart';

class P2PPurposePhase6CoordinatorStore = _P2PPurposePhase6CoordinatorStoreBase
    with _$P2PPurposePhase6CoordinatorStore;

abstract class _P2PPurposePhase6CoordinatorStoreBase extends Equatable
    with Store {
  final SunAndMoonStore sunAndMoon;
  final BeachHorizonTrackerStore beachWaves;
  final BeachSkyStore beachSkyStore;
  final GyroscopicCoordinatorStore gyroscopicCoordinatorStore;

  _P2PPurposePhase6CoordinatorStoreBase({
    required this.beachWaves,
    required this.beachSkyStore,
    required this.sunAndMoon,
    required this.gyroscopicCoordinatorStore,
  });

  screenConstructor() async {
    await gyroscopicCoordinatorStore.setupTheStream(
      numberOfQuadrants: 4,
      totalAngleCoverageOfEachQuadrant: 90,
      startingQuadrant: 1,
    );
  }

  @override
  List<Object> get props => [];
}
