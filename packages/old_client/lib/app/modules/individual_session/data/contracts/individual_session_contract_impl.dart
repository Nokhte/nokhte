import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/individual_session/domain/domain.dart';
import 'package:nokhte/app/modules/individual_session/data/data.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/core/constants/failure_constants.dart';
import 'package:nokhte/app/modules/individual_session/types/perspectives_audio_recording_status.dart';

class IndividualSessionContractImpl implements IndividualSessionContract {
  final IndividualSessionRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  IndividualSessionContractImpl(
      {required this.remoteSource, required this.networkInfo});

  @override
  Future<Either<Failure, IndividualSessionCreationModel>>
      createIndividualSession(NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.createIndividualSession();
      return Right(IndividualSessionCreationModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, IndividualSessionMetadataUpdateStatusEntity>>
      updateSessionMetadata(UpdateSessionMetadataParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.updateSessionMetadata(params);
      return Right(
          IndividualSessionMetadataUpdateStatusModel.fromSupabase(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, IndividualPerspectivesAudioUploadStatusModel>>
      uploadIndividualPerspectivesAudio(
          UploadIndividualPerspectivesAudioParams params) async {
    if (await networkInfo.isConnected) {
      await remoteSource.uploadIndividualPerspectivesAudio(params);
      return const Right(
          IndividualPerspectivesAudioUploadStatusModel(isUploaded: true));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<PerspectivesAudioRecordingStatusModel>
      changePerspectivesAudioRecordingStatus(
          ChangePerspectivesAudioRecordingStatusParams params) async {
    final res =
        await remoteSource.changePerspectivesAudioRecordingStatus(params);
    return res.fold((voidEntity) {
      return PerspectivesAudioRecordingStatusModel(
        recordingStatus: PerspectivesAudioRecordingStatus.recording,
        returnFile: File(''),
      );
    }, (returnFile) {
      return PerspectivesAudioRecordingStatusModel(
          recordingStatus: PerspectivesAudioRecordingStatus.recorded,
          returnFile: returnFile);
    });
  }
}
