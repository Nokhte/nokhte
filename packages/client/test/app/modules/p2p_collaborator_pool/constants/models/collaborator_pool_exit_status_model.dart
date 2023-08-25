import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/models/models.dart';

class ConstantCollaboratorPoolExitStatusModel {
  static CollaboratorPoolExitStatusModel get successCase =>
      const CollaboratorPoolExitStatusModel(hasLeft: true);
  static CollaboratorPoolExitStatusModel get notSuccessCase =>
      const CollaboratorPoolExitStatusModel(hasLeft: false);
  static Either<Failure, CollaboratorPoolExitStatusModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaboratorPoolExitStatusModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
