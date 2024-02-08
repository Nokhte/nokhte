// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
part 'delete_unconsecrated_collaborations_coordinator.g.dart';

class DeleteUnconsecratedCollaborationsCoordinator = _DeleteUnconsecratedCollaborationsCoordinatorBase
    with _$DeleteUnconsecratedCollaborationsCoordinator;

abstract class _DeleteUnconsecratedCollaborationsCoordinatorBase
    extends BaseMobxDBStore<NoParams, bool> with Store {
  @observable
  bool collaborationIsDeleted = false;

  @observable
  bool soloDocumentIsDeleted = false;

  @observable
  bool capsuleArrangementIsDeleted = false;

  @observable
  bool collaborativeDocumentIsDeleted = false;

  @observable
  bool userHasDeletedArtifacts = false;

  @observable
  bool schedulingSessionIsDeleted = false;

  @observable
  bool hasAnUnconsecratedCollabooration = false;

  @observable
  bool collaboratorHasDeletedArtifacts = false;

  @observable
  CollaboratorInfo collaboratorInfo = CollaboratorInfo.initial();

  final DeleteActiveNokhteSession deleteActiveNokhteSession;
  final DeleteCapsuleArrangement deleteCapsuleArrangementLogic;
  final DeleteCollaborativeDocument deleteCollaborativeDocumentLogic;
  final DeleteSchedulingSession deleteSchedulingSessionLogic;
  final DeleteTheCollaboration deleteTheCollaborationLogic;
  final DeleteSoloDocument deleteSoloDocumentLogic;
  final CheckIfCollaboratorHasDeletedArtifacts
      checkIfCollaboratorHasDeletedArtifactsLogic;
  final CheckForUnconsecratedCollaboration
      checkForUnconsecratedCollaborationLogic;
  final CollaborationLogicCoordinator collaborationLogicCoordinator;
  final UpdateHasDeletedArtifacts updateHasDeletedArtifactsLogic;

  _DeleteUnconsecratedCollaborationsCoordinatorBase({
    required this.deleteActiveNokhteSession,
    required this.deleteCollaborativeDocumentLogic,
    required this.deleteSchedulingSessionLogic,
    required this.deleteTheCollaborationLogic,
    required this.deleteCapsuleArrangementLogic,
    required this.deleteSoloDocumentLogic,
    required this.checkForUnconsecratedCollaborationLogic,
    required this.collaborationLogicCoordinator,
    required this.checkIfCollaboratorHasDeletedArtifactsLogic,
    required this.updateHasDeletedArtifactsLogic,
  });

  @action
  checkIfCollaboratorHasDeletedArtifacts() async {
    final res = await checkIfCollaboratorHasDeletedArtifactsLogic(NoParams());
    res.fold(
      (failure) => errorUpdater(failure),
      (deleteStatus) => collaboratorHasDeletedArtifacts = deleteStatus,
    );
  }

  @action
  checkForUnconsecratedCollaboration() async {
    final res = await checkForUnconsecratedCollaborationLogic(NoParams());
    res.fold(
      (failure) => errorUpdater(failure),
      (infoEntity) {
        collaboratorInfo = infoEntity.collaboratorInfo;
        hasAnUnconsecratedCollabooration = infoEntity.hasOne;
      },
    );
  }

  @action
  deleteTheCollaboration() async {
    final res = await deleteTheCollaborationLogic(NoParams());
    res.fold((failure) => errorUpdater(failure),
        (deleteStatus) => collaborationIsDeleted = deleteStatus);
  }

  @action
  deleteSoloDocuments() async {
    final res = await deleteSoloDocumentLogic(DeleteSoloDocumentParams(
      ownerUID: collaboratorInfo.theUsersUID,
      collaboratorUID: collaboratorInfo.theCollaboratorsUID,
    ));
    res.fold(
      (failure) => errorUpdater(failure),
      (deleteStatus) => soloDocumentIsDeleted = deleteStatus,
    );
  }

  @action
  updateHasDeletedArtifacts() async {
    final res = await updateHasDeletedArtifactsLogic(true);
    res.fold(
      (failure) => errorUpdater(failure),
      (deleteStatus) => userHasDeletedArtifacts = deleteStatus,
    );
  }

  @override
  @action
  Future<void> call(NoParams params) async {
    state = StoreState.loading;
    await collaborationLogicCoordinator.exit();
    await deleteActiveNokhteSession(NoParams());
    // await checkForUnconsecratedCollaboration();
    // if (hasAnUnconsecratedCollabooration) {
    // await checkIfCollaboratorHasDeletedArtifacts();
    // await updateHasDeletedArtifacts();
    // await deleteSoloDocuments();
    // if (collaboratorHasDeletedArtifacts) {
    // await deleteTheCollaboration();
    // }
    // }
  }
}
