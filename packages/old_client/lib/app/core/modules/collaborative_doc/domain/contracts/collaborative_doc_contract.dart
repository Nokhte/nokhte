import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

abstract class CollaborativeDocContract {
  Future<Either<Failure, CollaborativeDocContentEntity>>
      getCollaborativeDocContent();
  Future<Either<Failure, CollaborativeDocCollaboratorInfoEntity>>
      getCollaboratorDocInfo();
  Future<Either<Failure, CollaborativeDocCreationStatusEntity>>
      createCollaborativeDoc({required String docType});
  Future<Either<Failure, CollaborativeDocUpdateStatusEntity>>
      updateCollaborativeDoc({required String newContent});
  Future<Either<Failure, CollaborativeDocDeltaUpdaterStatusEntity>>
      updateUserDelta({required int newDelta});
  Future<Either<Failure, CollaborativeDocPresenceUpdaterStatusEntity>>
      updateUserPresence({required bool newPresence});
  Future<Either<Failure, CollaborativeDocUpdateCommitDesireStatusEntity>>
      updateCommitDesireStatus({required bool wantsToCommit});
  Future<Either<Failure, CollaborativeDocMoveToFinishedDocsStatusEntity>>
      moveToFinishedDocs(MoveToFinishedDocsParams params);
}
