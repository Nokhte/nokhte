import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
import 'package:nokhte/app/modules/collaboration/domain/entities/entities.dart';

abstract class CollaborationContract {
  Future<Either<Failure, CollaboratorPoolEntryStatusEntity>>
      enterTheCollaboratorPool(String collaboratorUID);
  Future<Either<Failure, CollaboratorPoolExitStatusEntity>>
      exitCollaboratorPool(NoParams params);
  Future<Either<Failure, CollaboratorSearchStatusEntity>>
      getCollaboratorSearchStatus(NoParams params);
  Future<Either<Failure, CollaboratorStreamCancellationStatusEntity>> name(
      NoParams params);
}
