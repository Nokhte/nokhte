import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/purpose_session/domain/domain.dart';

abstract class PurposeSessionContract {
  Future<Either<Failure, CollaborationArtifactDeleteStatusEntity>>
      deleteTheCollaboration(NoParams params);
  Future<Either<Failure, CollaborationArtifactDeleteStatusEntity>>
      deleteSoloDocument(NoParams params);
  Future<Either<Failure, CollaborationArtifactDeleteStatusEntity>>
      deleteCapsuleArrangement(NoParams params);
  Future<Either<Failure, CollaborationArtifactDeleteStatusEntity>>
      deleteCollaborativeDocument(NoParams params);
  Future<Either<Failure, CollaborationArtifactDeleteStatusEntity>>
      deleteSchedulingSession(NoParams params);
  Future<Either<Failure, WhoHasTheQuestionEntity>> checkIfUserHasTheQuestion(
      NoParams params);
}
