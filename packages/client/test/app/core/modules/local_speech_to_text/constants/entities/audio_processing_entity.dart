import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';

class ConstantAudioProcessingEntity {
  static AudioProcessingEntity get successCase =>
      const AudioProcessingEntity(resultingWords: 'resulting words');
  static AudioProcessingEntity get notSuccessCase =>
      const AudioProcessingEntity(resultingWords: '');
  static Either<Failure, AudioProcessingEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, AudioProcessingEntity> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
