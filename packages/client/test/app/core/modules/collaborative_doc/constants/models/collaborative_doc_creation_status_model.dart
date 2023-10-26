import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/data/data.dart';

class ConstantCollaborativeDocCreationStatusModel {
  static CollaborativeDocCreationStatusModel get successCase =>
      const CollaborativeDocCreationStatusModel(isCreated: true);
  static CollaborativeDocCreationStatusModel get notSuccessCase =>
      const CollaborativeDocCreationStatusModel(isCreated: false);
  static Either<Failure, CollaborativeDocCreationStatusModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocCreationStatusModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
