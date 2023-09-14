import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';

abstract class LocalSpeechToTextContract {
  Future<Either<Failure, AudioProcessingEntity>> processAudio(
      ProcessAudioParams params);
  Future<Either<Failure, RecordingStatusEntity>> startRecording(
      NoParams params);
  Future<Either<Failure, RecordingStatusEntity>> stopRecording(NoParams params);
  Future<Either<Failure, InitLeopardStatusEntity>> initLeopard(NoParams params);
}
