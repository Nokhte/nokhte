import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/data/data.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/purpose_session/domain/logic/logic.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'mobx/mobx.dart';

class DeleteUnconsecratedCollaborationsModule extends Module {
  @override
  List<Module> get imports => [
        LegacyConnectivityModule(),
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
    i.add<DeleteSchedulingSession>(() => DeleteSchedulingSession(
          contract:
              Modular.get<DeleteUnconsecratedCollaborationsContractImpl>(),
        ));
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
    i.add<CheckForUnconsecratedCollaborationStore>(
      () => CheckForUnconsecratedCollaborationStore(
        logic: Modular.get<CheckForUnconsecratedCollaboration>(),
      ),
    );
    i.add<DeleteUnconsecratedCollaborationsCoordinator>(
      () => DeleteUnconsecratedCollaborationsCoordinator(
        checkForUnconsecratedCollaboration:
            Modular.get<CheckForUnconsecratedCollaborationStore>(),
        deleteCollaborativeDocument: Modular.get<DeleteCollaborativeDocument>(),
        deleteSchedulingSession: Modular.get<DeleteSchedulingSession>(),
        deleteTheCollaboration: Modular.get<DeleteTheCollaboration>(),
        deleteCapsuleArrangement: Modular.get<DeleteCapsuleArrangement>(),
        deleteSoloDocument: Modular.get<DeleteSoloDocument>(),
      ),
    );
  }
}
