import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:nokhte_backend/phrase_components.dart';

class ConstantCollaboratorPhraseValidationEntity {
  static CollaboratorPhraseIDs get successfulCollaboratorPhraseIDs =>
      const CollaboratorPhraseIDs(adjectiveID: -1, nounID: -1);
  static CollaboratorPhraseIDs get notSuccessfulCollaboratorPhraseIDs =>
      const CollaboratorPhraseIDs(adjectiveID: 1, nounID: 1);
  static CollaboratorPhraseValidationEntity get successCase =>
      CollaboratorPhraseValidationEntity(
        isValid: true,
        phraseIDs: successfulCollaboratorPhraseIDs,
      );
  static CollaboratorPhraseValidationEntity get notSuccessCase =>
      CollaboratorPhraseValidationEntity(
        isValid: false,
        phraseIDs: notSuccessfulCollaboratorPhraseIDs,
      );
  static Either<Failure, CollaboratorPhraseValidationEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaboratorPhraseValidationEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
