import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/data/data.dart';

class ConstantCollaborativeDocPresenceUpdaterStatusModel {
  static CollaborativeDocPresenceUpdaterStatusModel get successCase =>
      const CollaborativeDocPresenceUpdaterStatusModel(isUpdated: true);
  static CollaborativeDocPresenceUpdaterStatusModel get notSuccessCase =>
      const CollaborativeDocPresenceUpdaterStatusModel(isUpdated: false);
  static Either<Failure, CollaborativeDocPresenceUpdaterStatusModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocPresenceUpdaterStatusModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
