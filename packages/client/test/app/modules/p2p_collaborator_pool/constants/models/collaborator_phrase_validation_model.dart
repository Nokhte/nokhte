import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/models/models.dart';

class ConstantCollaboratorPhraseValidationModel {
  static CollaboratorPhraseValidationModel get successCase =>
      const CollaboratorPhraseValidationModel(isValid: true);
  static CollaboratorPhraseValidationModel get notSuccessCase =>
      const CollaboratorPhraseValidationModel(isValid: false);
  static Either<Failure, CollaboratorPhraseValidationModel>
      get wrappedSuccessCase =>
          const Right(CollaboratorPhraseValidationModel(isValid: true));
  static Either<Failure, CollaboratorPhraseValidationModel>
      get wrappedNotSuccessCase =>
          const Right(CollaboratorPhraseValidationModel(isValid: false));
}
