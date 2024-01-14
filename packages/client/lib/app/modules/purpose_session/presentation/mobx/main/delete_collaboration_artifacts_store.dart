// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/purpose_session/domain/domain.dart';
import 'package:nokhte/app/modules/purpose_session/types/purpose_session_screen.dart';
import 'package:nokhte/app/modules/purpose_session/utils/purpose_session_utils.dart';
part 'delete_collaboration_artifacts_store.g.dart';

class DeleteCollaborationArtifactsStore = _DeleteCollaborationArtifactsStoreBase
    with _$DeleteCollaborationArtifactsStore;

abstract class _DeleteCollaborationArtifactsStoreBase extends BaseMobxDBStore<
    PurposeSessionScreen, CollaborationArtifactDeleteStatusEntity> with Store {
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

  _DeleteCollaborationArtifactsStoreBase({
    required this.deleteCollaborativeDocument,
    required this.deleteSchedulingSession,
    required this.deleteTheCollaboration,
    required this.deleteCapsuleArrangement,
    required this.deleteSoloDocument,
  });

  @override
  @action
  Future<void> call(PurposeSessionScreen params) async {
    state = StoreState.loading;
    if (PurposeSessionUtils.shouldDeleteCollaboration(params)) {
      final res = await deleteTheCollaboration(NoParams());
      res.fold((failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      }, (deleteStatusEntity) {
        collaborationIsDeleted = deleteStatusEntity.isTrue;
      });
    }
    if (PurposeSessionUtils.shouldDeleteSoloDocument(params)) {
      final res = await deleteSoloDocument(NoParams());
      res.fold((failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      }, (deleteStatusEntity) {
        soloDocumentIsDeleted = deleteStatusEntity.isTrue;
      });
    }
    if (PurposeSessionUtils.shouldDeleteCapsuleArrangement(params)) {
      final res = await deleteCapsuleArrangement(NoParams());
      res.fold((failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      }, (deleteStatusEntity) {
        capsuleArrangementIsDeleted = deleteStatusEntity.isTrue;
      });
    }
    if (PurposeSessionUtils.shouldDeleteCollaborativeDocument(params)) {
      final res = await deleteCollaborativeDocument(NoParams());
      res.fold((failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      }, (deleteStatusEntity) {
        collaborativeDocumentIsDeleted = deleteStatusEntity.isTrue;
      });
    }
    if (PurposeSessionUtils.shouldDeleteSchedulingSession(params)) {
      final res = await deleteSchedulingSession(NoParams());
      res.fold((failure) {
        errorMessage = mapFailureToMessage(failure);
        state = StoreState.initial;
      }, (deleteStatusEntity) {
        schedulingSessionIsDeleted = deleteStatusEntity.isTrue;
      });
    }
    state = StoreState.loaded;
  }
}
