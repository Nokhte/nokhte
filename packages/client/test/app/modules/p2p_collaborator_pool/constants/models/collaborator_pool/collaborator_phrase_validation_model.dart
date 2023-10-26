import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/data/models/models.dart';
import 'package:nokhte_backend/phrase_components.dart';

class ConstantCollaboratorPhraseValidationModel {
  static CollaboratorPhraseIDs get successfulCollaboratorPhraseIDs =>
      const CollaboratorPhraseIDs(adjectiveID: -1, nounID: -1);
  static CollaboratorPhraseIDs get notSuccessfulCollaboratorPhraseIDs =>
      const CollaboratorPhraseIDs(adjectiveID: 1, nounID: 1);
  static CollaboratorPhraseValidationModel get successCase =>
      CollaboratorPhraseValidationModel(
        isValid: true,
        phraseIDs: successfulCollaboratorPhraseIDs,
      );
  static CollaboratorPhraseValidationModel get notSuccessCase =>
      CollaboratorPhraseValidationModel(
        isValid: false,
        phraseIDs: notSuccessfulCollaboratorPhraseIDs,
      );
  static Either<Failure, CollaboratorPhraseValidationModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaboratorPhraseValidationModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
