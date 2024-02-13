import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/supabase/supabase_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/collaboration/data/data.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CollaborationLogicModule extends Module {
  @override
  List<Module> get imports => [
        LegacyConnectivityModule(),
        SupabaseModule(),
      ];

  @override
  void exportedBinds(Injector i) {
    i.add<CollaborationRemoteSourceImpl>(
      () => CollaborationRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );

    i.add<CollaborationContractImpl>(
      () => CollaborationContractImpl(
        remoteSource: i<CollaborationRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );

    i.add<CancelCollaboratorSearchStream>(
      () => CancelCollaboratorSearchStream(
        contract: i<CollaborationContractImpl>(),
      ),
    );
    i.add<GetNokhteSessionSearchStatus>(
      () => GetNokhteSessionSearchStatus(
        contract: i<CollaborationContractImpl>(),
      ),
    );
    i.add<EnterCollaboratorPool>(
      () => EnterCollaboratorPool(
        contract: i<CollaborationContractImpl>(),
      ),
    );
    i.add<ExitCollaboratorPool>(
      () => ExitCollaboratorPool(
        contract: i<CollaborationContractImpl>(),
      ),
    );
    i.add<GetCollaboratorSearchStatus>(
      () => GetCollaboratorSearchStatus(
        contract: i<CollaborationContractImpl>(),
      ),
    );
    i.add<CollaborationLogicCoordinator>(
      () => CollaborationLogicCoordinator(
        getNokhteSessionSearchStatusLogic:
            Modular.get<GetNokhteSessionSearchStatus>(),
        cancelCollaboratorSearchStreamLogic:
            i<CancelCollaboratorSearchStream>(),
        enterCollaboratorPoolLogic: i<EnterCollaboratorPool>(),
        exitCollaboratorPoolLogic: i<ExitCollaboratorPool>(),
        getCollaboratorSearchStatusLogic: i<GetCollaboratorSearchStatus>(),
      ),
    );
  }
}
