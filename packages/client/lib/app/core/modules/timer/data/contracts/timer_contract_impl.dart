import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte/app/core/modules/timer/data/data.dart';
import 'package:nokhte/app/core/modules/timer/domain/logic/create_timer.dart';
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
}
