import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'deep_links.dart';
export 'constants/constants.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'mobx/mobx.dart';

class DeepLinksModule extends Module {
  @override
  List<Module> get imports => [
        UserInformationModule(),
      ];

  @override
  void exportedBinds(i) {
    i.add<DeepLinksRemoteSourceImpl>(
      () => DeepLinksRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<DeepLinksContractImpl>(
      () => DeepLinksContractImpl(
        remoteSource: i<DeepLinksRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<GetDeepLinkURL>(
      () => GetDeepLinkURL(
        contract: i<DeepLinksContractImpl>(),
      ),
    );
    i.add<ListenForOpenedDeepLink>(
      () => ListenForOpenedDeepLink(
        contract: i<DeepLinksContractImpl>(),
      ),
    );
    i.add<InterpretCollaboratorCodeDeepLink>(
      () => InterpretCollaboratorCodeDeepLink(),
    );
    i.add<InterpretNokhteSessionDeepLink>(
      () => InterpretNokhteSessionDeepLink(),
    );
    i.add<ListenForOpenedDeepLinkStore>(
      () => ListenForOpenedDeepLinkStore(
        interpretNokhteSessionDeepLink: i<InterpretNokhteSessionDeepLink>(),
        userInformation: Modular.get<UserInformationCoordinator>(),
        logic: i<ListenForOpenedDeepLink>(),
        interpretCollaboratorCode: i<InterpretCollaboratorCodeDeepLink>(),
      ),
    );
    i.add<DeepLinksCoordinator>(
      () => DeepLinksCoordinator(
        getDeepLinkUrlLogic: i<GetDeepLinkURL>(),
        listenForOpenedDeepLinkStore: i<ListenForOpenedDeepLinkStore>(),
      ),
    );
  }
}
