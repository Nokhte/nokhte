import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/data/data.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

class CollaborativeDocContractImpl implements CollaborativeDocContract {
  final CollaborativeDocRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  CollaborativeDocContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CollaborativeDocContentModel>>
      getCollaborativeDocContent() async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.getCollaborativeDocContent();
      return Right(CollaborativeDocContentModel(docContent: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaborativeDocCollaboratorInfoModel>>
      getCollaboratorDocInfo() async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.getCollaboratorDocInfo();
      return Right(
          CollaborativeDocCollaboratorInfoModel(collaboratorDocInfo: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaborativeDocCreationStatusModel>>
      createCollaborativeDoc({required String docType}) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.createCollaborativeDoc(docType: docType);
      return Right(CollaborativeDocCreationStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaborativeDocUpdateStatusModel>>
      updateCollaborativeDoc({required String newContent}) async {
    if (await networkInfo.isConnected) {
      await remoteSource.updateCollaborativeDoc(newContent: newContent);
      return const Right(CollaborativeDocUpdateStatusModel(isUpdated: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaborativeDocDeltaUpdaterStatusModel>>
      updateUserDelta({required int newDelta}) async {
    if (await networkInfo.isConnected) {
      await remoteSource.updateUserDelta(updatedDelta: newDelta);
      return const Right(
          CollaborativeDocDeltaUpdaterStatusModel(isUpdated: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaborativeDocPresenceUpdaterStatusModel>>
      updateUserPresence({required bool newPresence}) async {
    if (await networkInfo.isConnected) {
      await remoteSource.updateUserPresence(updatedUserPresence: newPresence);
      return const Right(
          CollaborativeDocPresenceUpdaterStatusModel(isUpdated: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaborativeDocUpdateCommitDesireStatusModel>>
      updateCommitDesireStatus({required bool wantsToCommit}) async {
    if (await networkInfo.isConnected) {
      await remoteSource.updateCommitDesireStatus(wantsToCommit: wantsToCommit);
      return const Right(
          CollaborativeDocUpdateCommitDesireStatusModel(isUpdated: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
