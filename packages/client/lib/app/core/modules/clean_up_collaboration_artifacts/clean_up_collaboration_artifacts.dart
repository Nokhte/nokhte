import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'clean_up_collaboration_artifacts.dart';
export './data/data.dart';
export './domain/domain.dart';
export './mobx/mobx.dart';

class CleanUpCollaborationArtifactsModule extends Module {
  @override
  List<Module> get imports => [
        SessionStartersLogicModule(),
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
    i.add<CleanUpNokhteSession>(
      () => CleanUpNokhteSession(
        contract: Modular.get<CleanUpCollaborationArtifactsContractImpl>(),
      ),
    );
    i.add<CleanUpCollaborationArtifactsCoordinator>(
      () => CleanUpCollaborationArtifactsCoordinator(
        sessionStarters: i<SessionStartersLogicCoordinator>(),
        cleanUpNokhteSession: Modular.get<CleanUpNokhteSession>(),
      ),
    );
  }
}
