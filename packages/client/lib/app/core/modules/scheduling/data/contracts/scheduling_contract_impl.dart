import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/scheduling/domain/domain.dart';
import 'package:primala/app/core/modules/scheduling/data/data.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/constants/failure_constants.dart';

class SchedulingContractImpl implements SchedulingContract {
  final SchedulingRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  SchedulingContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  Future<Either<Failure, SchedulingSessionCreationStatusModel>>
      createCollaborativeSchedulingSession(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.createSchedulingSession();
      return Right(SchedulingSessionCreationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
