import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/modules/in_app_purchase/domain/domain.dart';
import 'package:nokhte/app/core/modules/in_app_purchase/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class InAppPurchaseContractImpl implements InAppPurchaseContract {
  final InAppPurchaseRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  InAppPurchaseContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  buySubscription(params) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteSource.buySubscription();
        return Right(res);
      } catch (e) {
        return Left(FailureConstants.cancelledPurchaseFailure);
      }
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getSubscriptionInfo(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getSubscriptionInfo();
      return Right(SkuProductEntity.fromSku(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
