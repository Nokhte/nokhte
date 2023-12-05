// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'get_collaborative_doc_content_store.dart';
part 'collaborative_doc_coordinator.g.dart';

class CollaborativeDocCoordinator = _CollaborativeDocCoordinatorBase
    with _$CollaborativeDocCoordinator;

abstract class _CollaborativeDocCoordinatorBase extends Equatable with Store {
  final MoveToFinishedDocs moveToFinishedDocs;
  final UpdateCommitDesireStatus updateCommitDesire;
  final UpdateUserDelta updateDelta;
  final UpdateUserPresence updatePresence;
  final CreateCollaborativeDoc createDoc;
  final GetCollaborativeDocContentStore getContent;
  final GetCollaboratorDocInfo getCollaboratorInfo;
  final UpdateCollaborativeDoc updateDoc;

  _CollaborativeDocCoordinatorBase({
    required this.moveToFinishedDocs,
    required this.updateDoc,
    required this.createDoc,
    required this.getContent,
    required this.getCollaboratorInfo,
    required this.updateDelta,
    required this.updatePresence,
    required this.updateCommitDesire,
  });
  @override
  List<Object> get props => [];
}
