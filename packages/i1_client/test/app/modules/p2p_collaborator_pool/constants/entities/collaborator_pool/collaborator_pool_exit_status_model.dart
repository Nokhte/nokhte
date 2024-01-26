import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class ConstantCollaboratorPoolExitStatusEntity {
  static CollaboratorPoolExitStatusEntity get successCase =>
      const CollaboratorPoolExitStatusEntity(hasLeft: true);
  static CollaboratorPoolExitStatusEntity get notSuccessCase =>
      const CollaboratorPoolExitStatusEntity(hasLeft: false);
  static Either<Failure, CollaboratorPoolExitStatusEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaboratorPoolExitStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
