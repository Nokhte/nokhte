import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

class ConstantCollaborativeDocUpdateStatusEntity {
  static CollaborativeDocUpdateStatusEntity get successCase =>
      const CollaborativeDocUpdateStatusEntity(isUpdated: true);
  static CollaborativeDocUpdateStatusEntity get notSuccessCase =>
      const CollaborativeDocUpdateStatusEntity(isUpdated: false);
  static Either<Failure, CollaborativeDocUpdateStatusEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocUpdateStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
