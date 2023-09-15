import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/local_speech_to_text/constants/constants.dart';
import 'package:primala/app/core/modules/local_speech_to_text/data/data.dart';

class ConstantRecordingStatusModel {
  static RecordingStatusModel get startedCase =>
      const RecordingStatusModel(recordingStatus: RecordingStatus.started);
  static RecordingStatusModel get errorCase =>
      const RecordingStatusModel(recordingStatus: RecordingStatus.error);
  static RecordingStatusModel get stoppedCase =>
      const RecordingStatusModel(recordingStatus: RecordingStatus.stopped);
  static Either<Failure, RecordingStatusModel> get wrappedStartedCase =>
      Right(startedCase);
  static Either<Failure, RecordingStatusModel> get wrappedStoppedCase =>
      Right(stoppedCase);
  static Either<Failure, RecordingStatusModel> get wrappedErrorCase =>
      Right(errorCase);
}
