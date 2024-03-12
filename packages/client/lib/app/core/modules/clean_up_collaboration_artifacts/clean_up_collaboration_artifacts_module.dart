import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/data/data.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/collaboration/collaboration_logic_module.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'mobx/mobx.dart';

class CleanUpCollaborationArtifactsModule extends Module {
  @override
  List<Module> get imports => [
        CollaborationLogicModule(),
      ];
  @override
  void exportedBinds(i) {
    i.add<CleanUpCollaborationArtifactsRemoteSourceImpl>(
      () => CleanUpCollaborationArtifactsRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<CleanUpCollaborationArtifactsContractImpl>(
      () => CleanUpCollaborationArtifactsContractImpl(
        remoteSource:
            Modular.get<CleanUpCollaborationArtifactsRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<DeleteIrlActiveNokhteSession>(
      () => DeleteIrlActiveNokhteSession(
        contract: Modular.get<CleanUpCollaborationArtifactsContractImpl>(),
      ),
    );
    i.add<DeleteUnconsecratedCollaborationsCoordinator>(
      () => DeleteUnconsecratedCollaborationsCoordinator(
        collaborationLogicCoordinator: i<CollaborationLogicCoordinator>(),
        deleteIrlActiveNokhteSession:
            Modular.get<DeleteIrlActiveNokhteSession>(),
      ),
    );
  }
}
