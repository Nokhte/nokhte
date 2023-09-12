// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/modules/collaborative_doc/presentation/presentation.dart';
// * Mobx Codegen Inclusion
part 'collaborative_doc_coordinator_store.g.dart';

class CollaborativeDocCoordinatorStore = _CollaborativeDocCoordinatorStoreBase
    with _$CollaborativeDocCoordinatorStore;

abstract class _CollaborativeDocCoordinatorStoreBase extends Equatable
    with Store {
  final UpdateUserDeltaStore updateDelta;
  final UpdateUserPresenceStore updatePresence;
  final CreateCollaborativeDocStore createDoc;
  final GetCollaborativeDocContentStore getContent;
  final GetCollaboratorDeltaStore getDelta;
  final GetCollaboratorPresenceStore getPresence;
  final UpdateCollaborativeDocStore updateDoc;

  _CollaborativeDocCoordinatorStoreBase({
    required this.updateDoc,
    required this.createDoc,
    required this.getContent,
    required this.getDelta,
    required this.getPresence,
    required this.updateDelta,
    required this.updatePresence,
  });
  @override
  List<Object> get props => [
// some items
      ];
}
