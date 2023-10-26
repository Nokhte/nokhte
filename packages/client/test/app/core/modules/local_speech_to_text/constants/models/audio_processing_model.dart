import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/data/data.dart';

class ConstantAudioProcessingModel {
  static AudioProcessingModel get successCase =>
      const AudioProcessingModel(resultingWords: 'resulting words');
  static AudioProcessingModel get notSuccessCase =>
      const AudioProcessingModel(resultingWords: '');
  static Either<Failure, AudioProcessingModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, AudioProcessingModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
