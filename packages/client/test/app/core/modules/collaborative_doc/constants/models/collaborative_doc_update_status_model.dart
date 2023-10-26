import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/data/data.dart';

class ConstantCollaborativeDocUpdateStatusModel {
  static CollaborativeDocUpdateStatusModel get successCase =>
      const CollaborativeDocUpdateStatusModel(isUpdated: true);
  static CollaborativeDocUpdateStatusModel get notSuccessCase =>
      const CollaborativeDocUpdateStatusModel(isUpdated: false);
  static Either<Failure, CollaborativeDocUpdateStatusModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocUpdateStatusModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
