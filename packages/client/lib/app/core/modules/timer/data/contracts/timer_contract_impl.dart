import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte/app/core/modules/timer/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class TimerContractImpl implements TimerContract {
  final TimerRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  TimerContractImpl({required this.remoteSource, required this.networkInfo});

  @override
  Future<Either<Failure, TimerCreationStatusModel>> createTimer(params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.createTimer();
      return Right(TimerCreationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
