import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class ConstantCollaboratorPhraseValidationEntity {
  static CollaboratorPhraseValidationEntity get successCase =>
      const CollaboratorPhraseValidationEntity(isValid: true);
  static CollaboratorPhraseValidationEntity get notSuccessCase =>
      const CollaboratorPhraseValidationEntity(isValid: false);
  static Either<Failure, CollaboratorPhraseValidationEntity>
      get wrappedSuccessCase =>
          const Right(CollaboratorPhraseValidationEntity(isValid: true));
  static Either<Failure, CollaboratorPhraseValidationEntity>
      get wrappedNotSuccessCase =>
          const Right(CollaboratorPhraseValidationEntity(isValid: false));
}
