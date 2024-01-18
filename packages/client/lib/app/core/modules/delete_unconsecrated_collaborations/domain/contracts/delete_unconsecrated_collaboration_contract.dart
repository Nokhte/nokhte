import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';

abstract class DeleteUnconsecratedCollaborationsContract {
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
  Future<Either<Failure, UnconsecratedCollaborationCheckerEntity>>
      checkForUnconsecratedCollaboration(NoParams params);
}
