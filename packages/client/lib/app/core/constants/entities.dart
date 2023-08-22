import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/home/domain/entities/entities.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class DefaultEntities {
  static Either<Failure, NameCreationStatusEntity>
      get nameCreationStatusEntity =>
          const Right(NameCreationStatusEntity(isSent: false));
  static Either<Failure, CollaboratorPhraseEntity>
      get collaboratorPhraseEntity =>
          const Right(CollaboratorPhraseEntity(collaboratorPhrase: ''));
  static Either<Failure, ListeningStatusEntity> get listeningStatusEntity =>
      const Right(ListeningStatusEntity(isListening: false));
  static Either<Failure, SpeechToTextInitializerStatusEntity>
      get speechToTextInitializerStatusEntity =>
          const Right(SpeechToTextInitializerStatusEntity(isAllowed: false));
}
