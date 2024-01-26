import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

class ConstantCollaborativeDocCreationStatusEntity {
  static CollaborativeDocCreationStatusEntity get successCase =>
      const CollaborativeDocCreationStatusEntity(isCreated: true);
  static CollaborativeDocCreationStatusEntity get notSuccessCase =>
      const CollaborativeDocCreationStatusEntity(isCreated: false);
  static Either<Failure, CollaborativeDocCreationStatusEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocCreationStatusEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
