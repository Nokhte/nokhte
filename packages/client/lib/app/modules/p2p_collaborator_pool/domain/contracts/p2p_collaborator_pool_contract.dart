import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

abstract class P2PCollaboratorPoolContract {
  Future<Either<Failure, CollaboratorPhraseValidationEntity>> validateQuery(
    String query,
  );
  Future<Either<Failure, SpeechToTextInitializerStatusEntity>>
      initializeSpeechToText();
  // Future<Either<Failure, SpeechToTextResultEntity>> onSpeechResult();
  Future<Either<Failure, ListeningStatusEntity>> startListening();
  Future<Either<Failure, ListeningStatusEntity>> stopListening();
}
