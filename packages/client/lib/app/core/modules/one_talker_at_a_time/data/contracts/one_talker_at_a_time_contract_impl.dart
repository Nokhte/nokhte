import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/domain/domain.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class OneTalkerAtATimeContractImpl implements OneTalkerAtATimeContract {
  final OneTalkerAtATimeRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  OneTalkerAtATimeContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  Future<Either<Failure, CheckIfCollaboratorIsTalkingModel>>
      checkIfCollaboratorIsTalking(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.checkIfCollaboratorIsTalking();
      return Right(
          CheckIfCollaboratorIsTalkingModel(collaboratorIsTalking: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, WhoIsTalkingUpdateStatusEntity>> updateWhoIsTalking(
      WhoIsTalkingUpdateParams params) async {
    if (await networkInfo.isConnected) {
      switch (params) {
        case WhoIsTalkingUpdateParams.setUserAsTalker:
          final res = await remoteSource.setUserAsCurrentTalker();
          return Right(WhoIsTalkingUpdateStatusModel.fromSupabase(res));
        case WhoIsTalkingUpdateParams.clearOut:
          await remoteSource.clearTheCurrentTalker();
          return const Right(WhoIsTalkingUpdateStatusModel(isUpdated: true));
      }
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
