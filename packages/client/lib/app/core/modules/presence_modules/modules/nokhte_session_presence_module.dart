import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/supabase/supabase_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/active_nokhte_sessions/types/types.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'nokhte_session_presence/nokhte_session_presence_remote_source.dart';
import 'purpose_session_presence/purpose_session_presence.dart';
import 'shared/shared.dart';

class NokhteSessionPresenceModule extends Module {
  @override
  List<Module> get imports => [
        SupabaseModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<NokhteSessionPresenceRemoteSourceImpl>(
      () => NokhteSessionPresenceRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<BasePresenceContractImpl>(
      () => BasePresenceContractImpl(
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
        contract: i<BasePresenceContractImpl>(),
      ),
    );
    i.add<CancelSessionMetadataStream>(
      () => CancelSessionMetadataStream(
        contract: i<BasePresenceContractImpl>(),
      ),
    );
    i.add<UpdateOnlineStatus>(
      () => UpdateOnlineStatus(
        contract: i<BasePresenceContractImpl>(),
      ),
    );
    i.add<UpdateWhoIsTalking>(
      () => UpdateWhoIsTalking(
        contract: i<BasePresenceContractImpl>(),
      ),
    );
    i.add<GetSessionMetadataStore>(
      () => GetSessionMetadataStore(
        logic: i<BaseGetSessionMetadata<CollaborationSessionMetadata>>(),
      ),
    );
    i.add<NokhteBlurStore>(
      () => NokhteBlurStore(),
    );
    i.add<BasePresenceCoordinator>(
      () => BasePresenceCoordinator(
        blur: i<NokhteBlurStore>(),
        cancelSessionMetadataStreamLogic: i<CancelSessionMetadataStream>(),
        updateCurrentPhaseLogic: i<UpdateCurrentPhase>(),
        getSessionMetadataStore: i<GetSessionMetadataStore>(),
        updateOnlineStatusLogic: i<UpdateOnlineStatus>(),
        updateWhoIsTalkingLogic: i<UpdateWhoIsTalking>(),
      ),
    );
  }
}
