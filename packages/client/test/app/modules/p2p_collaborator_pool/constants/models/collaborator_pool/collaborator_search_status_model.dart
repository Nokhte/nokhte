import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/data/models/models.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

class ConstantCollaboratorSearchStatusStatusModel {
  static CollaboratorSearchStatusModel get successCase =>
      CollaboratorSearchStatusModel(
          searchAndEntryStatusStream: Stream.value(
              CollaboratorSearchAndEntryStatus(
                  hasEntered: false, hasFoundTheirCollaborator: true)));
  static CollaboratorSearchStatusModel get notSuccessCase =>
      CollaboratorSearchStatusModel(
          searchAndEntryStatusStream: Stream.value(
              CollaboratorSearchAndEntryStatus(
                  hasEntered: false, hasFoundTheirCollaborator: false)));

  static Either<Failure, CollaboratorSearchStatusModel>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaboratorSearchStatusModel>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
