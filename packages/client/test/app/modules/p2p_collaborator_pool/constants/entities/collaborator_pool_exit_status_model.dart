import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class ConstantCollaboratorPoolExitStatusEntity {
  static CollaboratorPoolExitStatusEntity get successCase =>
      const CollaboratorPoolExitStatusEntity(hasLeft: true);
  static CollaboratorPoolExitStatusEntity get notSuccessCase =>
      const CollaboratorPoolExitStatusEntity(hasLeft: false);
  static Either<Failure, CollaboratorPoolExitStatusEntity>
      get wrappedSuccessCase =>
          const Right(CollaboratorPoolExitStatusEntity(hasLeft: true));
  static Either<Failure, CollaboratorPoolExitStatusEntity>
      get wrappedNotSuccessCase =>
          const Right(CollaboratorPoolExitStatusEntity(hasLeft: false));
}
