import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/data/data.dart';
import 'package:nokhte/app/core/modules/timer/domain/entities/timer_deletion_status_entity.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class AbortPurposeSessionArtifactsContractImpl
    implements AbortPurposeSessionArtifactsContract {
  final AbortPurposeSessionArtifactsRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  AbortPurposeSessionArtifactsContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  Future<Either<Failure, NoEntity>> abortTheCollaboration(
      NoParams params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.abortTheCollaboration();
      return Right(NoEntity());
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, NoEntity>> deleteSoloDocuments(NoParams params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.deleteSoloDocuments();
      return Right(NoEntity());
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, TimerDeletionStatusEntity>> deleteTheTimer(
      NoParams params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.deleteTheTimer(params);
      return const Right(TimerDeletionStatusEntity(isDeleted: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, NoEntity>> deleteWorkingCollaborativeDocument(
      NoParams params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.deleteWorkingCollaborativeDocument();
      return Right(NoEntity());
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
