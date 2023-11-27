import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/domain/domain.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class ExistingCollaborationsContractImpl
    implements ExistingCollaborationsContract {
  final ExistingCollaborationsRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  ExistingCollaborationsContractImpl(
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

  @override
  Future<Either<Failure, IndividualCollaboratorEntryStatusModel>>
      updateIndividualCollaboratorEntryStatus(
          {required bool isEntering}) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateIndividualCollaboratorEntryStatus(
        isEntering: isEntering,
      );
      return Right(IndividualCollaboratorEntryStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
