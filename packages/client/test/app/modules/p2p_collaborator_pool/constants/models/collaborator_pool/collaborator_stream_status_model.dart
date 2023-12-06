import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/data/models/models.dart';

class ConstantCollaboratorStreamStatusModel {
  static CollaboratorStreamStatusModel get successCase =>
      const CollaboratorStreamStatusModel(isSubscribed: true);
  static CollaboratorStreamStatusModel get notSuccessCase =>
      const CollaboratorStreamStatusModel(isSubscribed: false);
  static Either<Failure, CollaboratorStreamStatusModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaboratorStreamStatusModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
