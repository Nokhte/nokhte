import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity.dart';
import 'package:nokhte/app/core/modules/supabase/supabase.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'session_starters.dart';

class SessionStartersLogicModule extends Module {
  @override
  List<Module> get imports => [
        LegacyConnectivityModule(),
        SupabaseModule(),
      ];

  @override
  void exportedBinds(Injector i) {
    i.add<SessionStartersRemoteSourceImpl>(
      () => SessionStartersRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );

    i.add<SessionStartersContractImpl>(
      () => SessionStartersContractImpl(
        remoteSource: i<SessionStartersRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );

    i.add<CancelNokhteSessionSearchStream>(
      () => CancelNokhteSessionSearchStream(
        contract: i<SessionStartersContractImpl>(),
      ),
    );
    i.add<GetNokhteSessionSearchStatus>(
      () => GetNokhteSessionSearchStatus(
        contract: i<SessionStartersContractImpl>(),
      ),
    );
    i.add<EnterCollaboratorPool>(
      () => EnterCollaboratorPool(
        contract: i<SessionStartersContractImpl>(),
      ),
    );
    i.add<ExitCollaboratorPool>(
      () => ExitCollaboratorPool(
        contract: i<SessionStartersContractImpl>(),
      ),
    );
    i.add<SessionStartersLogicCoordinator>(
      () => SessionStartersLogicCoordinator(
        getNokhteSessionSearchStatusLogic:
            Modular.get<GetNokhteSessionSearchStatus>(),
        cancelNokhteSessionSearchStreamLogic:
            i<CancelNokhteSessionSearchStream>(),
        enterCollaboratorPoolLogic: i<EnterCollaboratorPool>(),
        exitCollaboratorPoolLogic: i<ExitCollaboratorPool>(),
      ),
    );
  }
}
