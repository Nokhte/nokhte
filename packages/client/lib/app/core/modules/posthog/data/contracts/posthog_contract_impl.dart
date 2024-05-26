import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class PosthogContractImpl implements PosthogContract {
  final PosthogRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  PosthogContractImpl({required this.remoteSource, required this.networkInfo});

  @override
  captureNokhteSessionEnd(params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.captureNokhteSessionEnd();
      return const Right(null);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  captureNokhteSessionStart(params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.captureNokhteSessionStart(params);
      return const Right(null);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  identifyUser(params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.identifyUser();
      return const Right(null);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  captureScreen(screen) async {
    if (await networkInfo.isConnected) {
      await remoteSource.captureScreen(screen);
      return const Right(null);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
