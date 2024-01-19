import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/supabase/supabase_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'domain/domain.dart';
import 'mobx/mobx.dart';
import 'data/data.dart';

class CollaboratorPresenceModule extends Module {
  @override
  List<Module> get imports => [
        SupabaseModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<CollaboratorPresenceRemoteSourceImpl>(
      () => CollaboratorPresenceRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<CollaboratorPresenceContractImpl>(
      () => CollaboratorPresenceContractImpl(
        remoteSource: i<CollaboratorPresenceRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<GetSessionMetadata>(
      () => GetSessionMetadata(
        contract: i<CollaboratorPresenceContractImpl>(),
      ),
    );
    i.add<UpdateCurrentPhase>(
      () => UpdateCurrentPhase(
        contract: i<CollaboratorPresenceContractImpl>(),
      ),
    );
    i.add<UpdateOnCallStatus>(
      () => UpdateOnCallStatus(
        contract: i<CollaboratorPresenceContractImpl>(),
      ),
    );
    i.add<UpdateOnlineStatus>(
      () => UpdateOnlineStatus(
        contract: i<CollaboratorPresenceContractImpl>(),
      ),
    );
    i.add<UpdateTimerStatus>(
      () => UpdateTimerStatus(
        contract: i<CollaboratorPresenceContractImpl>(),
      ),
    );
    i.add<UpdateWhoIsTalking>(
      () => UpdateWhoIsTalking(
        contract: i<CollaboratorPresenceContractImpl>(),
      ),
    );
    i.add<GetSessionMetadataStore>(
      () => GetSessionMetadataStore(
        logic: i<GetSessionMetadata>(),
      ),
    );
    i.add<UpdateCurrentPhaseStore>(
      () => UpdateCurrentPhaseStore(
        logic: i<UpdateCurrentPhase>(),
      ),
    );

    i.add<UpdateOnCallStatusStore>(
      () => UpdateOnCallStatusStore(
        logic: i<UpdateOnCallStatus>(),
      ),
    );
    i.add<UpdateOnlineStatusStore>(
      () => UpdateOnlineStatusStore(
        logic: i<UpdateOnlineStatus>(),
      ),
    );
    i.add<UpdateTimerStatusStore>(
      () => UpdateTimerStatusStore(
        logic: i<UpdateTimerStatus>(),
      ),
    );
    i.add<UpdateWhoIsTalkingStore>(
      () => UpdateWhoIsTalkingStore(
        logic: i<UpdateWhoIsTalking>(),
      ),
    );
    i.add<CollaboratorPresenceCoordinator>(
      () => CollaboratorPresenceCoordinator(
        updateCurrentPhase: i<UpdateCurrentPhaseStore>(),
        getSessionMetadata: i<GetSessionMetadataStore>(),
        updateOnCallStatus: i<UpdateOnCallStatusStore>(),
        updateOnlineStatus: i<UpdateOnlineStatusStore>(),
        updateTimerStatus: i<UpdateTimerStatusStore>(),
        updateWhoIsTalking: i<UpdateWhoIsTalkingStore>(),
      ),
    );
  }
}
