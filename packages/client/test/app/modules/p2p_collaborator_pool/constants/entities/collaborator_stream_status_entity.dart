import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class ConstantCollaboratorStreamStatusEntity {
  static CollaboratorStreamStatusEntity get successCase =>
      const CollaboratorStreamStatusEntity(isSubscribed: true);
  static CollaboratorStreamStatusEntity get notSuccessCase =>
      const CollaboratorStreamStatusEntity(isSubscribed: false);
  static Either<Failure, CollaboratorStreamStatusEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaboratorStreamStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
