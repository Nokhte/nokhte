import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
import 'package:nokhte/app/modules/collaboration/domain/entities/entities.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

abstract class CollaborationContract {
  Future<Either<Failure, CollaboratorPoolEntryStatusEntity>>
      enterTheCollaboratorPool(String collaboratorUID);
  Future<Either<Failure, CollaboratorPoolExitStatusEntity>>
      exitCollaboratorPool(NoParams params);
  Future<Either<Failure, Stream<CollaboratorSearchAndEntryStatus>>>
      getCollaboratorSearchStatus(NoParams params);
  Future<Either<Failure, CollaboratorStreamCancellationStatusEntity>>
      cancelCollaboratorSearchStream(NoParams params);
}
