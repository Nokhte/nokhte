import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:primala_backend/constants/phrase_components/collaborator_phrase.dart';
// import 'package:primala/app/modules/p2p_collaborator_pool/domain/logic/logic.dart';

abstract class P2PCollaboratorPoolContract {
  Future<Either<Failure, CollaboratorPhraseValidationEntity>> validateQuery(
    String query,
  );

  Future<Either<Failure, SpeechToTextInitializerStatusEntity>>
      initializeSpeechToText();

  Future<Either<Failure, ListeningStatusEntity>> startListening();

  Future<Either<Failure, ListeningStatusEntity>> stopListening();

  Future<Either<Failure, CollaboratorPoolEntryStatusEntity>>
      enterTheCollaboratorPool({required CollaboratorPhraseIDs phraseIDs});
}
