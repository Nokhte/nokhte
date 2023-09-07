import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class ConstantCollaboratorPoolEntryStatusEntity {
  static CollaboratorPoolEntryStatusEntity get successCase =>
      const CollaboratorPoolEntryStatusEntity(hasEntered: true);
  static CollaboratorPoolEntryStatusEntity get notSuccessCase =>
      const CollaboratorPoolEntryStatusEntity(hasEntered: false);
  static Either<Failure, CollaboratorPoolEntryStatusEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaboratorPoolEntryStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
