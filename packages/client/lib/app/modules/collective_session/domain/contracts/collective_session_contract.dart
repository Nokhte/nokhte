import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';

abstract class CollectiveSessionContract {
  Future<Either<Failure, IndividualAudioMovementToCollectiveSpaceStatusEntity>>
      moveIndividualPerspectivesAudioToCollectiveSpace(NoParams params);
  Future<Either<Failure, CollectiveSessionCreationStatusEntity>>
      createCollectiveSession(NoParams params);
  Future<Either<Failure, CollaboratorPerspectivesEntity>>
      getCollaboratorPerspectives(NoParams params);
  Future<
          Either<Failure,
              InvidualMetadataAdditionToCollectiveSessionStatusEntity>>
      addIndividualSessionMetadataToCollectiveSession(NoParams params);
}
