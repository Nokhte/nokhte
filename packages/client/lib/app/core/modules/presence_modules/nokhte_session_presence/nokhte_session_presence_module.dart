import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/supabase/supabase_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_nokhte_sessions/types/types.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';

class NokhteSessionPresenceModule extends Module {
  @override
  List<Module> get imports => [
        SupabaseModule(),
        LegacyConnectivityModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<NokhteSessionPresenceRemoteSourceImpl>(
      () => NokhteSessionPresenceRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<BasePresenceContractImpl<NokhteSessionMetadata>>(
      () => BasePresenceContractImpl<NokhteSessionMetadata>(
        remoteSource: i<NokhteSessionPresenceRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<BaseGetSessionMetadata<NokhteSessionMetadata>>(
      () => BaseGetSessionMetadata<NokhteSessionMetadata>(
        contract: i<BasePresenceContractImpl<NokhteSessionMetadata>>(),
      ),
    );
    i.add<UpdateCurrentPhase>(
      () => UpdateCurrentPhase(
        contract: i<BasePresenceContractImpl<NokhteSessionMetadata>>(),
      ),
    );
    i.add<CancelSessionMetadataStream>(
      () => CancelSessionMetadataStream(
        contract: i<BasePresenceContractImpl<NokhteSessionMetadata>>(),
      ),
    );
    i.add<UpdateOnlineStatus>(
      () => UpdateOnlineStatus(
        contract: i<BasePresenceContractImpl<NokhteSessionMetadata>>(),
      ),
    );
    i.add<UpdateWhoIsTalking>(
      () => UpdateWhoIsTalking(
        contract: i<BasePresenceContractImpl<NokhteSessionMetadata>>(),
      ),
    );
    i.addSingleton<GetNokhteSessionMetadataStore>(
      () => GetNokhteSessionMetadataStore(
        logic: i<BaseGetSessionMetadata<NokhteSessionMetadata>>(),
      ),
    );
    i.add<NokhteBlurStore>(
      () => NokhteBlurStore(),
    );
    i.add<NokhteSessionPresenceCoordinator>(
      () => NokhteSessionPresenceCoordinator(
        blur: Modular.get<NokhteBlurStore>(),
        cancelSessionMetadataStreamLogic: i<CancelSessionMetadataStream>(),
        updateCurrentPhaseLogic: i<UpdateCurrentPhase>(),
        getSessionMetadataStore: i<GetNokhteSessionMetadataStore>(),
        updateOnlineStatusLogic: i<UpdateOnlineStatus>(),
        updateWhoIsTalkingLogic: i<UpdateWhoIsTalking>(),
      ),
    );
  }
}
