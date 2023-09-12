import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala_backend/working_collaborative_documents.dart';

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
