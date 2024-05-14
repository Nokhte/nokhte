import 'package:glassfy_flutter/glassfy_flutter.dart';
import 'package:glassfy_flutter/models.dart';

abstract class InAppPurchaseRemoteSource {
  Future<GlassfyOfferings> getSubscriptionInfo();
  Future<bool> buySubscription();
}

class InAppPurchaseRemoteSourceImpl implements InAppPurchaseRemoteSource {
  @override
  getSubscriptionInfo() async => await Glassfy.offerings();

  @override
  buySubscription() async {
    final offerings = await Glassfy.offerings();
    final premiumOfferings = offerings.all
        ?.singleWhere((offering) => offering.offeringId == 'nokhte_premium');
    final GlassfySku sku = premiumOfferings!.skus!.first;
    final transaction = await Glassfy.purchaseSku(sku);
    final permission = transaction.permissions?.all
        ?.singleWhere((permission) => permission.permissionId == 'premium');
    return permission?.isValid ?? false;
  }
}
