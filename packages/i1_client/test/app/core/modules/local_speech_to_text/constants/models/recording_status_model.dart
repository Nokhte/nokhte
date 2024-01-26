import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/constants/constants.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/data/data.dart';

class ConstantRecordingStatusModel {
  static SpeechToTextRecordingStatusModel get startedCase =>
      const SpeechToTextRecordingStatusModel(
          recordingStatus: SpeechToTextRecordingStatus.started);
  static SpeechToTextRecordingStatusModel get errorCase =>
      const SpeechToTextRecordingStatusModel(
          recordingStatus: SpeechToTextRecordingStatus.error);
  static SpeechToTextRecordingStatusModel get stoppedCase =>
      const SpeechToTextRecordingStatusModel(
          recordingStatus: SpeechToTextRecordingStatus.stopped);
  static Either<Failure, SpeechToTextRecordingStatusModel>
      get wrappedStartedCase => Right(startedCase);
  static Either<Failure, SpeechToTextRecordingStatusModel>
      get wrappedStoppedCase => Right(stoppedCase);
  static Either<Failure, SpeechToTextRecordingStatusModel>
      get wrappedErrorCase => Right(errorCase);
}
