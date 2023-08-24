import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/models/models.dart';

class ConstantSpeechToTextInitializerStatusModel {
  static SpeechToTextInitializerStatusModel get successCase =>
      const SpeechToTextInitializerStatusModel(isAllowed: true);
  static SpeechToTextInitializerStatusModel get notSuccessCase =>
      const SpeechToTextInitializerStatusModel(isAllowed: false);
  static Either<Failure, SpeechToTextInitializerStatusModel>
      get wrappedSuccessCase =>
          const Right(SpeechToTextInitializerStatusModel(isAllowed: true));
  static Either<Failure, SpeechToTextInitializerStatusModel>
      get wrappedNotSuccessCase =>
          const Right(SpeechToTextInitializerStatusModel(isAllowed: false));
}
