import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

class ConstantCollaborativeDocCollaboratorPresenceEntity {
  static CollaborativeDocCollaboratorPresenceEntity get successCase =>
      CollaborativeDocCollaboratorPresenceEntity(isPresent: Stream.value(true));
  static CollaborativeDocCollaboratorPresenceEntity get notSuccessCase =>
      CollaborativeDocCollaboratorPresenceEntity(
        isPresent: Stream.value(false),
      );
  static Either<Failure, CollaborativeDocCollaboratorPresenceEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocCollaboratorPresenceEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
