import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';
import 'package:nokhte_backend/storage/perspectives_audio.dart';

abstract class CollectiveSessionContract {
  Future<Either<Failure, IndividualAudioMovementToCollectiveSpaceStatusEntity>>
      moveIndividualPerspectivesAudioToCollectiveSpace(
          CollectiveSessionAudioExtrapolationInfo params);
  Future<Either<Failure, CollaboratorsAudioClipsDownloadStatusEntity>>
      downloadCollaboratorsPerspectivesClips(
          CollectiveSessionAudioExtrapolationInfo params);
}
