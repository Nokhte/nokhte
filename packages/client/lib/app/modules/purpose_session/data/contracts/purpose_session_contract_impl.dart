import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/purpose_session/domain/domain.dart';
import 'package:nokhte/app/modules/purpose_session/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';

class PurposeSessionContractImpl implements PurposeSessionContract {
  final PurposeSessionRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  PurposeSessionContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  checkIfUserHasTheQuestion(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.checkIfUserHasTheQuestion();
      return Right(WhoHasTheQuestionModel(hasTheQuestion: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  deleteCapsuleArrangement(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.deleteCapsuleArrangement();
      return Right(CollaborationArtifactDeleteStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  deleteCollaborativeDocument(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.deleteCollaborativeDocument();
      return Right(CollaborationArtifactDeleteStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  deleteSchedulingSession(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.deleteSchedulingSession();
      return Right(CollaborationArtifactDeleteStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  deleteSoloDocument(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.deleteSoloDocument();
      return Right(CollaborationArtifactDeleteStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  deleteTheCollaboration(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.deleteTheCollaboration();
      return Right(CollaborationArtifactDeleteStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
