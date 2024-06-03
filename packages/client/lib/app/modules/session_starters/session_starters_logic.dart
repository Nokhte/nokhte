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
    i.add<CancelSessionActivationStream>(
      () => CancelSessionActivationStream(
        contract: Modular.get<SessionStartersContractImpl>(),
      ),
    );
    i.add<InitializeSession>(
      () => InitializeSession(
        contract: Modular.get<SessionStartersContractImpl>(),
      ),
    );
    i.add<JoinSession>(
      () => JoinSession(
        contract: Modular.get<SessionStartersContractImpl>(),
      ),
    );
    i.add<ListenToSessionActivationStatus>(
      () => ListenToSessionActivationStatus(
        contract: Modular.get<SessionStartersContractImpl>(),
      ),
    );
    i.add<NukeSession>(
      () => NukeSession(
        contract: Modular.get<SessionStartersContractImpl>(),
      ),
    );

    i.add<SessionStartersLogicCoordinator>(
        () => SessionStartersLogicCoordinator(
              cancelStreamLogic: Modular.get<CancelSessionActivationStream>(),
              initializeSessionLogic: Modular.get<InitializeSession>(),
              joinSessionLogic: Modular.get<JoinSession>(),
              listenToSessionActivationLogic:
                  Modular.get<ListenToSessionActivationStatus>(),
              nukeSessionLogic: Modular.get<NukeSession>(),
            ));
  }
}
