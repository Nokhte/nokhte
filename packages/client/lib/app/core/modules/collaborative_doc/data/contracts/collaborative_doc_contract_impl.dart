import 'package:dartz/dartz.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/modules/collaborative_doc/data/data.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

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
  Future<Either<Failure, CollaborativeDocCollaboratorDeltaModel>>
      getCollaboratorDelta() async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.getCollaboratorDelta();
      return Right(CollaborativeDocCollaboratorDeltaModel(delta: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, CollaborativeDocCollaboratorPresenceModel>>
      getCollaboratorPresence() async {
    if (await networkInfo.isConnected) {
      final res = remoteSource.getCollaboratorPresence();
      return Right(CollaborativeDocCollaboratorPresenceModel(isPresent: res));
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
      return Right(CollaborativeDocUpdateStatusModel.fromSupabase([{}]));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
