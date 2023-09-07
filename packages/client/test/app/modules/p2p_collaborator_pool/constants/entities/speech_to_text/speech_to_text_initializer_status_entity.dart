import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class ConstantSpeechToTextInitializerStatusEntity {
  static SpeechToTextInitializerStatusEntity get successCase =>
      const SpeechToTextInitializerStatusEntity(isAllowed: true);
  static SpeechToTextInitializerStatusEntity get notSuccessCase =>
      const SpeechToTextInitializerStatusEntity(isAllowed: false);
  static Either<Failure, SpeechToTextInitializerStatusEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, SpeechToTextInitializerStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
