// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase1_coordinator_store.g.dart';

class P2PPurposePhase1CoordinatorStore = _P2PPurposePhase1CoordinatorStoreBase
    with _$P2PPurposePhase1CoordinatorStore;

abstract class _P2PPurposePhase1CoordinatorStoreBase extends Equatable
    with Store {
  @override
  List<Object> get props => [
// some items
      ];
}
