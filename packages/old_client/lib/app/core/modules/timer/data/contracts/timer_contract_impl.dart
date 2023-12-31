import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/data/models/timer_runnning_update_status_model.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte/app/core/modules/timer/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class TimerContractImpl implements TimerContract {
  final TimerRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  TimerContractImpl({required this.remoteSource, required this.networkInfo});

  @override
  Future<Either<Failure, TimerCreationStatusModel>> createTimer(
      CreateTimerParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.createTimer(params);
      return Right(TimerCreationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, PresenceUpdateStatusModel>> updatePresence(
      bool isPresent) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updatePresence(isPresent);
      return Right(PresenceUpdateStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, TimerRunningUpdateStatusModel>>
      updateTimerRunningStatus(bool shouldRun) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateTimerRunningStatus(shouldRun);
      return Right(TimerRunningUpdateStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, TimerDeletionStatusEntity>> deleteTheTimer(
      NoParams params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.deleteTheTimer(params);
      return const Right(TimerDeletionStatusModel(isDeleted: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, TimerCompletionStatusEntity>> markTimerAsComplete(
      NoParams params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.markTimerAsComplete(params);
      return const Right(TimerCompletionStatusModel(isCompleted: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, TimerInformationStreamModel>>
      getTimerInformationStream(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.getTimerInformationStream(params);
      return Right(TimerInformationStreamModel(theTimeStream: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
