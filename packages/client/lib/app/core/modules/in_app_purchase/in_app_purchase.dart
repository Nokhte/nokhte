import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'in_app_purchase.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'mobx/in_app_purchase_coordinator.dart';

class InAppPurchaseModule extends Module {
  @override
  List<Module> get imports => [
        LegacyConnectivityModule(),
      ];
  @override
  void exportedBinds(i) {
    i.add<InAppPurchaseRemoteSourceImpl>(
      () => InAppPurchaseRemoteSourceImpl(),
    );
    i.add<InAppPurchaseContractImpl>(
      () => InAppPurchaseContractImpl(
        remoteSource: i<InAppPurchaseRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<BuySubscription>(
      () => BuySubscription(
        contract: i<InAppPurchaseContractImpl>(),
      ),
    );
    i.add<GetSubscriptionInfo>(
      () => GetSubscriptionInfo(
        contract: i<InAppPurchaseContractImpl>(),
      ),
    );

    i.add<InAppPurchaseCoordinator>(
      () => InAppPurchaseCoordinator(
        buySubscriptionLogic: Modular.get<BuySubscription>(),
        getSubscriptionInfoLogic: Modular.get<GetSubscriptionInfo>(),
      ),
    );
  }
}
