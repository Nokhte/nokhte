import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

class ConstantCollaborativeDocPresenceUpdaterStatusEntity {
  static CollaborativeDocPresenceUpdaterStatusEntity get successCase =>
      const CollaborativeDocPresenceUpdaterStatusEntity(isUpdated: true);
  static CollaborativeDocPresenceUpdaterStatusEntity get notSuccessCase =>
      const CollaborativeDocPresenceUpdaterStatusEntity(isUpdated: false);
  static Either<Failure, CollaborativeDocPresenceUpdaterStatusEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocPresenceUpdaterStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
