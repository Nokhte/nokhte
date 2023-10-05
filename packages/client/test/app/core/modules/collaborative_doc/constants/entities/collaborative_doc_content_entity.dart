import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';
import 'package:primala_backend/working_collaborative_documents.dart';

class ConstantCollaborativeDocContentEntity {
  static CollaborativeDocContentEntity get successCase =>
      CollaborativeDocContentEntity(
        docContent: Stream.value(
          DocInfoContent(
            content: "content",
            lastEditedBy: "lastEditedBy",
            currentUserUID: "lastEditedBy",
            collaboratorsCommitDesireStatus: true,
            documentCommitStatus: true,
          ),
        ),
      );
  static CollaborativeDocContentEntity get notSuccessCase =>
      CollaborativeDocContentEntity(
        docContent: Stream.value(
          DocInfoContent(
            content: "",
            lastEditedBy: "",
            currentUserUID: "",
            collaboratorsCommitDesireStatus: false,
            documentCommitStatus: false,
          ),
        ),
      );
  static Either<Failure, CollaborativeDocContentEntity>
      get wrappedSuccessCase => Right(successCase);
  static Either<Failure, CollaborativeDocContentEntity>
      get wrappedNotSuccessCase => Right(notSuccessCase);
}
