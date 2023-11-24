import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/domain/domain.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class UpdateExistingCollaborationsContractImpl
    implements UpdateExistingCollaborationsContract {
  final UpdateExistingCollaborationsRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  UpdateExistingCollaborationsContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  Future<Either<Failure, CollaborationConsecrationStatusModel>>
      consecrateTheCollaboration(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.consecrateTheCollaboration(params);
      return Right(CollaborationConsecrationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaborationActivationStatusModel>>
      updateCollaborationActivationStatus(
          {required bool shouldActivate}) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateCollaborationActivationStatus(
          shouldActivate: shouldActivate);
      return Right(CollaborationActivationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
