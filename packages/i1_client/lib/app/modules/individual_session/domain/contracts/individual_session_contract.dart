import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';

abstract class IndividualSessionContract {
  // Future<Either<Failure, CurrentPerspectivesEntity>> getCurrentPerspectives(
  //   NoParams params,
  // );
  Future<Either<Failure, IndividualSessionCreationEntity>>
      createIndividualSession(NoParams params);
  Future<Either<Failure, IndividualSessionMetadataUpdateStatusEntity>>
      updateSessionMetadata(UpdateSessionMetadataParams params);
  Future<Either<Failure, IndividualPerspectivesAudioUploadStatusEntity>>
      uploadIndividualPerspectivesAudio(
          UploadIndividualPerspectivesAudioParams params);
  Future<PerspectivesAudioRecordingStatusEntity>
      changePerspectivesAudioRecordingStatus(
    ChangePerspectivesAudioRecordingStatusParams params,
  );
}
