import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/in_app_purchase/domain/domain.dart';

class BuySubscription implements AbstractFutureLogic<bool, NoParams> {
  final InAppPurchaseContract contract;

  BuySubscription({required this.contract});

  @override
  call(params) async => await contract.buySubscription(params);
}
