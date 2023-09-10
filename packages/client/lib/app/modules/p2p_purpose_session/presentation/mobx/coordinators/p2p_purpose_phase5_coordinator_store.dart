// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';
import 'package:primala/app/core/widgets/mobx.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase5_coordinator_store.g.dart';

class P2PPurposePhase5CoordinatorStore = _P2PPurposePhase5CoordinatorStoreBase
    with _$P2PPurposePhase5CoordinatorStore;

abstract class _P2PPurposePhase5CoordinatorStoreBase extends Equatable
    with Store {
  final BeachWavesTrackerStore beachWaves;
  final CollaborativeTextEditorTrackerStore collaborativeText;

  @action
  screenConstructor() {
    beachWaves.initiateSuspendedAtTheDepths();
    // textEditor.addEventListeners();
  }

  _P2PPurposePhase5CoordinatorStoreBase({
    required this.beachWaves,
    required this.collaborativeText,
  });

  @override
  List<Object> get props => [
// some items
      ];
}
