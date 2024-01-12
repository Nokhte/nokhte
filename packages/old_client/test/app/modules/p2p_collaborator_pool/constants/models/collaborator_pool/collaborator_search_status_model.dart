import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/data/models/models.dart';

class ConstantCollaboratorSearchStatusStatusModel {
  static CollaboratorSearchStatusModel get successCase =>
      CollaboratorSearchStatusModel(
          searchAndEntryStatusStream: Stream.value(true));
  static CollaboratorSearchStatusModel get notSuccessCase =>
      CollaboratorSearchStatusModel(
          searchAndEntryStatusStream: Stream.value(false));

  static Either<Failure, CollaboratorSearchStatusModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaboratorSearchStatusModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
