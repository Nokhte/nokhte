import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class CollectiveSessionContractImpl implements CollectiveSessionContract {
  final CollectiveSessionRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  CollectiveSessionContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  Future<Either<Failure, IndividualAudioMovementToCollectiveSpaceStatusModel>>
      moveIndividualPerspectivesAudioToCollectiveSpace(NoParams params) async {
    if (await networkInfo.isConnected) {
      await remoteSource
          .moveIndividualPerspectivesAudioToCollectiveSpace(params);
      return const Right(
          IndividualAudioMovementToCollectiveSpaceStatusModel(isMoved: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorPerspectivesModel>>
      getCollaboratorPerspectives(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.getCollaboratorsPerspectives(params);
      return Right(CollaboratorPerspectivesModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollectiveSessionCreationStatusModel>>
      createCollectiveSession(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.createCollectiveSession(params);
      return Right(CollectiveSessionCreationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<
          Either<Failure,
              InvidualMetadataAdditionToCollectiveSessionStatusModel>>
      addIndividualSessionMetadataToCollectiveSession(NoParams params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.addIndividualSessionMetadataToCollectiveSession();
      return const Right(InvidualMetadataAdditionToCollectiveSessionStatusModel(
          isAdded: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
