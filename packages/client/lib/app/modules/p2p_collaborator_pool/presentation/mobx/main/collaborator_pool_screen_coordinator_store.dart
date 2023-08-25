// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'collaborator_pool_screen_coordinator_store.g.dart';

class CollaboratorPoolScreenCoordinatorStore = _CollaboratorPoolScreenCoordinatorStoreBase
    with _$CollaboratorPoolScreenCoordinatorStore;

abstract class _CollaboratorPoolScreenCoordinatorStoreBase extends Equatable
    with Store {
  final CustomWidgetsTrackerStore widgetStore;
  final ExitCollaboratorPoolStore exitCollaboratorPoolStore;

  _CollaboratorPoolScreenCoordinatorStoreBase({
    required this.widgetStore,
    required this.exitCollaboratorPoolStore,
  });

  @action
  screenConstructorCallback() {
    widgetStore.beachWavesStore.initiateToTheDepths();
  }

  @override
  List<Object> get props => [];
}
