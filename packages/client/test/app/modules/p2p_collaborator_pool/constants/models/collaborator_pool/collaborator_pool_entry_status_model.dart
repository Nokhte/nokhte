import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/data/models/models.dart';

class ConstantCollaboratorPoolEntryStatusModel {
  static CollaboratorPoolEntryStatusModel get successCase =>
      const CollaboratorPoolEntryStatusModel(hasEntered: true);
  static CollaboratorPoolEntryStatusModel get notSuccessCase =>
      const CollaboratorPoolEntryStatusModel(hasEntered: false);
  static Either<Failure, CollaboratorPoolEntryStatusModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaboratorPoolEntryStatusModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
