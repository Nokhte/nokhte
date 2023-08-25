import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/models/models.dart';

class ConstantSpeechToTextResultModel {
  static SpeechToTextResultModel get successCase =>
      const SpeechToTextResultModel(speechResult: "aromatic acid");
  static SpeechToTextResultModel get notSuccessCase =>
      const SpeechToTextResultModel(speechResult: "");
  static Either<Failure, SpeechToTextResultModel> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, SpeechToTextResultModel> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
