import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class ConstantCollaboratorSearchStatusEntity {
  static CollaboratorSearchStatusEntity get successCase =>
      CollaboratorSearchStatusEntity(isFound: Stream.value(true));
  static CollaboratorSearchStatusEntity get notSuccessCase =>
      CollaboratorSearchStatusEntity(isFound: Stream.value(false));
  static Either<Failure, CollaboratorSearchStatusEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaboratorSearchStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
