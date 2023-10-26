import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';
import 'package:nokhte/app/core/modules/scheduling/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

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

  @override
  Future<Either<Failure, SchedulingSessionUpdateTimeOrDateStatusModel>>
      updateSchedulingTimeOrDate(
          UpdateSchedulingTimeOrDateParams params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.updateShedulingTimeOrDate(params);
      return const Right(
          SchedulingSessionUpdateTimeOrDateStatusModel(isUpdated: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorsChosenTimeAndDayModel>>
      getCollaboratorsDateAndTime(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.getCollaboratorsDateAndTime();
      return Right(CollaboratorsChosenTimeAndDayModel(dateAndTime: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
