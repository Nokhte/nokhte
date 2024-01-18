// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/mobx/mobx.dart';
part 'delete_unconsecrated_collaborations_coordinator.g.dart';

class DeleteUnconsecratedCollaborationsCoordinator = _DeleteUnconsecratedCollaborationsCoordinatorBase
    with _$DeleteUnconsecratedCollaborationsCoordinator;

abstract class _DeleteUnconsecratedCollaborationsCoordinatorBase
    extends BaseMobxDBStore<NoParams, CollaborationArtifactDeleteStatusEntity>
    with Store {
  @observable
  bool collaborationIsDeleted = false;

  @observable
  bool soloDocumentIsDeleted = false;

  @observable
  bool capsuleArrangementIsDeleted = false;

  @observable
  bool collaborativeDocumentIsDeleted = false;

  @observable
  bool schedulingSessionIsDeleted = false;

  final DeleteCapsuleArrangement deleteCapsuleArrangement;
  final DeleteCollaborativeDocument deleteCollaborativeDocument;
  final DeleteSchedulingSession deleteSchedulingSession;
  final DeleteTheCollaboration deleteTheCollaboration;
  final DeleteSoloDocument deleteSoloDocument;
  final CheckForUnconsecratedCollaborationStore
      checkForUnconsecratedCollaboration;

  _DeleteUnconsecratedCollaborationsCoordinatorBase({
    required this.deleteCollaborativeDocument,
    required this.deleteSchedulingSession,
    required this.deleteTheCollaboration,
    required this.deleteCapsuleArrangement,
    required this.deleteSoloDocument,
    required this.checkForUnconsecratedCollaboration,
  });

  @override
  @action
  Future<void> call(NoParams params) async {
    state = StoreState.loading;
    await checkForUnconsecratedCollaboration(NoParams());
    if (checkForUnconsecratedCollaboration.hasAnUnconsecratedCollaboration) {
      await deleteTheCollaboration(NoParams());
    }
  }
}
