// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase4_coordinator_store.g.dart';

class P2PPurposePhase4CoordinatorStore = _P2PPurposePhase4CoordinatorStoreBase
    with _$P2PPurposePhase4CoordinatorStore;

abstract class _P2PPurposePhase4CoordinatorStoreBase extends Equatable
    with Store {
  final BeachWavesTrackerStore beachWaves;

  _P2PPurposePhase4CoordinatorStoreBase({
    required this.beachWaves,
  });

  @override
  List<Object> get props => [
// some items
      ];
}
