import 'package:dartz/dartz.dart';
import 'package:primala/app/core/constants/failure_constants.dart';
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
  Future<Either<Failure, InitLeopardStatusModel>> initLeopard(
      NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.initLeopard();
      return Right(InitLeopardStatusModel(isInitialized: res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, RecordingStatusModel>> startRecording(
      NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.startRecording();
      return Right(RecordingStatusModel.fromMicrophone(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }

  @override
  Future<Either<Failure, AudioProcessingModel>> stopRecording(
      NoParams params) async {
    if (await networkInfo.isConnected) {
      final res = await remoteSource.stopRecording();
      return Right(AudioProcessingModel.fromLeopard(res));
    } else {
      return Left(FailureConstants.internetConnectionFailure);
    }
  }
}
