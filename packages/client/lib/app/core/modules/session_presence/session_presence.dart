import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity.dart';
import 'package:nokhte/app/core/modules/supabase/supabase.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'session_presence.dart';
export 'data/data.dart';
export 'types/types.dart';
export 'domain/domain.dart';
export 'mobx/mobx.dart';

class SessionPresenceModule extends Module {
  @override
  List<Module> get imports => [
        SupabaseModule(),
        LegacyConnectivityModule(),
      ];
  @override
  void exportedBinds(i) {
    i.add<SessionPresenceRemoteSourceImpl>(
      () => SessionPresenceRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<SessionPresenceContractImpl>(
      () => SessionPresenceContractImpl(
        remoteSource: i<SessionPresenceRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<StartTheSession>(
      () => StartTheSession(
        contract: i<SessionPresenceContractImpl>(),
      ),
    );
    i.add<GetStaticSessionMetadata>(
      () => GetStaticSessionMetadata(
        contract: i<SessionPresenceContractImpl>(),
      ),
    );
    i.add<GetSessionPresetInfo>(
      () => GetSessionPresetInfo(
        contract: i<SessionPresenceContractImpl>(),
      ),
    );
    i.add<ListenToSessionMetadata>(
      () => ListenToSessionMetadata(
        contract: i<SessionPresenceContractImpl>(),
      ),
    );
    i.add<UpdateCurrentPhase>(
      () => UpdateCurrentPhase(
        contract: i<SessionPresenceContractImpl>(),
      ),
    );
    i.add<CancelSessionMetadataStream>(
      () => CancelSessionMetadataStream(
        contract: i<SessionPresenceContractImpl>(),
      ),
    );
    i.add<UpdateOnlineStatus>(
      () => UpdateOnlineStatus(
        contract: i<SessionPresenceContractImpl>(),
      ),
    );
    i.add<GetInstructionType>(
      () => GetInstructionType(
        contract: i<SessionPresenceContractImpl>(),
      ),
    );
    i.add<UpdateWhoIsTalking>(
      () => UpdateWhoIsTalking(
        contract: i<SessionPresenceContractImpl>(),
      ),
    );
    i.add<AddContent>(
      () => AddContent(
        contract: i<SessionPresenceContractImpl>(),
      ),
    );
    i.add<CompleteTheSession>(
      () => CompleteTheSession(
        contract: i<SessionPresenceContractImpl>(),
      ),
    );
    i.addSingleton<SessionMetadataStore>(
      () => SessionMetadataStore(
        presetLogic: i<GetSessionPresetInfo>(),
        listenLogic: i<ListenToSessionMetadata>(),
        getterLogic: i<GetStaticSessionMetadata>(),
        getInstructionTypeLogic: i<GetInstructionType>(),
      ),
    );
    i.add<SessionPresenceCoordinator>(
      () => SessionPresenceCoordinator(
        updateWhoIsTalkingLogic: Modular.get<UpdateWhoIsTalking>(),
        addContentLogic: Modular.get<AddContent>(),
        completeTheSessionLogic: Modular.get<CompleteTheSession>(),
        cancelSessionMetadataStreamLogic: i<CancelSessionMetadataStream>(),
        updateCurrentPhaseLogic: i<UpdateCurrentPhase>(),
        sessionMetadataStore: i<SessionMetadataStore>(),
        updateOnlineStatusLogic: i<UpdateOnlineStatus>(),
        startTheSessionLogic: i<StartTheSession>(),
      ),
    );
  }
}
