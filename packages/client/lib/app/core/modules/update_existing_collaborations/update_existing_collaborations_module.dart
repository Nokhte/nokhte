import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/data/contracts/update_existing_collaborations_contract_impl.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/data/sources/update_existing_collaborations_remote_source.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/domain/domain.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateExistingCollaborationsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<UpdateExistingCollaborationsRemoteSourceImpl>(
          (i) => UpdateExistingCollaborationsRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateExistingCollaborationsContractImpl>(
          (i) => UpdateExistingCollaborationsContractImpl(
            networkInfo: i<NetworkInfoImpl>(),
            remoteSource: i<UpdateExistingCollaborationsRemoteSource>(),
          ),
          export: true,
        ),
        Bind.singleton<ConsecrateTheCollaboration>(
          (i) => ConsecrateTheCollaboration(
            contract: i<UpdateExistingCollaborationsContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateCollaborationActivationStatus>(
          (i) => UpdateCollaborationActivationStatus(
            contract: i<UpdateExistingCollaborationsContract>(),
          ),
          export: true,
        ),
        Bind.singleton<ConsecrateTheCollaborationStore>(
          (i) => ConsecrateTheCollaborationStore(
            logic: i<ConsecrateTheCollaboration>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateCollaborationActivationStatusStore>(
          (i) => UpdateCollaborationActivationStatusStore(
            logic: i<UpdateCollaborationActivationStatus>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateExistingCollaborationsCoordinator>(
          (i) => UpdateExistingCollaborationsCoordinator(
            updateCollaborationActivationStatus:
                i<UpdateCollaborationActivationStatusStore>(),
            consecrateTheCollaboration: i<ConsecrateTheCollaborationStore>(),
          ),
          export: true,
        ),
      ];
}
