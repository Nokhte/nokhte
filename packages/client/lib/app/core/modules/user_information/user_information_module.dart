import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/user_information/data/data.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserInformationModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<UserInformationRemoteSourceImpl>(
      () => UserInformationRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<UserInformationContractImpl>(
      () => UserInformationContractImpl(
        remoteSource: i<UserInformationRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<GetUserInfo>(
      () => GetUserInfo(
        contract: i<UserInformationContractImpl>(),
      ),
    );
    i.add<UpdateHasGoneThroughInvitationFlow>(
      () => UpdateHasGoneThroughInvitationFlow(
        contract: i<UserInformationContractImpl>(),
      ),
    );
    i.add<UpdateHasSentAnInvitation>(
      () => UpdateHasSentAnInvitation(
        contract: i<UserInformationContractImpl>(),
      ),
    );
    i.add<UpdateWantsToRepeatInvitationFlow>(
      () => UpdateWantsToRepeatInvitationFlow(
        contract: i<UserInformationContractImpl>(),
      ),
    );

    i.add<GetUserInfoStore>(
      () => GetUserInfoStore(
        logic: i<GetUserInfo>(),
      ),
    );
    i.add<UserInformationCoordinator>(
      () => UserInformationCoordinator(
        getUserInfo: i<GetUserInfoStore>(),
        updateHasGoneThroughInvitationFlowLogic:
            i<UpdateHasGoneThroughInvitationFlow>(),
        updateHasSentAnInvitationLogic: i<UpdateHasSentAnInvitation>(),
        updateWantsToRepeatInvitationFlowLogic:
            i<UpdateWantsToRepeatInvitationFlow>(),
      ),
    );
  }
}
