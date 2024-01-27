import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class ConstantCollaboratorSearchStatusEntity {
  static CollaboratorSearchStatusEntity get successCase =>
      CollaboratorSearchStatusEntity(
          searchAndEntryStatusStream: Stream.value(true));
  static CollaboratorSearchStatusEntity get notSuccessCase =>
      CollaboratorSearchStatusEntity(
          searchAndEntryStatusStream: Stream.value(false));
  static Either<Failure, CollaboratorSearchStatusEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaboratorSearchStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}