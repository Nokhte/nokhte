import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/models/models.dart';

class ConstantCollaboratorSearchStatusStatusModel {
  static CollaboratorSearchStatusModel get successCase =>
      CollaboratorSearchStatusModel(isFound: Stream.value(true));
  static CollaboratorSearchStatusModel get notSuccessCase =>
      CollaboratorSearchStatusModel(isFound: Stream.value(false));
  static Either<Failure, CollaboratorSearchStatusModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaboratorSearchStatusModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
