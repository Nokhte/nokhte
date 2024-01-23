import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/data/contracts/deep_links_contract_impl.dart';
import 'package:nokhte/app/core/modules/deep_links/data/sources/deep_links_remote_source.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/coordinators/user_information_coordinator.dart';
import 'package:nokhte/app/core/modules/user_information/user_information_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    i.add<SendDeepLink>(
      () => SendDeepLink(
        contract: i<DeepLinksContractImpl>(),
      ),
    );
    i.add<ListenForOpenedDeepLinkStore>(
      () => ListenForOpenedDeepLinkStore(
        userInformation: Modular.get<UserInformationCoordinator>(),
        logic: i<ListenForOpenedDeepLink>(),
        interpretCollaboratorCode: i<InterpretCollaboratorCodeDeepLink>(),
      ),
    );
    i.add<DeepLinksCoordinator>(
      () => DeepLinksCoordinator(
        getDeepLinkUrlLogic: i<GetDeepLinkURL>(),
        listenForOpenedDeepLinkStore: i<ListenForOpenedDeepLinkStore>(),
        sendDeepLinkLogic: i<SendDeepLink>(),
      ),
    );
  }
}
