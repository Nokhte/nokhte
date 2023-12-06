import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/data/contracts/existing_collaborations_contract_impl.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/data/sources/existing_collaborations_remote_source.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/domain/domain.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExistingCollaborationsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<ExistingCollaborationsRemoteSourceImpl>(
          (i) => ExistingCollaborationsRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
          export: true,
        ),
        Bind.singleton<ExistingCollaborationsContractImpl>(
          (i) => ExistingCollaborationsContractImpl(
            networkInfo: i<NetworkInfoImpl>(),
            remoteSource: i<ExistingCollaborationsRemoteSource>(),
          ),
          export: true,
        ),
        Bind.singleton<ConsecrateTheCollaboration>(
          (i) => ConsecrateTheCollaboration(
            contract: i<ExistingCollaborationsContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateCollaborationActivationStatus>(
          (i) => UpdateCollaborationActivationStatus(
            contract: i<ExistingCollaborationsContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateIndividualCollaboratorEntryStatus>(
          (i) => UpdateIndividualCollaboratorEntryStatus(
            contract: i<ExistingCollaborationsContract>(),
          ),
          export: true,
        ),
        Bind.singleton<CheckIfUserHasTheQuestion>(
          (i) => CheckIfUserHasTheQuestion(
            contract: i<ExistingCollaborationsContract>(),
          ),
          export: true,
        ),
        Bind.singleton<ConsecrateTheCollaborationStore>(
          (i) => ConsecrateTheCollaborationStore(
            logic: i<ConsecrateTheCollaboration>(),
          ),
          export: true,
        ),
        Bind.singleton<CheckIfUserHasTheQuestionStore>(
          (i) => CheckIfUserHasTheQuestionStore(
            logic: i<CheckIfUserHasTheQuestion>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateCollaborationActivationStatusStore>(
          (i) => UpdateCollaborationActivationStatusStore(
            logic: i<UpdateCollaborationActivationStatus>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateIndividualCollaboratorEntryStatusStore>(
          (i) => UpdateIndividualCollaboratorEntryStatusStore(
            logic: i<UpdateIndividualCollaboratorEntryStatus>(),
          ),
          export: true,
        ),
        Bind.singleton<ExistingCollaborationsCoordinator>(
          (i) => ExistingCollaborationsCoordinator(
            checkIfUserHasTheQuestion: i<CheckIfUserHasTheQuestionStore>(),
            updateIndividualCollaboratorEntryStatus:
                i<UpdateIndividualCollaboratorEntryStatusStore>(),
            updateCollaborationActivationStatus:
                i<UpdateCollaborationActivationStatusStore>(),
            consecrateTheCollaboration: i<ConsecrateTheCollaborationStore>(),
          ),
          export: true,
        ),
      ];
}
