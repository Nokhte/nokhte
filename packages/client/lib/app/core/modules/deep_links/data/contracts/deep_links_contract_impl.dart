import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/data/data.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class DeepLinksContractImpl implements DeepLinksContract {
  final DeepLinksRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  DeepLinksContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  listenForOpenedDeepLink(NoParams params) =>
      remoteSource.listenForOpenedDeepLink();

  @override
  getDeepLinkURL(GetDeepLinkURLParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getDeepLinkURL(params);
      return Right(DeepLinkUrlEntity(link: res.result));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  sendDeepLink(String params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.sendDeepLink(params);
      return Right(DeepLinkSendStatusModel.fromShareResult(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
