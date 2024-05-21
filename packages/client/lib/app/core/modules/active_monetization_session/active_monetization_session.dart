import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity.dart';
import 'package:nokhte/app/core/modules/supabase/supabase.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
export 'data/data.dart';
import 'active_monetization_session.dart';
export 'domain/domain.dart';
export 'mobx/active_monetization_session_coordinator.dart';

class ActiveMonetizationSessionModule extends Module {
  @override
  List<Module> get imports => [
        SupabaseModule(),
        LegacyConnectivityModule(),
      ];

  @override
  void exportedBinds(Injector i) {
    i.add<ActiveMonetizationSessionRemoteSourceImpl>(
      () => ActiveMonetizationSessionRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<ActiveMonetizationSessionContractImpl>(
      () => ActiveMonetizationSessionContractImpl(
        remoteSource: i<ActiveMonetizationSessionRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );

    i.add<DeleteActiveMonetizationSession>(
      () => DeleteActiveMonetizationSession(
        contract: i<ActiveMonetizationSessionContractImpl>(),
      ),
    );
    i.add<DisposeExplanationCompletionStatusStream>(
      () => DisposeExplanationCompletionStatusStream(
        contract: i<ActiveMonetizationSessionContractImpl>(),
      ),
    );
    i.add<ListenToExplanationCompletionStatus>(
      () => ListenToExplanationCompletionStatus(
        contract: i<ActiveMonetizationSessionContractImpl>(),
      ),
    );
    i.add<StartMonetizationSession>(
      () => StartMonetizationSession(
        contract: i<ActiveMonetizationSessionContractImpl>(),
      ),
    );
    i.add<UpdateHasFinishedExplanation>(
      () => UpdateHasFinishedExplanation(
        contract: i<ActiveMonetizationSessionContractImpl>(),
      ),
    );
    i.add<ActiveMonetizationSessionCoordinator>(
      () => ActiveMonetizationSessionCoordinator(
        deleteActiveMonetizationSessionLogic:
            i<DeleteActiveMonetizationSession>(),
        disposeLogic: i<DisposeExplanationCompletionStatusStream>(),
        listenToExplanationCompletionStatusLogic:
            i<ListenToExplanationCompletionStatus>(),
        startMonetizationSessionLogic: i<StartMonetizationSession>(),
        updateHasFinishedExplanationLogic: i<UpdateHasFinishedExplanation>(),
      ),
    );
  }
}
