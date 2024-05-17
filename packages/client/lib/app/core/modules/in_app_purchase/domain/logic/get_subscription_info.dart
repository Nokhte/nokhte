import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/in_app_purchase/domain/domain.dart';

class GetSubscriptionInfo
    implements AbstractFutureLogic<SkuProductEntity, NoParams> {
  final InAppPurchaseContract contract;

  GetSubscriptionInfo({required this.contract});

  @override
  call(params) async => await contract.getSubscriptionInfo(params);
}
