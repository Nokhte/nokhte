import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

abstract class CollaborativeDocContract {
  Future<Either<Failure, CollaborativeDocContentEntity>>
      getCollaborativeDocContent();
  Future<Either<Failure, CollaborativeDocCollaboratorDeltaEntity>>
      getCollaboratorDelta();
  Future<Either<Failure, CollaborativeDocCollaboratorPresenceEntity>>
      getCollaboratorPresence();
  Future<Either<Failure, CollaborativeDocCreationStatusEntity>>
      createCollaborativeDoc({required String docType});
  Future<Either<Failure, CollaborativeDocUpdateStatusEntity>>
      updateCollaborativeDoc({required String newContent});
}
