import 'package:nokhte/app/modules/home/domain/entities/collaborator_phrase_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';

class ConstantCollaboratorPhraseEntities {
  static CollaboratorPhraseEntity get successCase =>
      const CollaboratorPhraseEntity(collaboratorPhrase: "something something");
  static Either<Failure, CollaboratorPhraseEntity> get wrappedSuccessCase =>
      Right(successCase);
}
