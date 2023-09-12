import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/data/data.dart';

class ConstantCollaborativeDocDeltaUpdaterStatusModel {
  static CollaborativeDocDeltaUpdaterStatusModel get successCase =>
      const CollaborativeDocDeltaUpdaterStatusModel(isUpdated: true);
  static CollaborativeDocDeltaUpdaterStatusModel get notSuccessCase =>
      const CollaborativeDocDeltaUpdaterStatusModel(isUpdated: false);
  static Either<Failure, CollaborativeDocDeltaUpdaterStatusModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocDeltaUpdaterStatusModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
