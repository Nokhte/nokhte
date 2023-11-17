import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:nokhte_backend/tables/working_collaborative_documents.dart';

class ConstantCollaborativeDocCollaboratorInfoEntity {
  static CollaborativeDocCollaboratorInfoEntity get successCase =>
      CollaborativeDocCollaboratorInfoEntity(
        collaboratorDocInfo: Stream.value(
          CollaboratorDocInfo(
            isPresent: true,
            delta: 2,
          ),
        ),
      );
  static CollaborativeDocCollaboratorInfoEntity get notSuccessCase =>
      CollaborativeDocCollaboratorInfoEntity(
        collaboratorDocInfo: Stream.value(
          CollaboratorDocInfo(
            isPresent: true,
            delta: 2,
          ),
        ),
      );
  static Either<Failure, CollaborativeDocCollaboratorInfoEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocCollaboratorInfoEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
