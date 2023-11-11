import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte/app/modules/collective_session/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte_backend/storage/buckets/perspectives_audio/types/collective_session_audio_extrapolation_info.dart';

class CollectiveSessionContractImpl implements CollectiveSessionContract {
  final CollectiveSessionRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  CollectiveSessionContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  Future<Either<Failure, IndividualAudioMovementToCollectiveSpaceStatusModel>>
      moveIndividualPerspectivesAudioToCollectiveSpace(
          CollectiveSessionAudioExtrapolationInfo params) async {
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
  Future<Either<Failure, CollaboratorsAudioClipsDownloadStatusModel>>
      downloadCollaboratorsPerspectivesClips(
          CollectiveSessionAudioExtrapolationInfo params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.downloadTheCollaboratorsPerspectivesClips(params);

      return const Right(
          CollaboratorsAudioClipsDownloadStatusModel(isDownloaded: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaboratorIndividualSessionMetadataModel>>
      getCollaboratorIndividualSessionMetadata(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res =
          await remoteSource.getCollaboratorIndividualSessionMetadata(params);
      return Right(
          CollaboratorIndividualSessionMetadataModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
