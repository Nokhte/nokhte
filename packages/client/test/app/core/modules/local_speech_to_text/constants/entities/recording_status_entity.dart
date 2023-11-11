import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/constants/constants.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';

class ConstantRecordingStatusEntity {
  static SpeechToTextRecordingStatusEntity get successCase =>
      const SpeechToTextRecordingStatusEntity(
          recordingStatus: SpeechToTextRecordingStatus.started);
  static SpeechToTextRecordingStatusEntity get notSuccessCase =>
      const SpeechToTextRecordingStatusEntity(
          recordingStatus: SpeechToTextRecordingStatus.initial);
  static Either<Failure, SpeechToTextRecordingStatusEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, SpeechToTextRecordingStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
