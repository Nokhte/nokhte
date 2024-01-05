import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/user_information/data/data.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserInformationModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addSingleton<UserInformationRemoteSourceImpl>(
      () => UserInformationRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.addSingleton<HomeContractImpl>(
      () => HomeContractImpl(
        remoteSource: i<UserInformationRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.addSingleton<GetUserInfo>(
      () => GetUserInfo(
        contract: i<HomeContractImpl>(),
      ),
    );
    i.addSingleton<UpdateHasGoneThroughInvitationFlow>(
      () => UpdateHasGoneThroughInvitationFlow(
        contract: i<HomeContractImpl>(),
      ),
    );
    i.addSingleton<UpdateHasSentAnInvitation>(
      () => UpdateHasSentAnInvitation(
        contract: i<HomeContractImpl>(),
      ),
    );
    i.add<GetUserInfoStore>(
      () => GetUserInfoStore(
        logic: i<GetUserInfo>(),
      ),
    );
    i.add<UpdateHasGoneThroughInvitationFlowStore>(
      () => UpdateHasGoneThroughInvitationFlowStore(
        logic: i<UpdateHasGoneThroughInvitationFlow>(),
      ),
    );
    i.add<UpdateHasSentAnInvitationStore>(
      () => UpdateHasSentAnInvitationStore(
        logic: i<UpdateHasSentAnInvitation>(),
      ),
    );
    i.add<UserInformationCoordinator>(
      () => UserInformationCoordinator(
        getUserInfo: i<GetUserInfoStore>(),
        updateHasGoneThroughInvitationFlow:
            i<UpdateHasGoneThroughInvitationFlowStore>(),
        updateHasSentAnInvitation: i<UpdateHasSentAnInvitationStore>(),
      ),
    );
  }
}
