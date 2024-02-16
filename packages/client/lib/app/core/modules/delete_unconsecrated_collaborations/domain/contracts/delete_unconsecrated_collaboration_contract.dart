import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';

abstract class DeleteUnconsecratedCollaborationsContract {
  Future<Either<Failure, bool>> deleteTheCollaboration(NoParams params);
  Future<Either<Failure, bool>> deleteSoloDocument(
      DeleteSoloDocumentParams params);
  Future<Either<Failure, bool>> deleteCapsuleArrangement(NoParams params);
  Future<Either<Failure, bool>> deleteCollaborativeDocument(NoParams params);
  Future<Either<Failure, bool>> deleteSchedulingSession(NoParams params);
  Future<Either<Failure, UnconsecratedCollaborationCheckerEntity>>
      checkForUnconsecratedCollaboration(NoParams params);
  Future<Either<Failure, bool>> checkIfCollaboratorHasDeletedArtifacts(
      NoParams params);
  Future<Either<Failure, bool>> updateHasDeletedArtifacts(bool params);
  Future<Either<Failure, bool>> deleteActiveNokhteSession(NoParams params);
}
