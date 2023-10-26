import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';

abstract class LocalSpeechToTextContract {
  Future<Either<Failure, RecordingStatusEntity>> startRecording(
      NoParams params);
  Future<Either<Failure, AudioProcessingEntity>> stopRecording(NoParams params);
  Future<Either<Failure, InitLeopardStatusEntity>> initLeopard(NoParams params);
}
