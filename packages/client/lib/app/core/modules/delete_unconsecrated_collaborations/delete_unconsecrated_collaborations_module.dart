import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/data/data.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/collaboration/collaboration_logic_module.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:nokhte/app/modules/purpose_session/domain/logic/logic.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'mobx/mobx.dart';

class DeleteUnconsecratedCollaborationsModule extends Module {
  @override
  List<Module> get imports => [
        LegacyConnectivityModule(),
        CollaborationLogicModule(),
      ];
  @override
  void exportedBinds(i) {
    i.add<DeleteUnconsecratedCollaborationsRemoteSourceImpl>(
      () => DeleteUnconsecratedCollaborationsRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<DeleteUnconsecratedCollaborationsContractImpl>(
      () => DeleteUnconsecratedCollaborationsContractImpl(
        remoteSource:
            Modular.get<DeleteUnconsecratedCollaborationsRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<CheckForUnconsecratedCollaboration>(
      () => CheckForUnconsecratedCollaboration(
        contract: Modular.get<DeleteUnconsecratedCollaborationsContractImpl>(),
      ),
    );

    i.add<CheckIfCollaboratorHasDeletedArtifacts>(
      () => CheckIfCollaboratorHasDeletedArtifacts(
        contract: Modular.get<DeleteUnconsecratedCollaborationsContractImpl>(),
      ),
    );
    i.add<DeleteActiveNokhteSession>(
      () => DeleteActiveNokhteSession(
        contract: Modular.get<DeleteUnconsecratedCollaborationsContractImpl>(),
      ),
    );

    i.add<DeleteCapsuleArrangement>(
      () => DeleteCapsuleArrangement(
        contract: Modular.get<DeleteUnconsecratedCollaborationsContractImpl>(),
      ),
    );
    i.add<DeleteCollaborativeDocument>(
      () => DeleteCollaborativeDocument(
        contract: Modular.get<DeleteUnconsecratedCollaborationsContractImpl>(),
      ),
    );
    i.add<DeleteSchedulingSession>(
      () => DeleteSchedulingSession(
        contract: Modular.get<DeleteUnconsecratedCollaborationsContractImpl>(),
      ),
    );
    i.add<UpdateHasDeletedArtifacts>(
      () => UpdateHasDeletedArtifacts(
        contract: Modular.get<DeleteUnconsecratedCollaborationsContractImpl>(),
      ),
    );
    i.add<DeleteSoloDocument>(
      () => DeleteSoloDocument(
        contract: Modular.get<DeleteUnconsecratedCollaborationsContractImpl>(),
      ),
    );
    i.add<DeleteTheCollaboration>(
      () => DeleteTheCollaboration(
        contract: Modular.get<DeleteUnconsecratedCollaborationsContractImpl>(),
      ),
    );
    i.add<CheckIfUserHasTheQuestionStore>(
      () => CheckIfUserHasTheQuestionStore(
        logic: Modular.get<CheckIfUserHasTheQuestion>(),
      ),
    );
    i.add<DeleteUnconsecratedCollaborationsCoordinator>(
      () => DeleteUnconsecratedCollaborationsCoordinator(
        deleteActiveNokhteSession: Modular.get<DeleteActiveNokhteSession>(),
        updateHasDeletedArtifactsLogic:
            Modular.get<UpdateHasDeletedArtifacts>(),
        checkIfCollaboratorHasDeletedArtifactsLogic:
            Modular.get<CheckIfCollaboratorHasDeletedArtifacts>(),
        collaborationLogicCoordinator:
            Modular.get<CollaborationLogicCoordinator>(),
        checkForUnconsecratedCollaborationLogic:
            Modular.get<CheckForUnconsecratedCollaboration>(),
        deleteCollaborativeDocumentLogic:
            Modular.get<DeleteCollaborativeDocument>(),
        deleteSchedulingSessionLogic: Modular.get<DeleteSchedulingSession>(),
        deleteTheCollaborationLogic: Modular.get<DeleteTheCollaboration>(),
        deleteCapsuleArrangementLogic: Modular.get<DeleteCapsuleArrangement>(),
        deleteSoloDocumentLogic: Modular.get<DeleteSoloDocument>(),
      ),
    );
  }
}
