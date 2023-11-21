import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/data/data.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/domain/domain.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/mobx/check_if_collaborator_is_talking_store.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/mobx/update_who_is_talking_store.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OneTalkerAtATimeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<OneTalkerAtATimeRemoteSourceImpl>(
          (i) => OneTalkerAtATimeRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
          export: true,
        ),
        Bind.singleton<OneTalkerAtATimeContractImpl>(
          (i) => OneTalkerAtATimeContractImpl(
            remoteSource: i<OneTalkerAtATimeRemoteSource>(),
            networkInfo: i<NetworkInfoImpl>(),
          ),
          export: true,
        ),
        Bind.singleton<CheckIfCollaboratorIsTalking>(
          (i) => CheckIfCollaboratorIsTalking(
            contract: i<OneTalkerAtATimeContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateWhoIsTalking>(
          (i) => UpdateWhoIsTalking(
            contract: i<OneTalkerAtATimeContract>(),
          ),
          export: true,
        ),
        Bind.singleton<UpdateWhoIsTalkingStore>(
          (i) => UpdateWhoIsTalkingStore(
            logic: i<UpdateWhoIsTalking>(),
          ),
          export: true,
        ),
        Bind.singleton<CheckIfCollaboratorIsTalkingStore>(
          (i) => CheckIfCollaboratorIsTalkingStore(
            logic: i<CheckIfCollaboratorIsTalking>(),
          ),
          export: true,
        ),
      ];
}
