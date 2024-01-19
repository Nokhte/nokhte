import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class CollaboratorPresenceContractImpl implements CollaboratorPresenceContract {
  final CollaboratorPresenceRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  CollaboratorPresenceContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  updateOnCallStatus(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateOnCallStatus(params);
      return Right(CallUpdateStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateOnlineStatus(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateOnlineStatus(params);
      return Right(OnlineUpdateStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateTimerStatus(bool params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateTimerStatus(params);
      return Right(TimerUpdateStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  updateWhoIsTalking(UpdateWhoIsTalkingParams params) async {
    if (await networkInfo.isConnected) {
      switch (params) {
        case UpdateWhoIsTalkingParams.setUserAsTalker:
          final res = await remoteSource.setUserAsCurrentTalker();
          return Right(WhoIsTalkingUpdateStatusModel.fromSupabase(res));
        case UpdateWhoIsTalkingParams.clearOut:
          await remoteSource.clearTheCurrentTalker();
          return const Right(WhoIsTalkingUpdateStatusModel(isUpdated: true));
      }
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  getSessionMetadata(params) async {
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
      return Right(PhaseUpdateStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
