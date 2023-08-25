import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class ConstantSpeechToTextResultEntity {
  static SpeechToTextResultEntity get successCase =>
      const SpeechToTextResultEntity(speechResult: "aromatic acid");
  static SpeechToTextResultEntity get notSuccessCase =>
      const SpeechToTextResultEntity(speechResult: "");
  static Either<Failure, SpeechToTextResultEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, SpeechToTextResultEntity> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
