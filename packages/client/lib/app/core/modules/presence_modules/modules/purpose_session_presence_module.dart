import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/supabase/supabase_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'purpose_session_presence/purpose_session_presence.dart';
export 'purpose_session_presence/purpose_session_presence.dart';
import 'shared/shared.dart';

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
    i.add<PurposeSessionPresenceContractImpl>(
      () => PurposeSessionPresenceContractImpl(
        remoteSource: i<CollaboratorPresenceRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<BaseGetSessionMetadata<CollaborationSessionMetadata>>(
      () => BaseGetSessionMetadata<CollaborationSessionMetadata>(
        contract: i<PurposeSessionPresenceContractImpl>(),
      ),
    );
    i.add<UpdateCurrentPhase>(
      () => UpdateCurrentPhase(
        contract: i<PurposeSessionPresenceContractImpl>(),
      ),
    );
    i.add<CancelSessionMetadataStream>(
      () => CancelSessionMetadataStream(
        contract: i<PurposeSessionPresenceContractImpl>(),
      ),
    );
    i.add<UpdateOnlineStatus>(
      () => UpdateOnlineStatus(
        contract: i<PurposeSessionPresenceContractImpl>(),
      ),
    );
    i.add<UpdateTimerStatus>(
      () => UpdateTimerStatus(
        contract: i<PurposeSessionPresenceContractImpl>(),
      ),
    );
    i.add<UpdateWhoIsTalking>(
      () => UpdateWhoIsTalking(
        contract: i<PurposeSessionPresenceContractImpl>(),
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
    i.add<CollaboratorPresenceCoordinator>(
      () => CollaboratorPresenceCoordinator(
        blur: i<NokhteBlurStore>(),
        cancelSessionMetadataStreamLogic: i<CancelSessionMetadataStream>(),
        updateCurrentPhaseLogic: i<UpdateCurrentPhase>(),
        getSessionMetadataStore: i<GetSessionMetadataStore>(),
        updateOnlineStatusLogic: i<UpdateOnlineStatus>(),
        updateTimerStatusLogic: i<UpdateTimerStatus>(),
        updateWhoIsTalkingLogic: i<UpdateWhoIsTalking>(),
      ),
    );
  }
}
