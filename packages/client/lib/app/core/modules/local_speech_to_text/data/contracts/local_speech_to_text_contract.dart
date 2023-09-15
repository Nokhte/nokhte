import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';
import 'package:primala/app/core/modules/local_speech_to_text/data/data.dart';
import 'package:primala/app/core/network/network_info.dart';

class LocalSpeechToTextContractImpl implements LocalSpeechToTextContract {
  final LocalSpeechToTextRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  LocalSpeechToTextContractImpl({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, InitLeopardStatusModel>> initLeopard(NoParams params) {
    // TODO: implement initLeopard
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AudioProcessingModel>> processAudio(
      ProcessAudioParams params) {
    // TODO: implement processAudio
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RecordingStatusModel>> startRecording(
      NoParams params) {
    // TODO: implement startRecording
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RecordingStatusModel>> stopRecording(NoParams params) {
    // TODO: implement stopRecording
    throw UnimplementedError();
  }
}
