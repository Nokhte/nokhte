import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

class ConstantCollaborativeDocDeltaUpdaterStatusEntity {
  static CollaborativeDocDeltaUpdaterStatusEntity get successCase =>
      const CollaborativeDocDeltaUpdaterStatusEntity(isUpdated: true);
  static CollaborativeDocDeltaUpdaterStatusEntity get notSuccessCase =>
      const CollaborativeDocDeltaUpdaterStatusEntity(isUpdated: false);
  static Either<Failure, CollaborativeDocDeltaUpdaterStatusEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocDeltaUpdaterStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
