import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/supabase/supabase_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/irl_active_nokhte_sessions/types/types.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';

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
    i.add<BasePresenceContractImpl<IrlNokhteSessionMetadata>>(
      () => BasePresenceContractImpl<IrlNokhteSessionMetadata>(
        remoteSource: i<IrlNokhteSessionPresenceRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<BaseGetSessionMetadata<IrlNokhteSessionMetadata>>(
      () => BaseGetSessionMetadata<IrlNokhteSessionMetadata>(
        contract: i<BasePresenceContractImpl<IrlNokhteSessionMetadata>>(),
      ),
    );
    i.add<UpdateCurrentPhase>(
      () => UpdateCurrentPhase(
        contract: i<BasePresenceContractImpl<IrlNokhteSessionMetadata>>(),
      ),
    );
    i.add<CancelSessionMetadataStream>(
      () => CancelSessionMetadataStream(
        contract: i<BasePresenceContractImpl<IrlNokhteSessionMetadata>>(),
      ),
    );
    i.add<UpdateOnlineStatus>(
      () => UpdateOnlineStatus(
        contract: i<BasePresenceContractImpl<IrlNokhteSessionMetadata>>(),
      ),
    );
    i.add<UpdateWhoIsTalking>(
      () => UpdateWhoIsTalking(
        contract: i<BasePresenceContractImpl<IrlNokhteSessionMetadata>>(),
      ),
    );
    i.addSingleton<GetIrlNokhteSessionMetadataStore>(
      () => GetIrlNokhteSessionMetadataStore(
        logic: i<BaseGetSessionMetadata<IrlNokhteSessionMetadata>>(),
      ),
    );
    i.add<NokhteBlurStore>(
      () => NokhteBlurStore(),
    );
    i.add<IrlNokhteSessionPresenceCoordinator>(
      () => IrlNokhteSessionPresenceCoordinator(
        blur: Modular.get<NokhteBlurStore>(),
        cancelSessionMetadataStreamLogic: i<CancelSessionMetadataStream>(),
        updateCurrentPhaseLogic: i<UpdateCurrentPhase>(),
        getSessionMetadataStore: i<GetIrlNokhteSessionMetadataStore>(),
        updateOnlineStatusLogic: i<UpdateOnlineStatus>(),
        updateWhoIsTalkingLogic: i<UpdateWhoIsTalking>(),
      ),
    );
  }
}
