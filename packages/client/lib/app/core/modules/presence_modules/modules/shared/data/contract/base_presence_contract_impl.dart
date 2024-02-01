import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/constants.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/modules/presence_modules/modules/shared/shared.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class BasePresenceContractImpl<T>
    with ResponseToStatus
    implements BasePresenceContract<T> {
  final BasePresenceRemoteSource<T> remoteSource;
  final NetworkInfo networkInfo;

  BasePresenceContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  getSessionMetadata(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.getSessionMetadata();
      return Right(res);
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateCurrentPhase(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateCurrentPhase(params);
      return Right(fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateOnlineStatus(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateOnlineStatus(params);
      return Right(fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateWhoIsTalking(params) async {
    if (await networkInfo.isConnected) {
      switch (params) {
        case UpdateWhoIsTalkingParams.setUserAsTalker:
          final res = await remoteSource.setUserAsCurrentTalker();
          return Right(fromSupabase(res));
        case UpdateWhoIsTalkingParams.clearOut:
          await remoteSource.clearTheCurrentTalker();
          return const Right(true);
      }
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  cancelSessionMetadataStream(NoParams params) =>
      remoteSource.cancelSessionMetadataStream();
}
