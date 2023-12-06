import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/data/data.dart';

class ConstantCollaborativeDocCollaboratorPresenceModel {
  static CollaborativeDocCollaboratorPresenceModel get successCase =>
      CollaborativeDocCollaboratorPresenceModel(isPresent: Stream.value(true));
  static CollaborativeDocCollaboratorPresenceModel get notSuccessCase =>
      CollaborativeDocCollaboratorPresenceModel(
        isPresent: Stream.value(false),
      );
  static Either<Failure, CollaborativeDocCollaboratorPresenceModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocCollaboratorPresenceModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
