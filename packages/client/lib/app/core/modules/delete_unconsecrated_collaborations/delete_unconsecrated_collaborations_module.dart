import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/data/data.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/collaboration/collaboration_logic_module.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'mobx/mobx.dart';

class DeleteUnconsecratedCollaborationsModule extends Module {
  @override
  List<Module> get imports => [
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
    i.add<DeleteIrlActiveNokhteSession>(
      () => DeleteIrlActiveNokhteSession(
        contract: Modular.get<DeleteUnconsecratedCollaborationsContractImpl>(),
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
