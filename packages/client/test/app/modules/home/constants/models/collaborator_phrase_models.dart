import 'package:primala/app/modules/home/data/models/models.dart';
import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';

class ConstantCollaboratorPhraseModels {
  static CollaboratorPhraseModel get successCase =>
      const CollaboratorPhraseModel(collaboratorPhrase: "something something");
  static Either<Failure, CollaboratorPhraseModel> get wrappedSuccessCase =>
      Right(successCase);
}
