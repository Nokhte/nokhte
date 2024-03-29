import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/presence_modules/irl_nokhte_session_presence/data/contract/irl_nokhte_session_presence_contract_impl.dart';
import 'package:nokhte/app/core/modules/supabase/supabase_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_irl_nokhte_sessions/types/types.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';

import 'domain/domain.dart';

class IrlNokhteSessionPresenceModule extends Module {
  @override
  List<Module> get imports => [
        SupabaseModule(),
        LegacyConnectivityModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<IrlNokhteSessionPresenceRemoteSourceImpl>(
      () => IrlNokhteSessionPresenceRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<IrlNokhteSessionPresenceContractImpl>(
      () => IrlNokhteSessionPresenceContractImpl(
        remoteSource: i<IrlNokhteSessionPresenceRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<BaseGetSessionMetadata<IrlNokhteSessionMetadata>>(
      () => BaseGetSessionMetadata<IrlNokhteSessionMetadata>(
        contract: i<IrlNokhteSessionPresenceContractImpl>(),
      ),
    );
    i.add<UpdateCurrentPhase>(
      () => UpdateCurrentPhase(
        contract: i<IrlNokhteSessionPresenceContractImpl>(),
      ),
    );
    i.add<CancelSessionMetadataStream>(
      () => CancelSessionMetadataStream(
        contract: i<IrlNokhteSessionPresenceContractImpl>(),
      ),
    );
    i.add<UpdateOnlineStatus>(
      () => UpdateOnlineStatus(
        contract: i<IrlNokhteSessionPresenceContractImpl>(),
      ),
    );
    i.add<UpdateWhoIsTalking>(
      () => UpdateWhoIsTalking(
        contract: i<IrlNokhteSessionPresenceContractImpl>(),
      ),
    );
    i.add<AddContent>(
      () => AddContent(
        contract: i<IrlNokhteSessionPresenceContractImpl>(),
      ),
    );
    i.add<CompleteTheSession>(
      () => CompleteTheSession(
        contract: i<IrlNokhteSessionPresenceContractImpl>(),
      ),
    );
    i.add<UpdateHasGyroscope>(
      () => UpdateHasGyroscope(
        contract: i<IrlNokhteSessionPresenceContractImpl>(),
      ),
    );
    i.addSingleton<GetIrlNokhteSessionMetadataStore>(
      () => GetIrlNokhteSessionMetadataStore(
        logic: i<BaseGetSessionMetadata<IrlNokhteSessionMetadata>>(),
      ),
    );
    i.add<IrlNokhteSessionPresenceCoordinator>(
      () => IrlNokhteSessionPresenceCoordinator(
        updateHasGyroscopeLogic: Modular.get<UpdateHasGyroscope>(),
        addContentLogic: Modular.get<AddContent>(),
        completeTheSessionLogic: Modular.get<CompleteTheSession>(),
        cancelSessionMetadataStreamLogic: i<CancelSessionMetadataStream>(),
        updateCurrentPhaseLogic: i<UpdateCurrentPhase>(),
        getSessionMetadataStore: i<GetIrlNokhteSessionMetadataStore>(),
        updateOnlineStatusLogic: i<UpdateOnlineStatus>(),
      ),
    );
  }
}
