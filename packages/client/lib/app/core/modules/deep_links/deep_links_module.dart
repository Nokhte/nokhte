import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/data/contracts/deep_links_contract_impl.dart';
import 'package:nokhte/app/core/modules/deep_links/data/sources/deep_links_remote_source.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeepLinksModule extends Module {
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
    i.add<GetLatestOpenedDeepLink>(
      () => GetLatestOpenedDeepLink(
        contract: i<DeepLinksContractImpl>(),
      ),
    );
    i.add<SendDeepLink>(
      () => SendDeepLink(
        contract: i<DeepLinksContractImpl>(),
      ),
    );
    i.add<GetDeepLinkURLStore>(
      () => GetDeepLinkURLStore(
        logic: i<GetDeepLinkURL>(),
      ),
    );
    i.add<GetLatestOpenedDeepLinkStore>(
      () => GetLatestOpenedDeepLinkStore(
        logic: i<GetLatestOpenedDeepLink>(),
      ),
    );
    i.add<SendDeepLinkStore>(
      () => SendDeepLinkStore(
        logic: i<SendDeepLink>(),
      ),
    );
    i.add<DeepLinksCoordinator>(
      () => DeepLinksCoordinator(
        getDeepLinkURL: i<GetDeepLinkURLStore>(),
        getLatestOpenedDeepLink: i<GetLatestOpenedDeepLinkStore>(),
        sendDeepLink: i<SendDeepLinkStore>(),
      ),
    );
  }
}
