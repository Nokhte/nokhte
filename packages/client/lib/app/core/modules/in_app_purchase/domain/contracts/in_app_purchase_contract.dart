import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/in_app_purchase/in_app_purchase.dart';

abstract class InAppPurchaseContract {
  Future<Either<Failure, SkuProductEntity>> getSubscriptionInfo(
    NoParams params,
  );
  Future<Either<Failure, bool>> buySubscription(NoParams params);
}
